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

newBirthDescriptor{
	type = "base",
	name = "base",
	desc = {
	},
	experience = 1.0,
	body = { INVEN = 20, HOVER = 1, HEAD = 1, NECK = 1, TORSO = 1, CLOAK = 1, QUIVER = 1, PACK = 1, LITE = 1, WATERSKIN = 1, TOOL = 1, ARMS = 1, HANDS = 1, WEAPON = 1, SHIELD = 1, RING1 = 1, RING2 = 1, BELT = 1, FEET = 1 }, 

	copy = {
		max_level = 10,
		max_life = 25,
	},
}

newBirthDescriptor{
	type = "role",
	name = "Destroyer",
	desc =
	{
		"Crashhhhh!",
	},
	talents = {
		[ActorTalents.T_KICK]=1,
	},
}

newBirthDescriptor{
	type = "role",
	name = "Acid-maniac",
	desc =
	{
		"Zshhhhhhhh!",
	},
	talents = {
		[ActorTalents.T_ACID_SPRAY]=1,
	},
}
