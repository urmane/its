newTalentType{ type="thief/acquisition", name = "acquisition", description = "Acquiring items from others" }
newTalent{
    name = "Pick Pockets",
    type = {"thief/acquisition", 1},
    info = "Liberate items from the confines of other pockets",
}
newTalent{
    name = "Swipe",
    type = {"thief/acquisition", 1},
    info = "Take items without others seeing you",
}

newTalentType{ type="thief/politics", name = "politics", description = "The soft skills" }
newTalent{
    name = "Bribe",
    short_name = "Bribe",
    type = {"thief/politics", 1},
    info = "Look, a shiny!",
    mode = "activated",
}

