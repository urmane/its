if config.settings.its_init_settings_ran then return end
config.settings.its_init_settings_ran = true

-- Init settings
config.settings.its = config.settings.its or {}
config.settings.its.autosave = true

-- DEBUG mode
config.settings.cheat = true
config.settings.debugprint = true
--config.settings.its.debugsense = true

--config.settings.its.cheat_start_zone = "gora-town"
--config.settings.its.cheat_start_zone = "murmon"
config.settings.its.cheat_start_zone = "prison"


print("[ITS] ITS settings loaded")
