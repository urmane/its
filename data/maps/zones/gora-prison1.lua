startx = 7
starty = 3

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile("*", "FLOOR") --make me a small treasure?
defineTile(">", "DOWN")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("p", "FLOOR", nil, {random_filter={name="prisoner"}})
defineTile("t", "FLOOR", nil, {random_filter={name="torch"}})
defineTile("b", "FLOOR", nil, {random_filter={name="brazier"}})

return [[
###############.....p*#########################################
#.....#########.#########################################.....#
#.....#########.#########################################.....#
#.....#.#p#p#p#.....#.#.#.#.#######p#.#.#p#######.#.#.#p#.....#
####..#'#+#+#+#.....#+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#t.............................t.............................t#
#.............................................................#
#..#.............#...........................#.............#..#
#...............................................G.............#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#p#.#.#p#.....#p#p#.#.#.....#p#.#.#.#.....#.#.#p#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#p#.#.#p#.....#p#p#.#.#.....#p#.#.#p#.....#p#.#.#p#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................................................#
#..#..........G..#.............#.............#.............#..#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#p#p#p#p#.....#p#.#.#p#.....#.#.#.#.#.....#.#p#p#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#p#p#p#p#.....#p#.#p#p#.....#p#p#p#p#.....#p#p#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#..........................................G..................#
#.............................................................#
#t...............#.............b.............#...............t#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#.#.#.#.#.....#.#.#p#.#.....#p#p#.#.#.....#p#.#p#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#.#.#.#p#.....#.#.#p#.#.....#.#p#.#p#.....#p#.#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................G...............................#
#..#.............#.............#.............#.............#..#
#.............................................................#
#.............................................................#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.....#p#p#p#p#.....#.#.#p#.#.....#.#.#.#.#.....#p#p#.#.#.....#
#.....#########.....#########.....#########.....#########.....#
#.....#p#p#p#p#.....#.#.#.#.#.....#p#.#.#.#.....#p#p#.#.#.....#
#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#+#+#+#+#.....#
#.............................................................#
#.............................................................#
#..#.............#...........................#.............>..#
#.....................G.......................................#
#t.............................t.............................t#
####..#+#+#+#+#######+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#.....#.#.#p#.#######p#p#p#p#######.#p#.#.#######p#.#.#.#.....#
#.....###################################################.....#
#.....###################################################.....#
###############################################################
]]
