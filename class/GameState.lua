
local STORYFLAGS = "/data/storyflags.lua"

require "engine.class"
require "engine.Entity"
local Particles = require "engine.Particles"
local Shader = require "engine.Shader"
local Map = require "engine.Map"

module(..., package.seeall, class.inherit(engine.Entity))

function _M:init(t, no_default)
    engine.Entity.init(self, t, no_default)

    self.boss_killed = 0
    self.birth = {}

    self.artifacts = {}
    self.events = {}
    self.storyflags = dofile(STORYFLAGS)
end

-- Weather code mostly from TOME
function _M:makeWeather(level, nb, params, typ)
    local ps = {}
    params.width = level.map.w*level.map.tile_w
    params.height = level.map.h*level.map.tile_h
    for i = 1, nb do
        local p = table.clone(params, true)
        p.particle_name = p.particle_name:format(nb)
        ps[#ps+1] = Particles.new(typ or "light_fog", 1, p)
    end
    level.data.weather_particle = ps
end

function _M:displayWeather(level, ps, nb_keyframes)
    local dx, dy = level.map:getScreenUpperCorner() -- Display at map border, always, so it scrolls with the map
    for j = 1, #ps do
        ps[j].ps:toScreen(dx, dy, true, 1)
    end
end

function _M:makeWeatherShader(level, shader, params)
    local ps = level.data.weather_shader or {}
    ps[#ps+1] = Shader.new(shader, params)
    level.data.weather_shader = ps
end

function _M:displayWeatherShader(level, ps, x, y, nb_keyframes)
    local dx, dy = level.map:getScreenUpperCorner() -- Display at map border, always, so it scrolls with the map

    local sx, sy = level.map._map:getScroll()
    local mapcoords = {(-sx + level.map.mx * level.map.tile_w) / level.map.viewport.width , (-sy + level.map.my * level.map.tile_h) / level.map.viewport.height}

    for j = 1, #ps do
        if ps[j].shad then
            ps[j]:setUniform("mapCoord", mapcoords)
            ps[j].shad:use(true)
            core.display.drawQuad(0, 0, level.map.viewport.width, level.map.viewport.height, 255, 255, 255, 255)
            ps[j].shad:use(false)
        end
    end
end


-- examples from tome

--- Number of bosses killed
function _M:bossKilled(rank)
    self.boss_killed = self.boss_killed + 1
end

--- Sets unique as dead
function _M:registerUniqueDeath(u)
    if u.randboss then return end
    self.unique_death[u.name] = true
end

--- Is unique dead?
function _M:isUniqueDead(name)
    return self.unique_death[name]
end

--- Runs the worldmap directory AI
function _M:worldDirectorAI()
end

function _M:playAmbientSounds(level, s, nb_keyframes)
end

function _M:dayNightCycle()
end

-- event-ish code
