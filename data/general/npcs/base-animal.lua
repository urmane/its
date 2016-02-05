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

local Talents = require("engine.interface.ActorTalents")

load("/data/general/npcs/base-living.lua")

newEntity{
	base = "BASE_LIVING",
	define_as = "BASE_ANIMAL",
    keywords = {animal=true},
	display = "X",
    color=colors.WHITE,
	image = "npcs/trolldoll.png",
	stats = { str=1, dex=1, con=1 },
	combat_armor = 0,
    sight = 2,
    sight_min = 0,
    on_acquire_target = function(act)
        if act.x and act.y then
            local sx, sy = game.level.map:getTileToScreen(act.x, act.y)
            game.flyers:add(sx, sy, 20, 0, -1, "Aware!", {255,0,0}, false)
        end
    end,
    on_bump = function(act)
        if act.x and act.y then
            local sx, sy = game.level.map:getTileToScreen(act.x, act.y)
            game.flyers:add(sx, sy, 20, 0, -1, "Ouch!", {0,255,0}, false)
        end
    end,
}


