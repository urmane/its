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
    short_name = "Leap",
    points = 5,
    require = { stat = { dex = 10 }, },
    mode = "activated",
    info = function(self, t)
        return ([[Quickly leap into the shadows to avoid notice by foes.]])
    end,
    image = "talents/leaptoshadows.png",
    type = {"thief/stealth", 1},
    cooldown = 3,
    range = function(self, t) return 3 end, --math.floor(self:combatTalentScale(t, 1, 5)) end,
    --
    message = "@Source@ dives to the shadows!",
    -- copied from TOME Rush
    --target = function(self, t) return {type="ball", radius=3, range=self:getTalentRange(t), nolock=true, nowarning=true, requires_knowledge=false,  stop__block=true} end,
    target = function(self, t)
        return {type="ball", range=self:getTalentRange(t), talent=t, no_restrict=true, radius=3, stop_block=true, msg="Dive!"}
    end,
    --
    on_pre_use = function(self, t)
        if self:attr("never_move") then return false end
        return true
    end,
    action = function(self, t)
        local tg = self:getTalentTarget(t)
        local x, y, target = self:getTarget(tg)
        if not x then return nil end
        local _ _, x, y = self:canProject(tg, x, y)
        local rad = 3
        if not self:hasLOS(x,y) then
            game.logPlayer(self, "You cannot make it to that place!")
            return nil
        end
        --if not self:canProject(tg, x, y) then return nil end

        local block_actor = function(_, bx, by) return game.level.map:checkEntity(bx, by, Map.TERRAIN, "block_move", self) end
        local linestep = self:lineFOV(x, y, block_actor)

        local tx, ty, lx, ly, is_corner_blocked
        repeat  -- make sure each tile is passable
            tx, ty = lx, ly
            lx, ly, is_corner_blocked = linestep:step()
        until is_corner_blocked or not lx or not ly or game.level.map:checkAllEntities(lx, ly, "block_move", self)
        -- if not tx or core.fov.distance(self.x, self.y, tx, ty) < 1 then
        --     game.logPlayer(self, "You are too close to build up momentum!")
        --     return
        -- end
        if not tx or not ty or core.fov.distance(x, y, tx, ty) > 1 then return nil end

        local ox, oy = self.x, self.y
        self:move(tx, ty, true)
        if config.settings.tome.smooth_move and config.settings.tome.smooth_move > 0 then
            self:resetMoveAnim()
            self:setMoveAnim(ox, oy, 8, 5)
        end
        --self:teleportRandom(x, y, rad)

        return true
    end,

}
