
local Talents = require("engine.interface.ActorTalents")

newEntity{
	define_as = "BASE_RODENT",
	type = "rodent", --subtype = "prisoner",
	display = "r", color=colors.UMBER,
	desc = [[A rodent.]],
	image = "npcs/rodents/rodent.png",
	faction = "animal",
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
}

newEntity{
	base = "BASE_RODENT",
	name = "giant rat", subtype = "giantrat",
    image = "npcs/rodents/giantrat.png",
	color=colors.UMBER,
	level_range = {1,3}, exp_worth = 1, rarity = 1,
	ai = "its_target_simple", -- ai_state = { talent_in=3, },
	--lite = 1,
	sight = 3,
	sight_min = 10, -- prisoners see better than guards
    max_life = resolvers.rngavg(1,4),
    combat = { dam=1 },
    on_acquire_target = function(act)
        if act.x and act.y then
            local sx, sy = game.level.map:getTileToScreen(act.x, act.y)
            game.flyers:add(sx, sy, 20, 0, -1, "Aware!", {255,0,0}, false)
        end
    end,
    on_bump = function(act)
        if act.x and act.y then
            local sx, sy = game.level.map:getTileToScreen(act.x, act.y)
            game.flyers:add(sx, sy, 20, 0, -1, "Ouch!", {0,255,0}, false)
        end
    end,

}

