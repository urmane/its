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
    },
}

setBorderDiv(64)
setBorderTerrain("ocean")

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

-- addSpot section
--addSpot({53, 11}, "world-encounter", "maj-eyal")
--addSpot({54, 11}, "world-encounter", "maj-eyal")
--addSpot({53, 12}, "world-encounter", "maj-eyal")
--addSpot({54, 12}, "world-encounter", "maj-eyal")

-- addZone section
--addZone({1, 1, 78, 43}, "zonename", "Maj'Eyal")
--addZone({8, 14, 12, 22}, "world-encounter", "merchant-quest")
--addZone({2, 3, 14, 12}, "world-encounter", "merchant-quest")


return true
