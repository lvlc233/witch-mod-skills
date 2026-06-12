-- Example snippet only. Confirm the event name and target before using.
self:AddEvent("EndRound", function()
  self:SetStatus("Self")
  self:ChangeDefence("1")
end)
