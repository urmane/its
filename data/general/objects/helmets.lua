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
    define_as = "BASE_HELMET", slot = "HEAD",
    type = "armor", subtype="helmet", display = "/", color=colors.SLATE,
    encumber = 3, rarity = 5,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    name = "a generic helmet",
    desc = [[A hard covering for your noggin.]],
}

newEntity{ base="BASE_HELMET", name="leather helmet",  level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="wood helmet",     level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="bronze helmet",   level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="iron helmet",     level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="steel helmet",    level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="coral helmet",    level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="crystal helmet",  level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="carnite helmet",  level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="arkidine helmet", level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="energy helmet",   level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="power helmet",    level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="force helmet",    level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="nanite helmet",   level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="gravity helmet",  level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}
newEntity{ base="BASE_HELMET", name="null helmet",     level_range = {1, 10}, cost = 5, wielder = { combat_def = 3, combat_armor = 7, fatigue = 20, },}