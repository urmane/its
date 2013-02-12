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
ActorInventory:defineInventory("HOVER", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("HEAD", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("LEFTEYE", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("RIGHTEYE", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("NECK", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("TORSO", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("CLOAK", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("QUIVER", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("PACK", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("LITE", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("WATERSKIN", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("TOOL1", "in shield hand", true, "Shield hand")  -- in case we have more - pouches?  Too much?
ActorInventory:defineInventory("ARMS", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("HANDS", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("WEAPON", "in weapon hand", true, "Main weapon hand")
ActorInventory:defineInventory("SHIELD", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("RING1", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("RING2", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("BELT", "in shield hand", true, "Shield hand")
ActorInventory:defineInventory("FEET", "in shield hand", true, "Shield hand")

-- Birther descriptor
Birther:loadDefinition("/data/birth/descriptors.lua")

-- Uncomment this for hex mode
-- core.fov.set_algorithm("hex")

return {require "mod.class.Game" }
