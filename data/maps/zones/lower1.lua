
startx = 63
starty = 2
endx = 0
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
defineTile("M", "TO_MARKET")
defineTile(">", "DOWN")


return [[||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|^^^.s.........................................................|
>::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::M
|................p.............:.....p.........................|
|_|||||=======================.:.==============================|
|.###.......#.......###........:...............................|
|.#########.#.#####.#.#.#####..:...............................|
|.#1#|#.....#.#...#.#+#.#...#..:...............................|
|g...|###p....+.###.....#...+..:...............................|
|=====#.......###.#######...#..:...............................|
|######..######.+.+.....#####..:...............................|
|.###.##...+..###.#######......:...............................|
|...#.##.######.+..............:...............................|
|####.........###..............:...............................|
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
|..............................:...............................|
|..............................:...............................|
|..............................:...............................|
|............................pp:p..............................|
|............................||:||.............................|
|..........................p.|:::|p............................|
|...........................:::F:::............................|
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
