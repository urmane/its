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
    base = "BASE_PRISONER", define_as="PRISONER_MACGUFFIN",
    name = "prisoner", color=colors.WHITE,
    desc = "An old man, withered and near death.",
    level_range = {1, 4}, exp_worth = 0,
    -- not sure which of these applies in the generic engine
    rank = 1,
    max_life = 1, life_rating = 1,
    invulnerable = 1, never_move = 1,
    faction = "neutral",
    never_anger = 1,
    can_talk = "double-macguffin-prisoner1",
--    block_move = function(self, x, y, e, act, couldpass)
--        if e and e.player and act and e:reactionToward(self) >= 0 then
--            local chat = require("engine.Chat").new("double-macguffin-prisoner1", self, e)
--            chat:invoke()
--        end
--        return true
--    end,

}

