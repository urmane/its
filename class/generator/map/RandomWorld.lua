
-- Notes
-- 256x256 seems a good size, perhaps 1024x1024
-- start world, divide into sections, others can be completely connected
-- try use cavern noise-generated, plus Map:overlay()
-- sections, plus underwater as a mirror

require "engine.class"
local Map = require "engine.Map"
require "engine.Generator"
require "mod.utils"

module(..., package.seeall, class.inherit(engine.Generator))

function _M:init(zone, map, level, data)
        print("[ITS] Initializing generator")
	engine.Generator.init(self, zone, map, level)
        self.data = data
	self.width = data.width or 256
	self.height = data.height or 256
        self.grid_list = zone.grid_list
	self.subgen = {}
	self.spots = {}
        self.zoom = data.zoom or 10
        self.hurst = data.hurst or 0.75
        self.lacunarity = data.lacunarity or 3
        self.octave = data.octave or 1
        self.min_land = data.min_land or 12000   -- Dependent on w and h!!
        self.noise = data.noise or "simplex"
	data.__import_offset_x = data.__import_offset_x or 0
        data.__import_offset_y = data.__import_offset_y or 0

	self:loadMap(data.map)
end

function _M:loadMap(file)
        local t = {}

        print("[ITS] RandomWorld initializing")

	-- Not like a static map, but needed to read in any subgenerators / submaps
	print("[ITS] RandomWorld using file", "/data/maps/"..file..".lua")
        local f, err = loadfile("/data/maps/"..file..".lua")
        if not f and err then error(err) end
	-- This whole parse function copied from Static.lua - not sure what I need at this point
        local g = {
                level = self.level,
                zone = self.zone,
                data = self.data,
                Map = require("engine.Map"),
                specialList = function(kind, files)
                        if kind == "terrain" then
                                self.grid_list = self.zone.grid_class:loadList(files)
                        elseif kind == "trap" then
                                self.trap_list = self.zone.trap_class:loadList(files)
                        elseif kind == "object" then
                                self.object_list = self.zone.object_class:loadList(files)
                        elseif kind == "actor" then
                                self.npc_list = self.zone.npc_class:loadList(files)
                        else
                                error("kind unsupported")
                        end
                end,
                subGenerator = function(g)
                        self.subgen[#self.subgen+1] = g
                end,
                defineTile = function(char, grid, obj, actor, trap, status, spot)
                        t[char] = {grid=grid, object=obj, actor=actor, trap=trap, status=status, define_spot=spot}
                end,
                quickEntity = function(char, e, status, spot)
                        if type(e) == "table" then
                                local e = self.zone.grid_class.new(e)
                                t[char] = {grid=e, status=status, define_spot=spot}
                        else
                                t[char] = t[e]
                        end
                end,
                prepareEntitiesList = function(type, class, file)
                        local list = require(class):loadList(file)
                        self.level:setEntitiesList(type, list, true)
                end,
                prepareEntitiesRaritiesList = function(type, class, file)
                        local list = require(class):loadList(file)
                        list = game.zone:computeRarities(type, list, game.level, nil)
                        self.level:setEntitiesList(type, list, true)
                end,
                setStatusAll = function(s) self.status_all = s end,
                addData = function(t)
                        table.merge(self.level.data, t, true)
                end,
                getMap = function(t)
                        return self.map
                end,
                checkConnectivity = function(dst, src, type, subtype)
                        self.spots[#self.spots+1] = {x=dst[1], y=dst[2], check_connectivity=src, type=type or "static", subtype=subtype or "static"}
                end,
                addSpot = function(dst, type, subtype, additional)
                        local spot = {x=self.data.__import_offset_x+dst[1], y=self.data.__import_offset_y+dst[2], type=type or "static", subtype=subtype or "static"}
                        table.update(spot, additional or {})
                        self.spots[#self.spots+1] = spot
                end,
                addZone = function(dst, type, subtype, additional)
                        local zone = {x1=self.data.__import_offset_x+dst[1], y1=self.data.__import_offset_y+dst[2], x2=self.data.__import_offset_x+dst[3], y2=self.data.__import_offset_y+dst[4], type=type or "static", subtype=subtype or "static"}
                        table.update(zone, additional or {})
                        self.level.custom_zones = self.level.custom_zones or {}
                        self.level.custom_zones[#self.level.custom_zones+1] = zone
                end,
        }
        setfenv(f, setmetatable(g, {__index=_G}))
        local ret, err = f()
	-- Make sure the map file returns true
        if not ret and err then error(err) end

        local m = { w=self.width, h=self.height }

        m.startx = g.startx or math.floor(m.w / 2)
        m.starty = g.starty or math.floor(m.h / 2)
        m.endx = g.endx or math.floor(m.w / 2)
        m.endy = g.endy or math.floor(m.h / 2)

        self.map.map = m
        self.tiles = t

        self.map.w = m.w
        self.map.h = m.h
        print("[ITS] map size", m.w, m.h)
end

function _M:resolve(typ, c)
        if not self.tiles[c] or not self.tiles[c][typ] then return end
        local res = self.tiles[c][typ]
        if type(res) == "function" then
                return self.grid_list[res()]
        elseif type(res) == "table" and res.__CLASSNAME then
                return res
        elseif type(res) == "table" then
                return self.grid_list[res[rng.range(1, #res)]]
        else
                return self.grid_list[res]
        end
end

function _M:generate(lev, old_lev)
	--
	-- First try to use Static as a subgenerator - not sure that'll work
	--

        local spots = {}

	print("[ITS] Generating RandomWorld")
        local noise = core.noise.new(2, self.hurst, self.lacunarity)
        local fills = {}
        local opens = {}
        local list = {}
        for i = 0, self.map.w - 1 do
                opens[i] = {}
                for j = 0, self.map.h - 1 do
                        if noise[self.noise](noise, self.zoom * i / self.map.w, self.zoom * j / self.map.h, self.octave) > 0 then
                                self.map(i, j, Map.TERRAIN, self:resolve("land"))
                                opens[i][j] = #list+1
                                list[#list+1] = {x=i, y=j}
                        else
                                self.map(i, j, Map.TERRAIN, self:resolve("ocean"))
                        end
                end
        end

        local floodFill floodFill = function(x, y)
                local q = {{x=x,y=y}}
                local closed = {}
                while #q > 0 do
                        local n = table.remove(q, 1)
                        if opens[n.x] and opens[n.x][n.y] then
                                closed[#closed+1] = n
                                list[opens[n.x][n.y]] = nil
                                opens[n.x][n.y] = nil
                                q[#q+1] = {x=n.x-1, y=n.y}
                                q[#q+1] = {x=n.x, y=n.y+1}
                                q[#q+1] = {x=n.x+1, y=n.y}
                                q[#q+1] = {x=n.x, y=n.y-1}

                                q[#q+1] = {x=n.x+1, y=n.y-1}
                                q[#q+1] = {x=n.x+1, y=n.y+1}
                                q[#q+1] = {x=n.x-1, y=n.y-1}
                                q[#q+1] = {x=n.x-1, y=n.y+1}
                        end
                end
                return closed
        end

        -- Process all open spaces
        local groups = {}
        while next(list) do
                local i, l = next(list)
                local closed = floodFill(l.x, l.y)
                groups[#groups+1] = {id=id, list=closed}
                print("Floodfill group", i, #closed)
        end
        -- If nothing exists, regen
        if #groups == 0 then return self:generate(lev, old_lev) end

        -- Sort to find the biggest group
        table.sort(groups, function(a,b) return #a.list < #b.list end)
        local g = groups[#groups]
        if #g.list >= self.min_land then
                print("[ITS] floodfill OK")
                for i = 1, #groups-1 do
                        for j = 1, #groups[i].list do
                                local jn = groups[i].list[j]
                                self.map(jn.x, jn.y, Map.TERRAIN, self:resolve("ocean"))
                        end
                end
        else
                print("[ITS] map not OK - regenerate")
                return self:generate(lev, old_lev)
        end

	self:triggerHook{"MapGeneratorRandomWorld:subgenRegister", mapfile=self.data.map, list=self.subgen}

	print("[ITS] adding static overlays")
        for i = 1, #self.subgen do
                local g = self.subgen[i]
                local data = g.data
                if type(data) == "string" and data == "pass" then data = self.data end

                local map = self.zone.map_class.new(g.w, g.h)
                data.__import_offset_x = self.data.__import_offset_x+g.x
                data.__import_offset_y = self.data.__import_offset_y+g.y
                local generator = require(g.generator).new(
                        self.zone,
                        map,
                        self.level,
                        data
                )
                local ux, uy, dx, dy, subspots = generator:generate(lev, old_lev)

                if g.overlay then
                        self.map:overlay(map, g.x, g.y)
                else
                        self.map:import(map, g.x, g.y)
                end

                table.append(self.spots, subspots)

                if g.define_up then self.gen_map.startx, self.gen_map.starty = ux + self.data.__import_offset_x+g.x, uy + self.data.__import_offset_y+g.y end
                if g.define_down then self.gen_map.endx, self.gen_map.endy = dx + self.data.__import_offset_x+g.x, dy + self.data.__import_offset_y+g.y end
        end

	-- Left over from Static.lua, dunno if I need these
--        if self.gen_map.startx and self.gen_map.starty then
--                self.map.room_map[self.gen_map.startx][self.gen_map.starty].special = "exit"
--        end
--        if self.gen_map.endx and self.gen_map.endy then
--                self.map.room_map[self.gen_map.endx][self.gen_map.endy].special = "exit"
--        end

	print("[ITS] RandomWorld generation complete")
        return self.map.map.startx, self.map.map.starty, self.map.map.endx, self.map.map.endy, self.spots
end
