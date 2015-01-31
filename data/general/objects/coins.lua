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

--local Stats = require "engine.interface.ActorStats"

newEntity{
	define_as = "BASE_COIN",
	type = "coin", subtype="copper",
	display = "$", color=colors.YELLOW,
	encumber = 0,
	use_no_wear = true, identified = true, stacking = true,
	auto_pickup = true, pickup_sound = "actions/coin",
	desc = [[Ooh, a shiny ...]],
--        	game.logPlayer(who, "You pickup %0.2f gold pieces.", self.money_value / 10)
--        	-- Remove from the map
--        	game.level.map:removeObject(who.x, who.y, id)
--        	return true
--    	end,
}


local function newCoin(name, image, subtype, cost, rarity, min_level, max_level, min_count, max_count)
	print ("defining ", name:gsub(" ", "_"):upper())
	newEntity{
		base = "BASE_COIN",
		define_as = name:gsub(" ", "_"):upper(),
		name = name:lower(),
		image = image, subtype = subtype, rarity = rarity, cost = cost,
		level_range = {min_level, max_level},
		--min_count = min_count, max_count = max_count,
		on_prepickup = function(self, who, id)
			local count = rng.range(min_count, max_count)
			game.logPlayer(who, "Counting %d %s", count, self.name)
			-- Ponder - liquid vs networth?  ;-)
			-- actual coin incs max and current, jewelry incs max only?
			-- liquid used for bribes ...
        		game.player.incMaxGold(game.player, cost * count)
        		game.player.incGold(game.player, cost * count)
			game.logPlayer(who, "Added %0.2f gold", cost * count)
        		game.level.map:removeObject(who.x, who.y, id)
        		return true
		end
	}
end

newCoin("copper coins",   "treasure/coins.png", "copper",     0.01, 1, 1, 10, 1, 10)
newCoin("silver coins",   "treasure/coins.png", "silver",     0.1,  1, 1, 10, 1, 10)
newCoin("gold coins",     "treasure/coins.png", "gold",       1.0,  1, 1, 10, 1, 10)
newCoin("electrum coins", "treasure/coins.png", "electrum",   2.0,  1, 1, 10, 1, 10)
newCoin("platinum coins", "treasure/coins.png", "platinum",  10.0,  1, 1, 10, 1, 10)

newCoin("purse of copper coins",   "treasure/purse.png", "copper",     0.01, 100, 8, 10, 10, 100)
newCoin("purse of silver coins",   "treasure/purse.png", "silver",     0.1,  100, 8, 10, 10, 100)
newCoin("purse of gold coins",     "treasure/purse.png", "gold",       1.0,  100, 8, 10, 10, 100)
newCoin("purse of electrum coins", "treasure/purse.png", "electrum",   2.0,  100, 8, 10, 10, 100)
newCoin("purse of platinum coins", "treasure/purse.png", "platinum",  10.0,  100, 8, 10, 10, 100)

newCoin("bag of copper coins",   "treasure/bag.png", "copper",     0.01, 100, 8, 10, 100, 1000)
newCoin("bag of silver coins",   "treasure/bag.png", "silver",     0.1,  100, 8, 10, 100, 1000)
newCoin("bag of gold coins",     "treasure/bag.png", "gold",       1.0,  100, 8, 10, 100, 1000)
newCoin("bag of electrum coins", "treasure/bag.png", "electrum",   2.0,  100, 8, 10, 100, 1000)
newCoin("bag of platinum coins", "treasure/bag.png", "platinum",  10.0,  100, 8, 10, 100, 1000)

newCoin("chest of copper coins",   "treasure/coin-chest.png", "copper",     0.01, 100, 8, 10, 1000, 10000)
newCoin("chest of silver coins",   "treasure/coin-chest.png", "silver",     0.1,  100, 8, 10, 1000, 10000)
newCoin("chest of gold coins",     "treasure/coin-chest.png", "gold",       1.0,  100, 8, 10, 1000, 10000)
newCoin("chest of electrum coins", "treasure/coin-chest.png", "electrum",   2.0,  100, 8, 10, 1000, 10000)
newCoin("chest of platinum coins", "treasure/coin-chest.png", "platinum",  10.0,  100, 8, 10, 1000, 10000)
