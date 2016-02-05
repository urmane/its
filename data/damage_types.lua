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

-- The basic stuff used to damage a grid
setDefaultProjector(function(src, x, y, type, dam)
	local target = game.level.map(x, y, Map.ACTOR)
	if target then
		local flash = game.flash.NEUTRAL
		if target == game.player then
			game.logSeen(target,
				game.flash.BAD, "%s hits me for %s%0.2f %s damage#LAST#.",
				src.name:capitalize(),
				DamageType:get(type).text_color or "#aaaaaa#",
				dam,
				DamageType:get(type).name)
		 end
		if src == game.player then
			game.logSeen(target,
				game.flash.GOOD,
				"I hit %s for %s%0.2f %s damage#LAST#.",
				target.name,
				DamageType:get(type).text_color or "#aaaaaa#",
				dam,
				DamageType:get(type).name)
		end

		local sx, sy = game.level.map:getTileToScreen(x, y)
		if target:takeHit(dam, src) then
			if src == game.player or target == game.player then
				game.flyers:add(sx, sy, 30, (rng.range(0,2)-1) * 0.5, -3, "Kill!", {255,0,255})
			end
		else
			if src == game.player then
				game.flyers:add(sx, sy, 30, (rng.range(0,2)-1) * 0.5, -3, tostring(-math.ceil(dam)), {0,255,0})
			elseif target == game.player then
				game.flyers:add(sx, sy, 30, (rng.range(0,2)-1) * 0.5, -3, tostring(-math.ceil(dam)), {255,0,0})
			end
		end
		return dam
	end
	return 0
end)

newDamageType{
	name = "cosmetic", type="COSMETIC",
	projector = function(src, x, y, type, dam)
	end,
	death_message = {"cosmeticized"} -- is this TOME-only, or base engine?
}

newDamageType{
	name = "physical", type = "PHYSICAL",
}

-- Elemental damage
newDamageType{
	name = "fire", type = "FIRE", text_color = "#RED#",
	death_message = {"fricasseed"}
}

newDamageType{
	name = "water", type = "WATER", text_color = "#WHITE#",
	death_message = {"drowned"}
}

newDamageType{
	name = "earth", type = "EARTH", text_color = "#BROWN#",
	death_message = {"entombed"}
}

newDamageType{
	name = "air", type = "AIR", text_color = "#YELLOW#",
	death_message = {"blown apart"}
}

-- Fire and earth, burning and sticking, euw
newDamageType{
	name = "lava", type = "LAVA", text_color = "#RED#",
	death_message = {"charred"}
}

-- Fire and air
newDamageType{
	name = "steam", type = "STEAM", text_color = "#YELLOW#",
	death_message = {"scalded"}
}

-- Water and earth
newDamageType{
	name = "mud", type = "MUD", text_color = "#BROWN#",
	death_message = {"dirtified"}
}

-- Water and air
newDamageType{
	name = "mist", type = "MIST", text_color = "#GREEN#",
	death_message = {"moistened"}
}

-- Fire and water
-- Acid destroys things
newDamageType{
	name = "acid", type = "ACID", text_color = "#GREEN#",
	death_message = {"dissolved"}
}

-- Earth and air
newDamageType{
	name = "poisongas", type = "POISONGAS", text_color = "#GREEN#",
	death_message = {"choked"}
}

-- Miscellaneous physical

-- biological mechanism of action:
-- inhibition, activation, agonism, antagonism
newDamageType{
	name = "poison", type = "POISON", text_color = "#RED#",
	death_message = {"poisoned"}
}

newDamageType{
	name = "disease", type = "DISEASE", text_color = "#RED#",
	death_message = {"diseased"}
}

newDamageType{
	name = "concussive", type = "CONCUSSIVE", text_color = "#RED#",
	death_message = {"traumatized"}
}

newDamageType{
	name = "auditory", type = "AUDITORY", text_color = "#WHITE#",
	death_message = {"blasted"}
}

newDamageType{
	name = "radiation", type = "RADIATION", text_color = "#PURPLE#",
	death_message = {"exposed"}
}

-- Mental
newDamageType{
	name = "neurological", type = "NEUROLOGICAL", text_color = "#PURPLE#",
	death_message = {"tripped"}
}
newDamageType{
	name = "hallucinatory", type = "HALLUCINATORY", text_color = "#PURPLE#",
	death_message = {"tripped"}
}

-- Spiritual
newDamageType{
	name = "luck", type = "LUCK", text_color = "#PURPLE#",
	death_message = {"Murphied"}
}
newDamageType{
	name = "divine", type = "DIVINE", text_color = "#PURPLE#",
	death_message = {"divined"}
}
