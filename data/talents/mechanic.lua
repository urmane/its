newTalentType{ type="thief/mechanic", name = "mechanic", description = "Mechanical techniques" }
newTalent{
    name = "Pick locks",
    short_name = "Lockpick",
    type = {"thief/mechanic", 1},
    mode = "passive",
    info = "The ability to unlock locks without the intended key",
    points = 8,
    range = 1,
    cooldown = 1,
    power = 2,
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
    mode = "activated",
    info = "Skill at disarming traps",
}
newTalent{
    name = "Disable Mechanism",
    short_name = "Disable",
    type = {"thief/mechanic", 1},
    mode = "activated",
    info = "Skill at disabling mechanisms",
}
newTalent{
    name = "Set Trap",
    short_name = "Set Trap",
    type = {"thief/mechanic", 1},
    mode = "activated",
    info = "Skill at creating traps",
}

