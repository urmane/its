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

newEntity{
	define_as = "BASE_PRISONER",
	type = "humanoid", subtype = "prisoner",
	display = "P", color=colors.WHITE,
	desc = [[A wretched, tortured mess of rags and flesh.]],
	image = "npcs/Trolldoll2.png",
	ai = "none", -- ai_state = { talent_in=3, },
	stats = { str=1, dex=1, con=1 },
	combat_armor = 0,
}

newEntity{
	define_as = "BASE_GUARD",
	type = "humanoid", subtype = "guard",
	display = "G", color=colors.WHITE,
	desc = [[Ugly and ill-tempered.]],
	image = "npcs/Trolldoll2.png",

	-- ai = "dumb_talented_simple", ai_state = { talent_in=3, },
	ai = "guard_wander",
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
}

newEntity{ base = "BASE_GUARD",
	name = "prisonguard", color=colors.GREEN,
	level_range = {1, 4}, exp_worth = 1,
	rarity = 4,
	lite = 8,		-- radius of the light this actor puts out
        lite_flicker = 90,      -- percent chance per turn to mod lite
        lite_min = 2,           -- min radius
        lite_max = 8,           -- max radius
	sight = 20,		-- absolute limit of sight
	sight_min = 5,		-- minimum light level this actor can distinguish
	move_dir = 2,		-- initial move direction, they'll rotate clockwise 90 degrees for now
	max_life = resolvers.rngavg(5,9),
	combat = { dam=2 },
}

