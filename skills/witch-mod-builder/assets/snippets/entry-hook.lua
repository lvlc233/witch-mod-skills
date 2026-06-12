self:AddMethodHookBefore("SettingUI.OnEnable", function(instance)
  CS.Commands.Log("Hook", "SettingUI.OnEnable")
end)
