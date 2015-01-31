-- If no target, move in previous direction and sometimes turn in a random direction
newAI("target_or_wander", function(self)
	if self:runAI(self.ai_state.ai_target or "target_simple") then
		return self:runAI(self.ai_state.ai_move or "move_simple")
	else
		return self:runAI("move_wander")
	end
end)

-- If no target, move in previous direction until we hit an obstacle, then turn in a random direction
newAI("guard_wander", function(self)
	if self:runAI(self.ai_state.ai_target or "target_simple") then
		return self:runAI(self.ai_state.ai_move or "move_simple")
	else
		local counter = 0
		local number_attempts = 4
		local x, y = util.dirToCoord(self.move_dir)
		while ( counter < 4 ) and not self:canMove(self.x + x, self.y + y) do
			if not self:canMove(self.x + x, self.y + y) then
				counter = counter + 1
				local dir = rng.range(1, 3)
				if     (dir == 1) then self.move_dir = util.dirSides(self.move_dir)["hard_left"]
				elseif (dir == 2) then self.move_dir = util.dirSides(self.move_dir)["hard_right"]
				else                   self.move_dir = util.opposedDir(self.move_dir) end 
				x, y = util.dirToCoord(self.move_dir)
			end
		end
		if (counter >= 4) then
			return self:runAI("move_wander")
		else
			return self:moveDir(self.move_dir)
		end
	end
end)

		--e = require("engine/Emote").new("Help me ...", 60, colors.GREY)
		--e:display(self.x, self.y)
		--self:setEmote(require("engine/Emote").new("Help me ...", 60, colors.GREY))
		--game.map.displayEmotes(1)
		--return true
newAI("prisoner", function(self)
	if self:canSee(game.player) and self:hasLOS(game.player.x,game.player.y,nil,nil,self.x,self.y) then
		return self:setEmote(require("engine/Emote").new("Help me ...", 60, colors.GREY))
	end
end)
