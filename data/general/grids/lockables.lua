-- ITS - In The Shadows
-- Copyright (C) 2015, 2016, 2017 James Niemira
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
-- James Niemira "urmane"
-- jim.niemira@gmail.com


-- Note that digging a door destroys it, digging others opens (should wreck it, too...)
-- Note also that this is very similar to on_block_change, which is intended to be
-- more one-way, more general, and (currently) comes with a message.

newEntity{
	define_as = "BASE_LOCKABLE",
	notice = true,
	always_remember = true,
	block_sight = true,
}

newEntity{
	base = "BASE_LOCKABLE",
	define_as = "DOOR_OPEN",
	name = "open door",
	image = "terrain/granite_door_open.png",
	display = "'", color_r=238, color_g=154, color_b=77, back_color=colors.DARK_GREY,
	block_sight = false,
	-- actions, use verbs in past tense:
	--door_closed = "DOOR_CLOSED",
	closed = "DOOR_CLOSED",
}

newEntity{
	base = "BASE_LOCKABLE",
	define_as = "DOOR_CLOSED",
	name = "closed door",
	image = "terrain/granite_door_closed.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	--door_opened = "DOOR_OPEN",
	opened = "DOOR_OPEN",
	dug = "FLOOR",
}

-- putting lock_mfctr here makes them all the same for a level ... change to game-specific generated set of rng names via resolver()
newEntity{
	base = "BASE_LOCKABLE",
	define_as = "DOOR_LOCKED",
	name = "locked door",
	image = "terrain/granite_door_closed.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	lock_mfctr=game.markov["elvish"]:generateWord("E", 3, 9),
	lock_value = 10,
	--door_unlocked = "DOOR_OPEN",
	unlocked = "DOOR_CLOSED",
	dug = "FLOOR",
}


newEntity{
	define_as = "BASE_CHEST",
	notice = true,
	always_remember = true,
	block_sight = false,
}

newEntity{
	base = "BASE_CHEST",
	define_as = "CHEST_OPEN",
	name = "open chest",
	image = "terrain/chest_open.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	closed = "CHEST_CLOSED",
	dug = "FLOOR", -- ooh, interesting ...
}

newEntity{
	base = "BASE_CHEST",
	define_as = "CHEST_CLOSED",
	name = "closed chest",
	image = "terrain/chest_closed.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	opened = "CHEST_OPEN",
	locked = "CHEST_LOCKED",
}

newEntity{
	base = "BASE_CHEST",
	define_as = "CHEST_LOCKED",
	name = "locked chest",
	image = "terrain/chest_locked.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	unlocked = "CHEST_CLOSED",
	dug = "CHEST_OPEN",
}

newEntity{
	define_as = "BASE_SAFE",
	notice = true,
	always_remember = true,
	block_sight = false,
}

newEntity{
	base = "BASE_SAFE",
	define_as = "SAFE_OPEN",
	name = "open safe",
	image = "terrain/safe_open.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	closed = "SAFE_CLOSED",
}

newEntity{
	base = "BASE_SAFE",
	define_as = "SAFE_CLOSED",
	name = "closed safe",
	image = "terrain/safe_closed.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	opened = "SAFE_OPEN",
	locked = "SAFE_LOCKED",
}

newEntity{
	base = "BASE_CHEST",
	define_as = "SAFE_LOCKED",
	name = "locked safe",
	image = "terrain/safe_locked.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	unlocked = "SAFE_CLOSED",
	dug = "SAFE_OPEN",
}

newEntity{
	define_as = "BASE_COFFIN",
	notice = true,
	always_remember = true,
	block_sight = false,
}

newEntity{
	base = "BASE_COFFIN",
	define_as = "COFFIN_OPEN",
	name = "open coffin",
	image = "terrain/coffin_open.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	closed = "COFFIN_CLOSED",
}

newEntity{
	base = "BASE_COFFIN",
	define_as = "COFFIN_CLOSED",
	name = "closed coffin",
	image = "terrain/coffin_closed.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	opened = "COFFIN_OPEN",
	locked = "COFFIN_LOCKED",
}

newEntity{
	base = "BASE_CHEST",
	define_as = "COFFIN_LOCKED",
	name = "locked coffin",
	image = "terrain/coffin_locked.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.DARK_UMBER,
	unlocked = "COFFIN_CLOSED",
	dug = "COFFIN_OPEN",
}
