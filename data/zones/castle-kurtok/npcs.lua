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

newEntity{
        base = "BASE_GUARD",
        define_as = "BIGBAD",
        name = "bigbad", 
        color=colors.WHITE,
        level_range = {1,3}, exp_worth = 1, rarity = 1,
        lite = 0,
        sight = 3,
        sight_min = 10,
        max_life = 1,
    on_die = function(self, who)
        game.player:setQuestStatus("save-the-world", engine.Quest.COMPLETED, "foo")
    end,

}

