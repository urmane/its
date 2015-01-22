
local q = game.player:hasQuest("double-macguffin")
local set = function(what) return function(npc, player) q:setStatus(q.COMPLETED, "chat-"..what) end end
local isNotSet = function(what) return function(npc, player) return not q:isCompleted("chat-"..what) end end

newchat {
	id = "start",
	text = [[Please, help me ...]],
	answers = {
	{"How can I help?",
	 jump="help", cond=isNotSet "help", action=set "help"},
	{"You are close to death, old man.  Just let it go, and die.",
	 jump="nohelp", cond=isNotSet "nohelp", action=set "nohelp"},
	},
}

newchat {
	id = "help",
	text = [[Give this necklace to my son, in Heightonsea ... it is all that remains of me ...
(The old man dies.)]],
	answers = {
	{"<take the necklace>", action=function(npc, player)
	player:grantQuest("double-macguffin")
	end},
	},
}

newchat {
	id = "nohelp",
	text = [[Well, you're not very nice.]],
	answers = {
	{"<stick out tongue>"},
	},
}
