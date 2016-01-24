
startx = 3
starty = 7
-- ugly hack
endx = 4
endy = 8

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("_", "WALLGRATE")
defineTile("'", "CELL_DOOR_OPEN")
defineTile("+", "CELL_DOOR_LOCKED")
defineTile(">", "DOWN")
defineTile("<", "UP")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("t", "FLOOR", nil, {random_filter={name="torch"}})
defineTile("b", "FLOOR", nil, {random_filter={name="brazier"}})
defineTile("P", "FLOOR", nil, {random_filter={type="humanoid", subtype="prisoner"}})
defineTile("r", "DEEP_WATER", nil, {random_filter={type="rodent", subtype="giantrat"}})

return [[###############################################################
#.....###################################################.....#
#.....###################################################.....#
#.....#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#P#.....#
#####+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#+#####
#..............................t..............................#
#.............................................................#
#..<.............#...........................#.............b..#
#.............................................................#
#.............................................................#
#.....##.....................#####.....................##.....#
#.....#G................................................#.....#
#.............................................................#
#........##.........b........#####........b.........##........#
#........#..........................................G#........#
#.............................................................#
#...........##...............#####...............##...........#
#..#........#.....................................#........#..#
#.............................................................#
#..............##............#####............##..............#
#........b.....#...............................#.....b........#
#.............................................................#
#...................#########.....#########...................#
#...................#P#P#P#P#.....#P#P#P#P#...................#
#...................#+#+#+#+#.....#+#+#+#+#...................#
#.....#..#..#..#...............................#..#..#..#.....#
#.....#..#..#..#...............................#..#..#..#.....#
#t....#..#..#..#........b......#......b........#..#..#..#....t#
#.....#..#..#..#...............................#..#..#..#.....#
#.....#..#..#..#...............................#..#..#..#.....#
#...................#+#+#+#+#.....#+#+#+#+#...................#
#...................#P#P#P#P#.....#P#P#P#P#...................#
#...................#########.....#########...................#
#.............................................................#
#........b.....#G..............................#.....b........#
#..............##............#####............##..............#
#.............................................................#
#..#........#....................................G#........#..#
#...........##...............#####...............##...........#
#.............................................................#
#........#...........................................#........#
#........##.........b........#####........b.........##........#
#.............................................................#
#.....#.................................................#.....#
#.....##.....................#####.....................##.....#
#.............................................................#
#.............................................................#
#................#...........................#................#
#.............................................................#
#t.............................t..............................#
#_____#######+#############+###########+#########+#######..####
#~~~~~#.............#.............#..........#..........#.....#
#~~~~~#.............#.............#..........#..........#.....#
#~~~~~###################################################.t...#
#~~~~~#~#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##~~~~~~~~~~~~r##.######
#~r~~~#~~~~~~~~~~~~~r~~~~~~##~~~~~~~~~~~~~~~~~~~~~##rr###.#####
#~~~~~#~#~~~~###########################################.######
#~~~~~#.###...~~~##~~~~~~~~##~~~~~~~~~~~~~~~~~~~~~##~...###r~~#
#~~~~~#...#~~~~~~~~~~~~~##~~~~~~~~~~~~~##~~~~~~~~~##~~#####~~~#
#~~~~~###.#####################################~~~##~~~~~~~~~~#
#~~~~~.#.###~~~~~~~~~~~~##~~~~~~~~~~~~~##~~~~~#~~~~~~~#######~#
#~~~~~#.##~~r~~##~~~~~~~~~~##~~~~~r~~~~~~~~#~~~~~~~~~##r~~~~~~#
#~~~~~#########################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>#
###############################################################]]
