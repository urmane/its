
startx = 1
starty = 1
-- ugly hack
endx = 2
endy = 1

defineTile(".", "FLOOR")
defineTile("~", "DEEP_WATER")
defineTile("#", "WALL")
defineTile("'", "DOOR_OPEN")
defineTile("+", "DOOR_LOCKED")
defineTile("_", "WALLGRATE")
defineTile("<", "UP")
defineTile(">", "DOWN")

return [[########################################
#<.~~~_~~~~~~~~#########################
#~~~~~_~~~~~~~~#########################
#~~~~~_~~~~~~~~#########################
#>~~~~_~~~~~~~~#########################
#####~#~~~~~~~~#########################
#####~##################################
#####~_~~~~~~~~#########################
#####~_~#~~~~~~#########################
#####~_~#~~~~~~#########################
###~#~#~~~~~~~~#########################
###~_~#~~~~~~~~#########################
###~_~#####~~~~#########################
###~_~_~~~~~~~~#########################
##~~_~#####~~~~#########################
#~~~_~#~~~~~~~~#########################
#~~~_~#~~~~~~~~#########################
####_~#~~~~~~~~#########################
####_~_~~~~~~~~#########################
####_~_~~~~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~#~~~~~#########################
####_~_~~~~~~~~#########################
####_~_~~~~~~~~#########################
####_~_~~#~~~~~~########################
####_~_~~#~~~~~~##################~~~~~#
####_~_~~#~~~~~~##################~~~~~#
#####~_~~~~#~~~~##################~~~~~#
#~~##~###~~#~~~~~#################~~~~~#
#~~~~~~~_~~#~~~~~#################~~~~~#
########################################]]
