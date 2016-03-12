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

return {
	name = "Murmon",
	zone_key = "murmon",
	level_range = {1, 1},
	max_level = 3,
	decay = {300, 800},
	persistent = "zone",
	ambient_light = 1,
    width = 64, height = 64,
	generator =  {
        map = {
            class = "engine.generator.map.Cavern",
            zoom = 30,
            up = "UP",
            down = "DOWN",
            wall = "WALL",
            floor = "FLOOR",
            door = "FLOOR",
        },
		object = {
			class = "engine.generator.object.Random",
			nb_object = {20, 30},
		},
        actor = {
           class = "engine.generator.actor.Random",
           nb_npc = {45, 50},
        },
  --       trap = {
  --          class = "engine.generator.trap.Random",
  --          nb_trap = {0, 0},
  --       },
	},
	levels = {
		[1] = {
            generator = { map = {
                up = "TO_WORLDMAP",
            }, },
        },
        [2] = {
            generator = { map = {
                width = 256, height = 256,
                zoom = 20,
            }, },
        },
        [3] = {
            no_level_connectivity = true,
            generator = { map = {
                width = 256, height = 256,
                zoom = 10,
            }, },
        },
	},
--	on_leave = function(lev, old_lev, newzone)
--                if lev.level == 1 then
--                        -- we know this is the first time through?
--                        game.player:setQuestStatus("start", engine.Quest.COMPLETED)
--                end
--        end,
--	on_enter = function(lev, old_lev, newzone)
--		--if lev.level == 3 then
--		if lev and lev == 3 then
--			local Dialog = require("engine.ui.Dialog")
--			Dialog:simpleLongPopup("Terror", [[Best not linger here too long.]],400)
--			if not game.player:hasQuest("start-escape-graveyard") then
--				game.player:grantQuest("start-escape-graveyard")
--			end
--		end
--	end,
}
