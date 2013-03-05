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


newTalentType{ type="thief/mechanic", name = "mechanic", description = "Mechanical techniques" }
newTalent{
	name = "Pick locks",
	short_name = "Lockpick",
	type = {"thief/mechanic", 1},
	mode = "activated",
        points = 8,
        range = 1,
        cooldown = 1,
        power = 2,
        info = "Skill at opening locks",
        action = function(self, t)
                local tg = {type="hit", range=self:getTalentRange(t)}
                local x, y, target = self:getTarget(tg)
                if not x or not y or not target then return nil end
                if core.fov.distance(self.x, self.y, x, y) > 1 then return nil end

                target:knockback(self.x, self.y, 2 + self:getDex())
                return true
        end,
	on_learn = function(self) return "Hey, I learned how to pick locks!" end,
	on_unlearn = function(self) return "Hey, I forgot how to pick locks!" end,
}
newTalent{
	name = "Disarm Trap",
	short_name = "Disarm Trap",
	type = {"thief/mechanic", 1},
	info = "Skill at disarming traps",
}
newTalent{
	name = "Disable Mechanism",
	short_name = "Disable",
	type = {"thief/mechanic", 1},
	info = "Skill at disabling mechanisms",
}
newTalent{
	name = "Autounlock",
	short_name = "Autounlock",
	type = {"thief/mechanic", 1},
	info = "Automatically open locks you pass near",
	mode = "sustained",
	require = { stat = { str = 10, dex = 10 }, talent = { Talents.T_LOCKPICK }, },
}

newTalentType{ type="physical/acrobatics", name = "acrobatics", description = "Acrobatic abilities" }
newTalent{
	name = "Evade",
	type = {"physical/acrobatics", 1},
	info = "Evade physical blows",
}
newTalent{
	name = "Climb walls",
	type = {"physical/acrobatics", 1},
	info = "Climb walls",
}
newTalent{
	name = "Avoid Trap",
	type = {"physical/acrobatics", 1},
	info = "Avoid traps",
}

newTalentType{ type="thief/sneaking", name = "sneaking", description = "Abilities to pass unnoticed" }
newTalent{
	name = "Move Silent",
	type = {"thief/sneaking", 1},
	info = "Move silently",
}
newTalent{
	name = "Sneak",
	type = {"thief/sneaking", 1},
	info = "Move unnoticed",
}

newTalentType{ type="thief/hiding", name = "hiding", description = "Abilities to avoid notice" }
newTalent{
	name = "Hide in Shadows",
	type = {"thief/hiding", 1},
	info = "Hide unmoving and unnoticed",
}
newTalent{
	name = "Create Shadows",
	type = {"thief/hiding", 1},
	info = "Hide unmoving and unnoticed",
}
newTalent{
	name = "Hide in Plain Sight",
	type = {"thief/hiding", 1},
	info = "Hide unmoving and unnoticed",
}
newTalent{
	name = "Disappear",
	type = {"thief/hiding", 1},
	info = "Become completely unnoticeable",
}

newTalentType{ type="thief/acquisition", name = "acquisition", description = "Acquiring items from others" }
newTalent{
	name = "Pick Pockets",
	type = {"thief/acquisition", 1},
	info = "Liberate items from the confines of other pockets",
}
newTalent{
	name = "Swipe",
	type = {"thief/acquisition", 1},
	info = "Take items without others seeing you",
}

newTalentType{ type="role/distraction", name = "distraction", description = "Abilities to redirect attention" }
newTalent{
	name = "Create Noise",
	type = {"role/distraction", 1},
	info = "Create a noise that appears to come from the target location",
}
newTalent{
	name = "Pique Interest",
	type = {"role/distraction", 1},
	info = "Target becomes interested in something",
}
newTalent{
	name = "Illusory Movement",
	type = {"role/distraction", 1},
	info = "Create a momentary illusory visual movement that appears to come from the target location",
}


newTalentType{ type="awareness/sensing", name = "sensing", description = "Abilities to heightened senses" }
newTalent{
	name = "Notice - Visual",
	short_name = "Seeing",
	type = {"awareness/sensing", 1},
	info = "Heightened visual awareness",
	mode = "sustained",
}
newTalent{
	name = "Notice - Auditory",
	short_name = "Hearing",
	type = {"awareness/sensing", 1},
	info = "Heightened auditory awareness",
	mode = "sustained",
}

newTalentType{ type="combat/subdual", name = "subdual", description = "Subdual combat techniques" }
newTalent{
	name = "Knockout",
	short_name = "Knockout",
	type = {"combat/subdual", 1},
	info = "Render target unconscious with a blow to the head",
	mode = "activated",
}
newTalent{
	name = "Sleeper Hold",
	short_name = "Sleeper",
	type = {"combat/subdual", 1},
	info = "Attempt to render target unconscious by choking",
	mode = "activated",
}
newTalent{
	name = "Nerve Strike",
	short_name = "Nerve Strike",
	type = {"combat/subdual", 1},
	info = "Disable target with a precise nerve strike",
	mode = "activated",
}

newTalentType{ type="combat/assassination", name = "assassination", description = "Assassination techniques" }
newTalent{
	name = "Backstab",
	short_name = "Backstab",
	type = {"combat/assassination", 1},
	info = "An unexpected strike doing extra damage",
	mode = "activated",
}
newTalent{
	name = "Vital Strike",
	short_name = "Vital Strike",
	type = {"combat/assassination", 1},
	info = "Cause massive damage with a shot to the vitals",
	mode = "activated",
}
newTalent{
	name = "Assassinate",
	short_name = "Assassinate",
	type = {"combat/assassination", 1},
	info = "Attempt to instantly kill target",
	mode = "activated",
}

newTalentType{ type="combat/unarmed", name = "unarmed", description = "Unarmed combat techniques" }
newTalent{
	name = "Disarm",
	short_name = "Disarm",
	type = {"combat/unarmed", 1},
	info = "Disarm target",
	mode = "activated",
}
newTalent{
	name = "Throw",
	short_name = "Throw",
	type = {"combat/unarmed", 1},
	info = "Throw target",
	mode = "activated",
}

newTalent{
	name = "Kick",
	type = {"combat/unarmed", 1},
	points = 1,
	cooldown = 6,
	power = 2,
	range = 1,
	action = function(self, t)
		local tg = {type="hit", range=self:getTalentRange(t)}
		local x, y, target = self:getTarget(tg)
		if not x or not y or not target then return nil end
		if core.fov.distance(self.x, self.y, x, y) > 1 then return nil end

		target:knockback(self.x, self.y, 2 + self:getDex())
		return true
	end,
	info = function(self, t)
		return "Kick!"
	end,
}

newTalent{
	name = "Acid Spray",
	type = {"combat/unarmed", 1},
	points = 1,
	cooldown = 6,
	power = 2,
	range = 6,
	action = function(self, t)
		local tg = {type="ball", range=self:getTalentRange(t), radius=1, talent=t}
		local x, y = self:getTarget(tg)
		if not x or not y then return nil end
		self:project(tg, x, y, DamageType.ACID, 1 + self:getDex(), {type="acid"})
		return true
	end,
	info = function(self, t)
		return "Zshhhhhhhhh!"
	end,
}

