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
load("/data/general/grids/town.lua")

newEntity{
    define_as = "TO_ATARLO",
    name = "Exit to the World Map",
    display = '<', color_r=255, color_g=0, color_b=255, back_color=colors.DARK_GREY,
    always_remember = true,
    notice = true,
    change_level = 1,
    change_zone = "world-of-afeedi",
}

newEntity{
    define_as = "TO_UNDERWORLD",
    name = "Enter the Underworld",
    display = '>', color_r=255, color_g=0, color_b=255, back_color=colors.DARK_GREY,
    always_remember = true,
    notice = true,
    change_level = 1,
    change_zone = "underworld",
}
