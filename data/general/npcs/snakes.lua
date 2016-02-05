
local Talents = require("engine.interface.ActorTalents")

load("/data/general/npcs/base-animal.lua")

newEntity{
    base = "BASE_ANIMAL",
	define_as = "BASE_SNAKE",
	keywords = {snake=true},
	type = "snake", --subtype = "prisoner",
	display = "r", color=colors.UMBER,
	desc = [[A snake.]],
	image = "npcs/snake/snake.png",
	faction = "animal",
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
}

newEntity{
	base = "BASE_SNAKE",
	name = "giant rat",
	subtype = "giantrat",
    image = "npcs/snake/snake.png",
	color=colors.UMBER,
	level_range = {1,3}, exp_worth = 1, rarity = 1,
	ai = "its_target_simple", -- ai_state = { talent_in=3, },
	--lite = 1,
	sight = 3,
	sight_min = 4,
    max_life = resolvers.rngavg(1,4),
    combat = { dam=1 },
}

