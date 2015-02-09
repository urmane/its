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

load("/data/general/npcs/guards.lua")
load("/data/general/npcs/lights.lua")

newEntity{
    base = "BASE_PRISONER", define_as="MAX_MACGUFFIN",
    name = "Max Macguffin", color=colors.WHITE,
    desc = "An old man, withered and near death.",
    level_range = {1, 4}, exp_worth = 0, rarity = 1,
    lite = 1, -- required for now, fix class/Actor.lua:canSee()
    ai = "none",
    faction = "neutral",
    can_talk = "double-macguffin-max1",
}

