startx = 7
starty = 3

defineTile(".", "FLOOR")
defineTile("#", "WALL")
defineTile("'", "CELL_DOOR_CLOSED")
defineTile("+", "CELL_DOOR_LOCKED")
defineTile("$", "FLOOR", "A_FEW_COINS")
defineTile("1", "FLOOR", "PERSIAN_RUG")
defineTile("2", "FLOOR", "MANY_COINS")
defineTile("3", "FLOOR", "ELECTRUM_COINS")
defineTile("4", "FLOOR", "PLATINUM_COINS")
defineTile("5", "FLOOR", "PURSE_OF_COPPER_COINS")
defineTile(">", "DOWN")
defineTile("G", "FLOOR", nil, {random_filter={name="prisonguard"}})
defineTile("p", "FLOOR", nil, {random_filter={name="prisoner"}})
defineTile("t", "FLOOR", nil, {random_filter={name="torch"}})
defineTile("b", "FLOOR", nil, {random_filter={name="brazier"}})
defineTile("T", "FLOOR", "DECORATION_TABLE")
defineTile("C", "FLOOR", "DECORATION_CHAIR")
defineTile("T", "FLOOR")
defineTile("C", "FLOOR")
--defineTile("r", "FLOOR", nil, {random_filter={type="rodent", subtype="giantrat"}})
--defineTile("s", "FLOOR", nil, {random_filter={type="snake", subtype="snake"}})
defineTile("S", "FLOOR", nil, {random_filter={type="spider", subtype="spider"}})

return [[###############......$#########################################
#.....#########.#########################################.....#
#.CTC.#########.#########################################.CTC.#
#.....#.#p#p#p#.....#.#.#.#.#######p#.#.#p#######.#.#.#p#.....#
####..#'#+#+#+#.....#+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#t.............................t.............................t#
#.............................................................#
#..#......$12345.#...........................#.............#..#
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
#..............................t.............................t#
####..#+#+#+#+#######+#+#+#+#######+#+#+#+#######+#+#+#+#..####
#S....#.#.#p#.#######p#p#p#p#######.#p#.#.#######p#.#.#.#.....#
#.....###################################################.....#
#.....###################################################.....#
###############################################################]]
