-- based on weather_vapours.lua from TOME:
-- 
-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2014 Nicolas Casalini
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
    frag = "weather_vapours",
    vert = nil,
    args = {
        color = color or {0.8, 1, 1, 1},
        npow = npow or 1,
        evolve_factor = evolve_factor or 160000,
        move_factor = move_factor or 100000,
        zoom = zoom or 0.5,
    },
    clone = false,
}

