newTalentType{ type="thief/stealth", name = "stealth", description = "Abilities to avoid notice" }

newTalent{
    name = "Hide in Shadows",
    short_name = "Hide",
    type = {"thief/stealth", 1},
    info = "Hide to prevent being noticed.  You cannot move when this talent is sustained.",
    image = "talents/hide.png",
    mode = "sustained",
    cooldown = 8,
    activate = function(self, t)
        game.fbo_shader:setUniform("colorize",{0.8, 0.8, 0.8, 1})
        return {
            move = self:addTemporaryValue("never_move", 1),
            hide = self:addTemporaryValue("hide", self.level or 1),
        }
    end,

    deactivate = function(self, t, p)
        self:removeTemporaryValue("never_move", p.move)
        self:removeTemporaryValue("hide", p.hide)
        game.fbo_shader:setUniform("colorize",{0, 0, 0, 1})
        return true
    end,
}

newTalent{
    name = "Move Silently",
    type = {"thief/stealth", 1},
    info = "Move silently",
    mode = "sustained",
}

newTalent{
    name = "Leap To Shadows",
    type = {"thief/stealth", 1},
    info = "Quickly dive into the shadows to avoid notice",
    mode = "activated",
}
