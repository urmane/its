-- ToME - Tales of Middle-Earth
-- Copyright (C) 2009, 2010, 2011, 2012 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

require "engine.class"
require "engine.Actor"
require "engine.Autolevel"
require "engine.interface.ActorTemporaryEffects"
require "engine.interface.ActorLife"
require "engine.interface.ActorProject"
require "engine.interface.ActorLevel"
require "engine.interface.ActorStats"
require "engine.interface.ActorInventory"
require "engine.interface.ActorTalents"
require "engine.interface.ActorResource"
require "engine.interface.ActorFOV"
require "mod.class.interface.ActorPartyQuest"
require "mod.class.interface.Combat"
local Map = require "engine.Map"

module(..., package.seeall, class.inherit(
	engine.Actor,
	engine.interface.ActorInventory,
	engine.interface.ActorTemporaryEffects,
	engine.interface.ActorLife,
	engine.interface.ActorProject,
	engine.interface.ActorLevel,
	engine.interface.ActorStats,
	engine.interface.ActorTalents,
	engine.interface.ActorResource,
	engine.interface.ActorFOV,
	mod.class.interface.ActorPartyQuest,
	mod.class.interface.Combat
))

function _M:init(t, no_default)
	-- Define some basic combat stats
	self.combat_armor = 0
	self.lite = t.lite or 0 -- how much light I put out - natural, or implicit torch, etc

	-- Default regen
	t.power_regen = t.power_regen or 1
	t.life_regen = t.life_regen or 0.25 -- Life regen real slow

	-- Default melee barehanded damage
	self.combat = { dam=1 }

	-- Moneys held
	self.gold = 0

	engine.Actor.init(self, t, no_default)
	engine.interface.ActorTemporaryEffects.init(self, t)
	engine.interface.ActorLife.init(self, t)
	engine.interface.ActorProject.init(self, t)
	engine.interface.ActorInventory.init(self, t)
	engine.interface.ActorTalents.init(self, t)
	engine.interface.ActorResource.init(self, t)
	engine.interface.ActorStats.init(self, t)
	engine.interface.ActorLevel.init(self, t)
	engine.interface.ActorFOV.init(self, t)
end

function _M:act()
	if not engine.Actor.act(self) then return end

	self.changed = true

	-- Cooldown talents
	self:cooldownTalents()
	-- Regen resources
	self:regenLife()
	self:regenResources()
	-- Compute timed effects
	self:timedEffects()

	-- Still enough energy to act ?
	if self.energy.value < game.energy_to_act then return false end

	return true
end

function _M:move(x, y, force)
	local moved = false
	local ox, oy = self.x, self.y
	if self:attr("never_move") then
	    game.logPlayer(self, "You cannot move.")
	    return moved
	end
	if force or self:enoughEnergy() then
		moved = engine.Actor.move(self, x, y, force)
		if not force and moved and (self.x ~= ox or self.y ~= oy) and not self.did_energy then
			self:useEnergy()
			spd = self.move_speed or "normal"
			if self.move_sounds and self.move_sounds[spd] then
				game:playSoundNear(self, self.move_sounds[spd])
			end
		end
	end
	self.did_energy = nil
	return moved
end

function _M:tooltip()
	return ([[%s%s
#00ffff#Level: %d
#ff0000#HP: %d (%d%%)
Stats: %d /  %d / %d
%s]]):format(
	self:getDisplayString(),
	self.name,
	self.level,
	self.life, self.life * 100 / self.max_life,
	self:getStr(),
	self:getSns(),
	self:getDex(),
	self.desc or ""
	)
end

function _M:onTakeHit(value, src)
	return value
end

function _M:die(src)
	engine.interface.ActorLife.die(self, src)

	-- Gives the killer some exp for the kill
	if src and src.gainExp then
		src:gainExp(self:worthExp(src))
	end

	return true
end

function _M:levelup()
	self.max_life = self.max_life + 2

	self:incMaxPower(3)

	-- Heal upon new level
	self.life = self.max_life
	self.power = self.max_power
end

--- Notifies a change of stat value
function _M:onStatChange(stat, v)
	if stat == self.STAT_CON then
		self.max_life = self.max_life + 2
	end
end

function _M:attack(target)
	self:bumpInto(target)
end


--- Called before a talent is used
-- Check the actor can cast it
-- @param ab the talent (not the id, the table)
-- @return true to continue, false to stop
function _M:preUseTalent(ab, silent)
	if not self:enoughEnergy() then print("fail energy") return false end

	if ab.mode == "sustained" then
		if ab.sustain_power and self.max_power < ab.sustain_power and not self:isTalentActive(ab.id) then
			game.logPlayer(self, "You do not have enough power to activate %s.", ab.name)
			return false
		end
	else
		if ab.power and self:getPower() < ab.power then
			game.logPlayer(self, "You do not have enough power to cast %s.", ab.name)
			return false
		end
	end

	if not silent then
		-- Allow for silent talents
		if ab.message ~= nil then
			if ab.message then
				game.logSeen(self, "%s", self:useTalentMessage(ab))
			end
		elseif ab.mode == "sustained" and not self:isTalentActive(ab.id) then
			game.logSeen(self, "%s activates %s.", self.name:capitalize(), ab.name)
		elseif ab.mode == "sustained" and self:isTalentActive(ab.id) then
			game.logSeen(self, "%s deactivates %s.", self.name:capitalize(), ab.name)
		else
			game.logSeen(self, "%s uses %s.", self.name:capitalize(), ab.name)
		end
	end
	return true
end

--- Called before a talent is used
-- Check if it must use a turn, mana, stamina, ...
-- @param ab the talent (not the id, the table)
-- @param ret the return of the talent action
-- @return true to continue, false to stop
function _M:postUseTalent(ab, ret)
	if not ret then return end

	self:useEnergy()

	if ab.mode == "sustained" then
		if not self:isTalentActive(ab.id) then
			if ab.sustain_power then
				self.max_power = self.max_power - ab.sustain_power
			end
		else
			if ab.sustain_power then
				self.max_power = self.max_power + ab.sustain_power
			end
		end
	else
		if ab.power then
			self:incPower(-ab.power)
		end
	end

	return true
end

--- Return the full description of a talent
-- You may overload it to add more data (like power usage, ...)
function _M:getTalentFullDescription(t)
	local d = {}

	if t.mode == "passive" then d[#d+1] = "#6fff83#Use mode: #00FF00#Passive"
	elseif t.mode == "sustained" then d[#d+1] = "#6fff83#Use mode: #00FF00#Sustained"
	else d[#d+1] = "#6fff83#Use mode: #00FF00#Activated"
	end

	if t.power or t.sustain_power then d[#d+1] = "#6fff83#Power cost: #7fffd4#"..(t.power or t.sustain_power) end
	if self:getTalentRange(t) > 1 then d[#d+1] = "#6fff83#Range: #FFFFFF#"..self:getTalentRange(t)
	else d[#d+1] = "#6fff83#Range: #FFFFFF#melee/personal"
	end
	if t.cooldown then d[#d+1] = "#6fff83#Cooldown: #FFFFFF#"..t.cooldown end

	return table.concat(d, "\n").."\n#6fff83#Description: #FFFFFF#"..t.info(self, t)
end

--- How much experience is this actor worth
-- @param target to whom is the exp rewarded
-- @return the experience rewarded
function _M:worthExp(target)
	if not target.level or self.level < target.level - 3 then return 0 end

	local mult = 2
	if self.unique then mult = 6
	elseif self.egoed then mult = 3 end
	return self.level * mult * self.exp_worth
end

--- Can self see the target actor
-- This does not check LOS or such, only the actual ability to see it.
-- Check for telepathy, invisibility, stealth, ...
-- How is this def_pct used, and how is the pct returned as 2nd arg used?
--   Provocative, might be useful instead of / in addition to light_level
function _M:canSee(actor, def, def_pct)
	if not actor then return false, 0 end
	if self.player then
		--print("[DBG-canSee]checking against actor ", actor.name or "none".." uid "..actor.uid)
	end

    -- magic:
    if self.player and type(def) == "nil" and actor and actor._mo then
        actor._mo:onSeen(res)
    end

	-- new new new algorithm
	-- if carrying lite, works "normal".  For ITS, normally we won't have a lite
	-- ambient light only used if not carrying lite
	-- in that case acts like lite rad of ambient + self.nightvision
	-- and can see distant lites (how to implement separate from "normal"?)

	-- Error conditions
	-- NB: for the player, self.x/y might be "none" at level create!
	if not (self.x and self.y and actor.x and actor.y) then
		-- if self.player then
		-- 	print("[DBG-canSee]not on map, player cannot see "..actor.name.." uid "..actor.uid)
		-- 	print("[DBG-canSee]   self.x is ", self.x or "none")
		-- 	print("[DBG-canSee]   self.x is ", self.x or "none")
		-- 	print("[DBG-canSee]   self.x is ", self.x or "none")
		-- 	print("[DBG-canSee]   self.x is ", self.x or "none")
		-- end
		return false, 0
	end

	-- Can always see self
	if actor == self then return true, 100 end

	-- Is he too far away for my ability to see?
	-- NB: check this against the FOV fns, this might be a redundant check
	local dist = core.fov.distance(self.x, self.y, actor.x, actor.y)
	if self.sight and self.sight < dist then
		-- if self.player then
		-- 	print("[DBG-canSee]too far, player cannot see "..actor.name.." uid "..actor.uid)
		-- 	print("[DBG-canSee]   self.sight is "..self.sight)
		-- 	print("[DBG-canSee]   dist is "..dist)
		-- end
		return false, 0
	end

	-- Must have light, either theirs, ours, or ambient
	-- NB: should just be able to see if map:x,y is lit, or ambient
	if actor.lite and actor.lite > 0 then
		--print ("[DBG-canSee] seen: actor "..actor.name.." is carrying a lite")
		return true, 100
	else
		--print ("[DBG-canSee] continue: actor "..actor.name.." is not carrying a lite")
		if self.lite and self.lite > 0 and dist <= self.lite then
			--print ("[DBG-canSee] seen: actor "..actor.name.." is inside my lite radius")
			return true, 100
		else
			--print ("[DBG-canSee] continue: actor "..actor.name.." is not inside my lite radius")
			if game.level and game.level.data and game.level.data.ambient_light then
				if (self.nightvision and dist <= (game.level.data.ambient_light + self.nightvision)) or
				    dist <= game.level.data.ambient_light then
					--print ("[DBG-canSee] seen: actor "..actor.name.." is visible in ambient light")
					return true, 100
				else
					return false, 0
				end
			else
				--print ("[DBG-canSee] unseen: actor "..actor.name.." is not visible in any light")
				return false, 0
			end
		end
	end

	-- redo the above loop if we need to check additional states - eg invisibility
	-- if we get here, target is lit, somehow, and visible
	-- Note that this means the default is seen
--[[
	if actor.attr("hide") and actor.attr("hide") > 0 then
        if self.getSns() < actor.attr("hide") then
            return false, 0
        end
	end
]]--
	return true, 100
end

function _M:canHear(actor, def, def_pct)
	if not actor then return false, 0 end
	if self.player then
		--print("[DBG-canSee]checking against actor ", actor.name or "none".." uid "..actor.uid)
	end

    -- magic:
    if self.player and type(def) == "nil" and actor and actor._mo then
        actor._mo:onHeard(res)
    end

    if actor == self then return true, 100 end

    return true, 100
end


function _M:canFeel(actor, def, def_pct)
	if not actor then return false, 0 end
	if self.player then
		--print("[DBG-canSee]checking against actor ", actor.name or "none".." uid "..actor.uid)
	end

    -- magic:
    if self.player and type(def) == "nil" and actor and actor._mo then
        actor._mo:onFelt(res)
    end

    if actor == self then return true, 100 end

    return true, 100
end


function _M:canSmell(actor, def, def_pct)
	if not actor then return false, 0 end
	if self.player then
		--print("[DBG-canSee]checking against actor ", actor.name or "none".." uid "..actor.uid)
	end

    -- magic:
    if self.player and type(def) == "nil" and actor and actor._mo then
        actor._mo:onSmelt(res)
    end

    if actor == self then return true, 100 end

    return true, 100
end

--- Can the target be applied some effects
-- @param what a string describing what is being tried
function _M:canBe(what)
	if what == "poison" and rng.percent(100 * (self:attr("poison_immune") or 0)) then return false end
	if what == "cut" and rng.percent(100 * (self:attr("cut_immune") or 0)) then return false end
	if what == "confusion" and rng.percent(100 * (self:attr("confusion_immune") or 0)) then return false end
	if what == "blind" and rng.percent(100 * (self:attr("blind_immune") or 0)) then return false end
	if what == "stun" and rng.percent(100 * (self:attr("stun_immune") or 0)) then return false end
	if what == "fear" and rng.percent(100 * (self:attr("fear_immune") or 0)) then return false end
	if what == "knockback" and rng.percent(100 * (self:attr("knockback_immune") or 0)) then return false end
	if what == "instakill" and rng.percent(100 * (self:attr("instakill_immune") or 0)) then return false end
	return true
end
