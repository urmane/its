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
	name = "The World of Afeedi",
	level_range = {1, 1},
	max_level = 1,
	decay = {300, 800},
	persistent = "zone",
	width = 256,
	height = 256,
	startx = 15,
	starty = 171,
	endx = 15,
	endy = 171,
	all_lited = true,
	generator =  {
        	map = {
            		class = "mod.class.generator.map.RandomWorld",
			map = "afeedi/afeedi",
			land = "LAND",
			ocean = "OCEAN",
			noise = "simplex",
			zoom = 11,
			hurst = 0.16,
			lacunarity = 9,
			octave = 1,
			border_div = 0,           -- border width
			border_terrain = "ocean", -- border terrain
			min_land = 12000,
        	},
	},
}
