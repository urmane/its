
newAI("its_animal_wander", function(self)
	if self:runAI(self.ai_state.ai_target or "its_target_simple") then
		return self:runAI(self.ai_state.ai_move or "move_simple")
	else
		return self:runAI("move_wander")
	end
end)
