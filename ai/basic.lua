-- ITS AIs
-- These AI are modified from engine base:
-- -ITS does not assume enemies are seen, algorithm is more subtle, see Actor:canSee()
-- -ITS allows initially moving items - guards follow psuedo-"routes" for instance

-- Find an hostile target
-- this requires the ActorFOV interface, or an interface that provides self.fov.actors*
-- modified from TOME original
newAI("its_target_simple", function(self)
    if self.ai_target.actor and not self.ai_target.actor.dead and rng.percent(90) then return true end

    -- Find closer enemy and target it
    -- Get list of actors ordered by distance
    local arr = self.fov.actors_dist
    local act
    for i = 1, #arr do
        act = self.fov.actors_dist[i]
--      print("AI looking for target", self.uid, self.name, "::", act.uid, act.name, self.fov.actors[act].sqdist)
        -- find the closest enemy
        if act and self:canSee(act,true,100) and self:reactionToward(act) < 0 and not act.dead then
            self:setTarget(act)
            self:check("on_acquire_target", act)
            return true
        end
    end
end)

-- If no target, move in previous direction until we hit an obstacle, then turn in a random direction
-- may want to modify move_simple/last_seen  to search - the guard is aware
newAI("its_guard_wander", function(self)
	if self:runAI(self.ai_state.ai_target or "its_target_simple") then
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
