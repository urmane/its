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
local ActorAI = require "engine.interface.ActorAI"
local Faction = require "engine.Faction"
require "mod.class.Actor"

module(..., package.seeall, class.inherit(mod.class.Actor, engine.interface.ActorAI))

function _M:init(t, no_default)
	mod.class.Actor.init(self, t, no_default)
	ActorAI.init(self, t)
end

function _M:act()
	-- Do basic actor stuff
	if not mod.class.Actor.act(self) then return end

	-- Compute FOV, if needed
	self:computeFOV(self.sight or 20)

	-- Let the AI think .... beware of Shub !
	-- If AI did nothing, use energy anyway
	self:doAI()
	if not self.energy.used then self:useEnergy() end
end

--- Called by ActorLife interface
-- We use it to pass aggression values to the AIs
function _M:onTakeHit(value, src)
	if not self.ai_target.actor and src.targetable then
		self.ai_target.actor = src
	end

	return mod.class.Actor.onTakeHit(self, value, src)
end

function _M:tooltip()
	local str = mod.class.Actor.tooltip(self)
	return str..([[

Target: %s
UID: %d]]):format(
	self.ai_target.actor and self.ai_target.actor.name or "none",
	self.uid)
end


--- this is function computeFOV from engine/interface/ActorFOV.lua
--- might also need to mod function computeFOVBeam from engine/interface/ActorFOV.lua
---
--- This is where I think I need to modify the engine code to add the option of NPCs not seeing the player based on lighting
--- Default t-engine/tome behavior appears to be that an NPC is aware of player if NPC has LOS within sight range - only block_sight stops FOV
--- It appears to be the same in both example and TOME mods; even though TOME has more code, it's mostly to restrict/enhance player display (ie visibility)
---
--- Add a check against Actor.canSee() in the below code, that way NPCs will check just like players do
--- add actual visibility code there

--- Computes actor's FOV
-- @param radius the FOV radius, defaults to 20
-- @param block the property to look for FOV blocking, defaults to "block_sight"
-- @param apply an apply function that will be called on each seen grids, defaults to nil
-- @param force set to true to force a regeneration even if we did not move
-- @param no_store do not store FOV informations
-- @param cache if true it will use the cache given by the map, for the map actor. It can be used for other actors is they have the same block settings
function _M:computeFOV(radius, block, apply, force, no_store, cache)
        -- If we did not move, do not update
        if not self.x or not self.y or (not force and self.fov_last_x == self.x and self.fov_last_y == self.y and self.fov_computed) then return end
        radius = radius or 20
        block = block or "block_sight"

        -- Simple FOV compute no storage
        if no_store and apply then
                local map = game.level.map
                core.fov.calc_circle(self.x, self.y, map.w, map.h, radius, function(_, x, y)
                        if map:checkAllEntities(x, y, block, self) then return true end
                end, function(_, x, y, dx, dy, sqdist)
                        apply(x, y, dx, dy, sqdist)
                end, cache and game.level.map._fovcache[block])

        -- FOV + storage + fast C code
        elseif not no_store and cache and game.level.map._fovcache[block] then
                local fov = {actors={}, actors_dist={}}
                setmetatable(fov.actors, {__mode='k'})
                setmetatable(fov.actors_dist, {__mode='v'})

                -- Use the fast C code
                local map = game.level.map
                core.fov.calc_default_fov(
                        self.x, self.y,
                        radius,
                        block,
                        game.level.map._fovcache[block],
                        fov.actors, fov.actors_dist,
                        map.map, map.w, map.h,
                        Map.ACTOR,
                        self.distance_map,
                        game.turn,
                        self,
                        apply
                )

                table.sort(fov.actors_dist, "__sqdist")
--              print("Computed FOV for", self.uid, self.name, ":: seen ", #fov.actors_dist, "actors closeby")

                self.fov = fov
                self.fov_last_x = self.x
                self.fov_last_y = self.y
                self.fov_last_turn = game.turn
                self.fov_last_change = game.turn
                self.fov_computed = true
        elseif not no_store then
                local fov = {actors={}, actors_dist={}}
                setmetatable(fov.actors, {__mode='k'})
                setmetatable(fov.actors_dist, {__mode='v'})

                local map = game.level.map
                core.fov.calc_circle(self.x, self.y, map.w, map.h, radius, function(_, x, y)
                        if map:checkAllEntities(x, y, block, self) then return true end
                end, function(_, x, y, dx, dy, sqdist)
                        if apply then apply(x, y, dx, dy, sqdist) end

                        if self.__do_distance_map then self.distance_map[x + y * game.level.map.w] = game.turn + radius - math.sqrt(sqdist) end

                        -- Note actors
                        local a = map(x, y, engine.Map.ACTOR)
                        -- Original, doesn't check visibility:
			-- if a and a ~= self and not a.dead then
                        if a and a ~= self and not a.dead and self:canSee(a) then
                                local t = {x=x,y=y, dx=dx, dy=dy, sqdist=sqdist}
                                fov.actors[a] = t
                                fov.actors_dist[#fov.actors_dist+1] = a
                                a.__sqdist = sqdist
                                a:check("seen_by", self)
                                a:updateFOV(self, t.sqdist)
                        end
                end, cache and game.level.map._fovcache[block])

                -- Sort actors by distance (squared but we do not care)
                table.sort(fov.actors_dist, "__sqdist")
              print("Computed FOV for", self.uid, self.name, ":: seen ", #fov.actors_dist, "actors closeby")

                self.fov = fov
                self.fov_last_x = self.x
                self.fov_last_y = self.y
                self.fov_last_turn = game.turn
                self.fov_last_change = game.turn
                self.fov_computed = true
        end
end