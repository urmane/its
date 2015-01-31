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

newEntity{
    define_as = "BASE_SUITARMOR", slot = "TORSO", slot_forbid = "ARMS",
    type = "armor", subtype="suit", display = "/", color=colors.SLATE,
    encumber = 3, rarity = 5,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    name = "a generic armor",
    desc = [[A crunchy shell.]],
}

local function newArmor(name, image, color, cost, enc, rarity, min_level, max_level, def, armor)
	print ("defining ",name:lower())
        newEntity{ base = "BASE_SUITARMOR", --define_as = "GEM_"..name:gsub(" ", "_"):upper(),
                name = name:lower(),
                image = image, color = color, rarity = rarity, cost = cost, encumber = enc,
                level_range = {min_level, max_level},
        }
end

newArmor("leather armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
newArmor("hide armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
newArmor("bronze armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
newArmor("iron armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
newArmor("steel armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
newArmor("powered armor", "object/armor.png", colors.UMBER, 1, 20, 1, 1, 10, 1, 1)
