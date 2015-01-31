require "engine.class"
--local Map = require "engine.Map"

--- Represents a level map, handles display and various low level map work
module(..., package.seeall, class.inherit(Map))

--- Displays the map on screen
-- @param x the coord where to start drawing, if null it uses self.display_x
-- @param y the coord where to start drawing, if null it uses self.display_y
-- @param nb_keyframes the number of keyframes elapsed since last draw
-- @param always_show tell the map code to force display unseed entities as remembered (used for smooth FOV shading)
function _M:display(x, y, nb_keyframe, always_show, prevfbo)
	nb_keyframes = nb_keyframes or 1
	local ox, oy = self.display_x, self.display_y
	self.display_x, self.display_y = x or self.display_x, y or self.display_y

	self._map:toScreen(self.display_x, self.display_y, nb_keyframe, always_show, self.changed, prevfbo)

	self.display_x, self.display_y = ox, oy

	self:removeParticleEmitters()
	print("[DEBUG]running displayEmotes")
	self:displayEmotes(nb_keyframe)

	-- If nothing changed, return the same surface as before
	if not self.changed then return end
	self.changed = false
	self.clean_fov = true
end
