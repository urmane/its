
startx = 0
starty = 2
endx = 63
endy = 2

defineTile(".", "GRASS")
defineTile("s", "SIGN")
defineTile(":", "PAVED_ROAD")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("_", "WALL", nil, nil, nil, {on_block_change="GRASS", on_block_change_msg="You've discovered a secret passage!"})
defineTile("^", "GRAVESTONE")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile("=", "FENCE")
defineTile("|", "TREE")
defineTile("F", "FOUNTAIN")
defineTile("W", "TO_WORLDMAP")
defineTile("G", "TO_GRAVEYARD")
defineTile("C", "TO_CASTLEKURTOK")
defineTile("p", "GRASS", nil, {random_filter={name="townperson"}})
defineTile("1", nil, nil, nil, "FENSTER_FENCE")

defineTile("2", "FLOOR", nil, "STRAWMAN")

return [[||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|^^^.s.........................................................|
G::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::W
|................p.............:.....p.........................|
|_|||||=======================.:.==============================|
|.###.......#.......###........:...............................|
|.#########.#.#####.#.#.#####..:..##+##........................|
|.#1#|......#.#...#.#+#.#...#..:..#...#........................|
|....|###p....+.###.....#...+..:..#####........................|
|=====........###.#######...#..:...............................|
|.#......######.+.+.....#####..:...............................|
|.###.##...+..###.#######......:...............................|
|...#.##.######.+..............:...............................|
|####.........###..............:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:.....p.........................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|............................pp:p..............................|
|............................||:||.............................|
|..........................p.|:::|p............................|
|..........................::::F::::...........................|
|..........................p||:::||p...........................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::|.............................|
|............................|:::::::::::::::::::..............|
|............................|:::|##############'##############|
|............................|:::|#...........................#|
|............................|:::|#...........................#|
|............................|:::|#...........................#|
|............................|:::|#...........................#|
|............................|:::|#...........................#|
|............................|:::|#...........................#|
|............................|:::|##.................#........#|
|............................|:::||###################'########|
|............................|:::2|............................|
|============================='''============================='|
|..=........................................................=..|
|..=........................................................=..|
|..###########################+++############################..|
|..#........................................................#..|
|..#........................................................#..|
|..#........................................................#..|
|..#C.......................................................#..|
|..###########################'''############################.=|
|...=.+......................'...'.......................'....=|
|##############################################################|]]
