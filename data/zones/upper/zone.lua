-- ITS - In The Shadows
-- Copyright (C) 2015, 2016, 2017 James Niemira
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
-- James Niemira "urmane"
-- jim.niemira@gmail.com

local Dialog = require "engine.ui.Dialog"

return {
	name = "Upper Class Neighborhoods",
	zone_key = "upper",
	level_range = {1, 3},
	max_level = 3,
	decay = {300, 800},
	persistent = "zone",
	ambient_light = 100,
	--ambient_music = "prison2.ogg",
	generator =  {
        map = {
            class = "engine.generator.map.Static",
        },
		object = {
			class = "engine.generator.object.Random",
			nb_object = {20, 30},
		},
		up = "UP",
		down = "DOWN",
	},
	levels = {
        --[1] = { width = 70, height = 70, generator = { map = { class = "engine.generator.map.Static", map = "zones/gora-prison1", }, }, },
		[1] = { width = 64, height = 64, name = "The Plantation", generator = { map = { map = "zones/upper1", }, }, },
		[2] = { width = 64, height = 64, name = "The Manors",     generator = { map = { map = "zones/upper2", }, }, },
		[3] = { width = 64, height = 65, name = "The Estates",    generator = { map = { map = "zones/upper3", }, }, },
		[4] = { width = 40, height = 40, name = "The Heights",    generator = { map = { map = "zones/upper4", }, }, },
		[5] = { width = 40, height = 40, name = "Country Club",   generator = { map = { map = "zones/upper5", }, }, },
	},

    post_process = function(l)
        
    end,

	on_leave = function(lev, old_lev, newzone)
        
    end,

	on_enter = function(lev, old_lev, newzone)
       
    end,
}
