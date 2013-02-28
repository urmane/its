
startx = 61
starty = 61
endx = 62
endy = 3

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile("=", "FENCE")
defineTile("^", "GRAVESTONE")
defineTile("|", "TREE")
defineTile("<", "UP")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("P", "FLOOR", nil, {random_filter={type="humanoid", subtype="prisoner"}})

return [[|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|=============================================================|
|=...........................................................==
|=............................................................<
|=...........................................................==
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
|=..........................................................#=|
|=..................................................#......##=|
|=..^....^....^....^....^....^....^....^.....^....^.##..#######
|=.................................................############
|=..................................................#######.###
|=..^....^....^....^....^....^....^....^.....^....^######....##
|=..................................==============.........~~##
|=..................................=~~~~~~~~~~~~=~~~~~~~~~~~~#
|====================================~~|||||||||#########..~~##
||||||||||||||||||||||||||||||||||||~~~||||||||||##############
]]