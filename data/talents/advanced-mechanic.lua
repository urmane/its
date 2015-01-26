newTalentType{ type="thief/advanced-mechanic", name = "advanced-mechanic", description = "Advanced mechanical techniques" }
newTalent{
    name = "Autounlock",
    short_name = "Autounlock",
    type = {"thief/advanced-mechanic", 1},
    info = "Automatically open locks you pass near",
    mode = "sustained",
    require = { stat = { str = 10, dex = 10 }, talent = { Talents.T_LOCKPICK }, },
}

