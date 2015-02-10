
--local q = game.player:hasQuest("double-macguffin")
--local set = function(what) return function(npc, player) q:setStatus(q.COMPLETED, "chat-"..what) end end
--local isNotSet = function(what) return function(npc, player) return not q:isCompleted("chat-"..what) end end

newChat {
	id = "start",
	text = [[Finally, you have come.]],
	answers = {
	{"How can I help?", jump="help"},
	{"No thanks.", jump="nohelp"},
	},
}

newChat {
	id = "help",
	text = [[Go do the elemental quests.]],
	answers = {
	{"Fine.", action=function(npc, player) player:grantQuest("elemental-quests") end },
	},
}

newChat {
	id = "nohelp",
	text = [[Well, you're not very nice.]],
	answers = {
	{"<stick out tongue>"},
	},
}

return "start"
