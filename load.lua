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

-- This file loads the game module, and loads data
local KeyBind = require "engine.KeyBind"
local DamageType = require "engine.DamageType"
local ActorStats = require "engine.interface.ActorStats"
local ActorResource = require "engine.interface.ActorResource"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorAI = require "engine.interface.ActorAI"
local ActorInventory = require "engine.interface.ActorInventory"
local ActorLevel = require "engine.interface.ActorLevel"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local Birther = require "engine.Birther"

-- Useful keybinds
KeyBind:load("move,hotkeys,inventory,actions,interface,debug")

-- Damage types
DamageType:loadDefinition("/data/damage_types.lua")

-- Talents
ActorTalents:loadDefinition("/data/talents.lua")

-- Timed Effects
ActorTemporaryEffects:loadDefinition("/data/timed_effects.lua")

-- Actor resources
ActorResource:defineResource("Power", "power", nil, "power_regen", "Power represent your ability to use special talents.")
ActorResource:defineResource("breath", "breath", nil, "power_regen", "Holding your breath.")
ActorResource:defineResource("Earth", "earth", nil, "power_regen", "Earth mana.")
ActorResource:defineResource("Air",   "air",   nil, "power_regen", "Air mana.")
ActorResource:defineResource("Fire",  "fire", nil, "power_regen", "Fire mana.")
ActorResource:defineResource("Water", "water", nil, "power_regen", "Water mana.")

-- Actor stats
ActorStats:defineStat("Strength",	"str", 10, 1, 100, "Strength defines your character's ability to apply physical force. It increases your melee damage, damage with heavy weapons, your chance to resist physical effects, and carrying capacity.")
ActorStats:defineStat("Dexterity",	"dex", 10, 1, 100, "Dexterity defines your character's ability to be agile and alert. It increases your chance to hit, your ability to avoid attacks and your damage with light weapons.")
ActorStats:defineStat("Constitution",	"con", 10, 1, 100, "Constitution defines your character's ability to withstand and resist damage. It increases your maximum life and physical resistance.")
ActorStats:defineStat("Cognitive",	"cog", 10, 1, 100, "Mental acuity, general knowledge, and willpower.")
ActorStats:defineStat("Stealth",	"stl", 10, 1, 100, "How stealthy you are.")
ActorStats:defineStat("Charisma",	"chr", 10, 1, 100, "Personal magnetism.")

-- Actor AIs
ActorAI:loadDefinition("/engine/ai/")
ActorAI:loadDefinition("/mod/ai/")

-- Equipment slots
ActorInventory:defineInventory("HOVER", "circling my head", true, "Orbital")
ActorInventory:defineInventory("HEAD", "protecting my head", true, "Head")
ActorInventory:defineInventory("NECK", "around my neck", true, "Neck")
ActorInventory:defineInventory("TORSO", "covering my body", true, "Body")
ActorInventory:defineInventory("BELT", "around my waist", true, "Belt")
ActorInventory:defineInventory("CLOAK", "draped over my shoulders", true, "Cloak")
ActorInventory:defineInventory("QUIVER", "holding my arrows", true, "Quiver")
ActorInventory:defineInventory("PACK", "holding my stuff", true, "Pack")
ActorInventory:defineInventory("LITE", "my light source", true, "Light")
ActorInventory:defineInventory("WATERSKIN", "my liquid refreshment", true, "Waterskin")
ActorInventory:defineInventory("TOOL", "my ready tool", true, "Tool")
ActorInventory:defineInventory("ARMS", "covering my arms", true, "Arms")
ActorInventory:defineInventory("HANDS", "worn on my hands", true, "Hands")
ActorInventory:defineInventory("WEAPON", "in my weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("SHIELD", "in my shield hand", true, "Shield hand")
ActorInventory:defineInventory("RING1", "on my ring finger", true, "First ring")
ActorInventory:defineInventory("RING2", "on my ring finger", true, "Second ring")
ActorInventory:defineInventory("FEET", "on my feet", true, "Feet")

-- Birther descriptor
Birther:loadDefinition("/data/birth/descriptors.lua")

-- Uncomment this for hex mode
-- core.fov.set_algorithm("hex")

return {require "mod.class.Game" }
