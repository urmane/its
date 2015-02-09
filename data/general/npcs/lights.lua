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
	define_as = "BASE_LIGHT",
	type = "light", subtype = "light",
	display = "*", color=colors.YELLOW,
	desc = [[A stationary light.]],
	ai = "none",
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
}

newEntity{ base = "BASE_LIGHT",
	name = "torch", color=colors.YELLOW,
	desc = [[A wall-mounted sconce with a lit torch.]],
	image = "npcs/torch.png",
	level_range = {1, 4}, exp_worth = 0,
	rarity = 4,
	lite = 3,		-- radius of the light this actor puts out
	lite_pulse = 90,        -- percent chance per turn to mod lite
	lite_pulse_step = 1,    -- amount and step to inc/dec
	lite_min = 2,           -- min radius
	lite_max = 4,           -- max radius
	sight = 1,		-- absolute limit of sight
	sight_min = 1,		-- minimum light level this actor can distinguish
	max_life = 1,
	combat = { dam=1 },
}

newEntity{ base = "BASE_LIGHT",
	name = "brazier", color=colors.ORANGE,
	desc = [[A low, wide brass pan full of glowing coals.]],
	level_range = {1, 4}, exp_worth = 0,
	rarity = 4,
	lite = 5,		-- radius of the light this actor puts out
	lite_pulse = 20,        -- percent chance per turn to mod lite
	lite_pulse_step = 1,    -- amount and step to inc/dec
	lite_min = 1,           -- min radius
	lite_max = 2,           -- max radius
	sight = 1,		-- absolute limit of sight
	sight_min = 1,		-- minimum light level this actor can distinguish
	max_life = 1,
	combat = { dam=1 },
}

