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
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the -- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

local Stats = require "engine.interface.ActorStats"

newEntity{
	define_as = "BASE_GEM",
	type = "gem", subtype="white",
	display = "*", color=colors.YELLOW,
	encumber = 0, slot = "GEM", use_no_wear = true,
	identified = true,
	stacking = true,
	auto_pickup = true, pickup_sound = "actions/gem",
	desc = [[Sparkly bits of polished rock.]],
}

local function newGem(name, image, subtype, cost, rarity, min_level, max_level)
	-- Gems, randomly lootable
	newEntity{ base = "BASE_GEM", define_as = "GEM_"..name:gsub(" ", "_"):upper(),
		name = name:lower(),
		image=image, subtype = subtype, rarity = rarity, cost = cost,
		level_range = {min_level, max_level},
	}
end

newGem("Black Pearl"," object/gem.png", "black", 1000, 100, 8, 10)
newGem("Pearl",     "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Opal",     "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Emerald",   "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Turquoise", "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Sapphire",  "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Emerald",   "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Ruby",      "object/gem.png", "white", 1000, 100, 8, 10)
newGem("Diamond",   "object/gem.png", "white", 1000, 100, 8, 10)
