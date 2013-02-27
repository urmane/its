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

load("/data/general/grids/basic.lua")


newEntity{
        define_as = "TREE",
        type = "wall", subtype = "tree",
        name = "tree",
--        image = "terrain/tree.png",
        display = '#', color=colors.LIGHT_GREEN, back_color={r=44,g=95,b=43},
        always_remember = true,
        does_block_move = true,
        block_sight = true,
--        block_sense = true,
--        block_esp = true,
}

newEntity{
        define_as = "OCEAN",
        type = "wall", subtype = "grass",
        name = "ocean",
--        image = "terrain/ocean.png",
        display = '~', color=colors.LIGHT_BLUE, back_color={r=0,g=0,b=255},
        always_remember = true,
        does_block_move = true,
        block_sight = false,
--        block_sense = true,
--        block_esp = true,
}

newEntity{
        define_as = "LAND",
        type = "floor", subtype = "grass",
        name = "land",
--        image = "terrain/land.png",
        display = '.', color=colors.TAN, back_color={r=100,g=100,b=100},
        always_remember = true,
        does_block_move = false,
        block_sight = false,
}
