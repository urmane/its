newTalentType{ type="thief/hiding", name = "hiding", description = "Abilities to avoid notice" }
newTalent{
    name = "Hide in Shadows",
    short_name = "Hide",
    type = {"thief/hiding", 1},
    info = "Hide to prevent being noticed.  You cannot move when this talent is sustained.",
    image = "talents/hide.png",
    mode = "sustained",
    cooldown = 8,
    activate = function(self, t)
        return {
            move = self:addTemporaryValue("never_move", 1),
            hide = self:addTemporaryValue("hide", self.level or 1),
        }
    end,

    deactivate = function(self, t, p)
        self:removeTemporaryValue("never_move", p.move)
        self:removeTemporaryValue("hide", p.hide)
        return true
    end,
}

newTalent{
    name = "Hide The Body",
    type = {"thief/hiding", 1},
    info = "Camoflage a body to prevent it being noticed",
}
newTalent{
    name = "Hide in Plain Sight",
    type = {"thief/hiding", 1},
    info = "Hide unmoving and unnoticed",
}
newTalent{
    name = "Create Shadows",
    type = {"thief/hiding", 1},
    info = "Hide unmoving and unnoticed",
}
