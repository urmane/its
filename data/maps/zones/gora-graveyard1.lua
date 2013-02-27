
startx = 62
starty = 3
endx = 0
endy = 3

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile("=", "FENCE")
defineTile("^", "GRAVESTONE")
defineTile("|", "TREE")
defineTile("W", "TO_WORLDMAP")
defineTile(">", "DOWN")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("P", "FLOOR", nil, {random_filter={type="humanoid", subtype="prisoner"}})

return [[|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|=============================================================|
==...........................................................==
>.............................................................W
==...........................................................==
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=...........................................................=|
|=..^....^....^....^....^....^....^....^.....^....^..........=|
|=...........................................................=|
|=...........................................................=|
|=..^....^....^....^....^....^....^....^.....^....^..........=|
|=...........................................................=|
|=...........................................................=|
|=============================================================|
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
]]
