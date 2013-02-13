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

-- thief's tools, diggers, climber, gemcutter? holy symbol, writing(scroll?), pole (why?), mechanism/device, flint-and-steel

local FlyingText = require "engine.FlyingText"

newEntity{
    define_as = "BASE_LOCKPICK",
    slot = "TOOL",
    type = "tool", subtype="lockpick",
    display = "/",
    color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    -- combat = { sound = "actions/lockpick", sound_miss = "actions/melee_miss", },
    name = "a generic lockpick",
    desc = [[One or more strong, shaped wires or keys used to open locks.]],
    use_simple = { name = "Unlock that which is locked.", use = function(self, who)
                local tg = {type="bolt", range=1, nolock=true}
                local x, y = who:getTarget(tg)
                if not x or not y then return nil end
		local door = game.level.map(x, y, engine.Map.TERRAIN) -- only works on doors (TERRAIN) right now
		if door.door_unlocked then
			print("unlocking at ", x, ",", y)
			game.level.map(x, y, engine.Map.TERRAIN, game.zone.grid_list[door.door_unlocked])
			local sx, sy = game.level.map:getTileToScreen(x, y)
			game.flyers:add(sx, sy, 10, 0, -1, "Unlocked!", {0,255,0}, false)
		else
			print("cannot unlock at", x, ",", y)
		end
                return {id=true, used=true}
        end},

}

newEntity{ base = "BASE_LOCKPICK", name = "makeshift lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "iron lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "steel lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "basic thief's tools", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "professional thief's tools", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "locksmith's tools", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "professional locksmith's tools", level_range = {1, 10}, cost = 1, }
