
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

return [[
###############################################################
#.....###################################################.....#
#.....###################################################.....#
#.....#.#.#.#.#.....#.#.#.#.#######.#.#.#.#######.#.#.#.#.....#
####..#+#+#+#+#.....#+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#..............................t..............................#
#.............................................................#
#..<.............#...........................#.............b..#
#...............................................G.............#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................................................#
#..#..........G..#.............#.............#.............#..#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#..........................................G..................#
#.............................................................#
#t...............#.............b.............#...............t#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................G...............................#
#..#.............#.............#.............#.............#..#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#.#.#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................................................#
#................#...........................#.............b..#
#.....................G.......................................#
#t.............................t..............................#
#_____#+#+#+#+#######+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#~~~~~#.#.#.#.#######.#.#.#.#######.#.#.#.#######.#.#.#.#.....#
#~~~~~###################################################.....#
#~~~~~###################################################.....#
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
