# Lua Patterns

## Set Target Then Apply Buff

```lua
self:SetStatus("Self")
self:AddBuff("buff_vulnerability", "1")
```

## Set Target Then Damage

```lua
self:SetStatus("Target")
self:Damage("7", "Normal")
```

## Dictionary Access

```lua
local old = self.Vars:get_Item("key")
self.Vars:set_Item("key", "1")
```

## PlayerInfo

```lua
ScriptExecutor.PlayerInfo.AddBless("blessing_1")
```

## Event Registration

```lua
self:AddEvent("EndRound", function()
  self:SetStatus("Self")
  self:ChangeDefence("1")
end)
```

Typed event payloads require runtime verification before relying on callback fields.
