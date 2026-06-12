-- Example snippet only. Replace SettingUI.OnEnable with the confirmed hook target.
self:AddMethodHookBefore("SettingUI.OnEnable", function(instance)
  CS.Commands.Log("Hook", "SettingUI.OnEnable")
end)
