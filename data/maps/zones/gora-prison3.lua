
startx = 3
starty = 7
-- ugly hack
endx = 4
endy = 8

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "CELL_DOOR_OPEN")
defineTile("+", "CELL_DOOR_LOCKED")
defineTile(">", "DOWN")
defineTile("<", "UP")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("t", "FLOOR", nil, {random_filter={name="torch"}})
defineTile("b", "FLOOR", nil, {random_filter={name="brazier"}})
defineTile("P", "FLOOR", nil, {random_filter={type="humanoid", subtype="prisoner"}})

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
#..b.............#...........................#.............b..#
#.....................G.......................................#
#..............................t..............................#
####..#+#+#+#+#######+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#.....#.#.#.#.#######.#.#.#.#######.#.#.#.#######.#.#.#.#.....#
#.....###################################################.....#
#.....###################################################.....#
#######~#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##~~~~~~~~~~~~~##.######
#######~~~~~~~~~~~~~~~~~~~~##~~~~~~~~~~~~~~~~~~~~~##~~###.#####
#######~#~~~~###########################################.######
###~###.###...~~~##~~~~~~~~##~~~~~~~~~~~~~~~~~~~~~##~...###~~~#
###~###...#~~~~~~~~~~~~~##~~~~~~~~~~~~~##~~~~~~~~~##~~#####~~~#
##~~~####.#####################################~~~##~~~~~~~~~~#
#~~~~~.#.###~~~~~~~~~~~~##~~~~~~~~~~~~~##~~~~~#~~~~~~~#######~#
#~~~~~#.##~~~~~##~~~~~~~~~~##~~~~~~~~~~~~~~#~~~~~~~~~##~~~~~~~#
#~~~~~#########################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>#
###############################################################]]
