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

-- thief's tools, diggers, climber, gemcutter? holy symbol, writing(scroll?), pole (why?), mechanism/device, flint-and-steel

newEntity{
    define_as = "BASE_SWORD",
    slot = "WEAPON",
--     slot_forbid = "SHIELD",
    type = "weapon", subtype="sword",
    display = "/",
    color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    name = "a generic sword",
    desc = [[A long, sharp object used for poking holes in monsters.]],
}

-- original
-- newEntity{ base = "BASE_SWORD", name = "brass sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }

newEntity{ base = "BASE_SWORD", name = "brass sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "iron sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "steel sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "coral sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "crystal sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "carnite sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "arkidine sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "energy sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "power sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "force sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "nanite sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "gravity sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }
newEntity{ base = "BASE_SWORD", name = "null sword", level_range = {1, 10}, require = { stat = { str=11 }, }, cost = 5, combat = { dam = 10, }, }

newEntity{
    define_as = "BASE_SWORD",
    slot = "WEAPON",
--     slot_forbid = "SHIELD",
    type = "weapon", subtype="sword",
    display = "/",
    color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    name = "a generic sword",
    desc = [[A long, sharp object used for poking holes in monsters.]],
}
