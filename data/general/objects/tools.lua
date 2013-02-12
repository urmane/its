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
    define_as = "BASE_LOCKPICK",
    slot = "TOOL",
    type = "tool", subtype="lockpick",
    display = "/",
    color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    -- combat = { sound = "actions/lockpick", sound_miss = "actions/melee_miss", },
    name = "a generic lockpick",
    desc = [[One or more strong, shaped wires or keys used to open locks.]],
}

newEntity{ base = "BASE_LOCKPICK", name = "makeshift lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "iron lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "steel lockpick", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "iron thiefs tools", level_range = {1, 10}, cost = 1, }
newEntity{ base = "BASE_LOCKPICK", name = "steel thiefs tools", level_range = {1, 10}, cost = 1, }
