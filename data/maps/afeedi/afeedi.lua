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

subGenerator{
    x = 0, y = 128, w = 64, h = 64,
    generator = "engine.generator.map.Static",
    data = {
    	map = "afeedi/afeedi-start",
        land = "LAND",
        ocean = "OCEAN",
        trees = "TREES",
        mountain = "MOUNTAIN",
	snow = "SNOW",
	ice = "ICE",
    },
}

-- Entire world
addZone({1, 1, 256, 256}, "zonename", "Afeedi")

-- Special towns
addZone({1,1,64,64}, "town", "town1")
addZone({1,32,64,64}, "town", "town2")
addZone({1,64,64,64}, "town", "town3")
addZone({32,1,64,64}, "town", "town4")
addZone({32,32,64,64}, "town", "town5")
addZone({32,64,64,64}, "town", "town6")
addZone({64,1,64,64}, "town", "town7")
addZone({64,32,64,64}, "town", "town8")
addZone({64,64,64,64}, "town", "town9")

-- Random towns
addZone({1,1,64,64}, "random-town", "rtown1")
addZone({1,1,64,64}, "random-town", "rtown2")
addZone({1,1,64,64}, "random-town", "rtown3")
addZone({1,1,64,64}, "random-town", "rtown4")
addZone({1,1,64,64}, "random-town", "rtown5")
addZone({1,1,64,64}, "random-town", "rtown6")
addZone({1,1,64,64}, "random-town", "rtown7")
addZone({1,1,64,64}, "random-town", "rtown8")
addZone({1,1,64,64}, "random-town", "rtown9")

-- Special dungeons
addZone({1,1,64,64}, "dungeon", "dungeon1")
addZone({1,1,64,64}, "dungeon", "dungeon2")
addZone({1,1,64,64}, "dungeon", "dungeon3")
addZone({1,1,64,64}, "dungeon", "dungeon4")
addZone({1,1,64,64}, "dungeon", "dungeon5")
addZone({1,1,64,64}, "dungeon", "dungeon6")
addZone({1,1,64,64}, "dungeon", "dungeon7")
addZone({1,1,64,64}, "dungeon", "dungeon8")
addZone({1,1,64,64}, "dungeon", "dungeon9")

-- Random dungeons
addZone({1,1,64,64}, "random-dungeon", "rdungeon1")
addZone({1,1,64,64}, "random-dungeon", "rdungeon2")
addZone({1,1,64,64}, "random-dungeon", "rdungeon3")
addZone({1,1,64,64}, "random-dungeon", "rdungeon4")
addZone({1,1,64,64}, "random-dungeon", "rdungeon5")
addZone({1,1,64,64}, "random-dungeon", "rdungeon6")
addZone({1,1,64,64}, "random-dungeon", "rdungeon7")
addZone({1,1,64,64}, "random-dungeon", "rdungeon8")
addZone({1,1,64,64}, "random-dungeon", "rdungeon9")

-- People to meet (usually a dialogue on-map)
--prepareEntitiesList("afeedi_map_npcs", "mod.class.WorldNPC", "/data/general/encounters/afeedi-map-npcs.lua")
addZone({1,1,2,2}, "world_npc", "afeedi-map-npcs")
addZone({3,3,64,64}, "world_npc", "afeedi-map-npcs")

-- Encounters to have (usually a zone the player falls into)
--prepareEntitiesList("afeedi_map_encounters", "mod.class.Encounter", "/data/general/encounters/afeedi-map-encounters.lua")

--

-- sample code from tome, example of stuff to put in map generator
-- Load encounters for this map
--prepareEntitiesList("maj_eyal_encounters", "mod.class.Encounter", "/data/general/encounters/maj-eyal.lua")
--prepareEntitiesList("maj_eyal_encounters_npcs", "mod.class.WorldNPC", "/data/general/encounters/maj-eyal-npcs.lua")
--prepareEntitiesList("fareast_encounters", "mod.class.Encounter", "/data/general/encounters/fareast.lua")
--prepareEntitiesList("fareast_encounters_npcs", "mod.class.WorldNPC", "/data/general/encounters/fareast-npcs.lua")
--addData{
--    wda = { script="eyal", zones={} },
--    auto_placelists = { "maj_eyal_encounters", "fareast_encounters" },
--}



return true
