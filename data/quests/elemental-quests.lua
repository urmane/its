
name = "Elemental Quests"
desc = function(self, who)
	local desc = {}
	desc[#desc+1] = "Complete all the elemental quests."
	if self:isCompleted("earth-quest-completed") then
		desc[#desc+1] = "#LIGHT_GREEN#* You have completed the Earth Quest!#WHITE#"
	else
		desc[#desc+1] = "#SLATE#* You must complete the Earth Quest.#WHITE#"
	end
	if self:isCompleted("air-quest-completed") then
		desc[#desc+1] = "#LIGHT_GREEN#* You have completed the Air Quest!#WHITE#"
	else
		desc[#desc+1] = "#SLATE#* You must complete the Air Quest.#WHITE#"
	end
	if self:isCompleted("water-quest-completed") then
		desc[#desc+1] = "#LIGHT_GREEN#* You have completed the Water Quest!#WHITE#"
	else
		desc[#desc+1] = "#SLATE#* You must complete the Water Quest.#WHITE#"
	end
	if self:isCompleted("fire-quest-completed") then
		desc[#desc+1] = "#LIGHT_GREEN#* You have completed the Fire Quest!#WHITE#"
	else
		desc[#desc+1] = "#SLATE#* You must complete the Fire Quest.#WHITE#"
	end
	return table.concat(desc, "\n")
end

on_status_change = function(self, who, status, sub)
	if sub then
		if self:isCompleted("earth-quest-completed") and
		   self:isCompleted("air-quest-completed") and
		   self:isCompleted("water-quest-completed") and
		   self:isCompleted("fire-quest-completed") then
			who:setQuestStatus(self.id, engine.Quest.COMPLETED)
		end
	end
end
