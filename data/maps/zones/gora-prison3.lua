
startx = 3
starty = 7
-- ugly hack
endx = 4
endy = 8

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile(">", "DOWN")
defineTile("<", "UP")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("P", "FLOOR", nil, {random_filter={type="humanoid", subtype="prisoner"}})

return [[
###############################################################
#.....###################################################.....#
#.....###################################################.....#
#.....#.#.#.#.#.....#.#.#.#.#######.#.#.#.#######.#.#.#.#.....#
####..#'#+#+#+#.....#+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#..............................#..............................#
#.............................................................#
#..<.............#...........................#.............#..#
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
##...............#.............#.............#...............##
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
#..#.............#...........................#.............#..#
#.....................G.......................................#
#..............................#..............................#
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