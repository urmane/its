-- ITS - In The Shadows
-- Copyright (C) 2015, 2016, 2017 James Niemira
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
-- James Niemira "urmane"
-- jim.niemira@gmail.com

load("/data/general/grids/basic.lua")

newEntity{
        define_as = "TO_MARKET",
        always_remember = true,
        show_tooltip=true,
        name="The entrance to the Bazaar",
        display='>', color=colors.VIOLET,
	-- image = "terrain/stair_up_wild.png",
        notice = true,
        change_level=2, change_zone="market",
}


newEntity{
        define_as = "TO_CHURCH",
        always_remember = true,
        show_tooltip=true,
        name="A dirt road to an abandoned church.",
        display='>', color=colors.VIOLET,
        -- image = "terrain/stair_up_wild.png",
        notice = true,
        change_level=1, change_zone="church",
}

newEntity{
        define_as = "TO_ASYLUM",
        always_remember = true,
        show_tooltip=true,
        name="A dark alley leading to the old asylum.",
        display='>', color=colors.VIOLET,
        -- image = "terrain/stair_up_wild.png",
        notice = true,
        change_level=1, change_zone="asylum",
}

newEntity{
        define_as = "HOVEL",
        name="A dark alley leading to the old asylum.",
        display='#', color=colors.VIOLET,
        image = "terrain/fixme.png",
        notice = true,
        always_remember = true,
        does_block_move = true,
        block_sight = true,
        show_tooltip = true,
        -- do this here?
        gold = resolvers.rngavg(1,5),
        on_block_bump = function(g, e) if e.player then
                engine.ui.Dialog:yesnoPopup("Loot", "Loot this poor hovel?",
                                                --function(ok) if ok then game.player:incGold(10) end end,
                                                function(ok) if ok then
                                                        if g.gold > 0 then
                                                                game.player:incGold(g.gold or 0)
                                                                g.gold = 0
                                                        else 
                                                                game.log("Nothing worthwhile here.")
                                                        end
                                                end end,
                                                "Loot!", "Cancel")
        end end,
        --on_block_bump_msg = "Loot this poor hovel?",
}
