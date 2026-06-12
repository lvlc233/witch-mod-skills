# Lua and XLua Concepts

## What The API Confirms

- Lua `obj:method(args)` passes `obj` as `self`.
- CSV script `self` is usually ScriptExecutor.
- `ModConfig:Setup()` `self` is ModConfig.
- C# dictionaries in Lua use `get_Item` and `set_Item`.
- C# List indexing follows C# 0-based indexing in examples.
- `CS.*` accesses C# types, namespaces, static properties, and static methods.
- EmmyLua hints such as `---@type CS.ScriptExecutor` are for IDE/type completion.

## Agent Pattern

Use two contexts:

```lua
function ModConfig:Setup()
  -- self is ModConfig
end
```

```lua
-- CSV script
self:SetStatus("Self")
self:AddBuff("buff_vulnerability", "1")
```

## Common Confusions

- `self:` and `.` are not interchangeable for instance methods.
- `Vars["key"]` is C# syntax; Lua/XLua should use `self.Vars:get_Item("key")`.
- `CS.UnityEngine.Debug.Log` is Unity logging, while `CS.Commands.Log` is game/mod logging.

## Not Confirmed By API Docs

- Every exposed member on every C# object.
- Which IDE plugin behavior is available outside EmmyLua-style hints.
