# Defect Sample Mod

English | [中文](README.zh-CN.md)

This is a sample Lua mod based on `ModTemplate`. It demonstrates how to add and organize configuration tables, write a Lua entry script, and include custom animation resources.

## 1. Quick Start

- Copy `ModTemplate` and rename it to your mod folder. The folder name must match `ModName`.
- Edit `ModConfig.json`:
  - `ModName`: mod name
  - `ModAuthor`: author name
  - `ModVersion`: version
  - `ModDescription`: description
  - `IconPath`: icon path, usually `Icon.png`
  - `Enabled`: whether the mod is enabled
  - `Dependencies` (optional): dependency list in the format `ModName.ModAuthor`

## 2. Directory Conventions

- `Scripts/Entry.lua`: entry script, executed when the mod loads.
- `Data/`: new gameplay/config data tables.
- `Text/`: new text and localization tables.
- `ModResource/`: resource files such as images and animations.

## 3. Entry Script

- Recommended entry point: `function ModConfig:Setup() ... end`
- In `Setup`, you can:
  - Change tables: `ModifyDataConfig` / `SetDataConfig`
  - Redirect resources: `RedirectSourcePath`
  - Hook methods: `AddMethodHookBefore` / `AddMethodHookAfter`

Example:

```lua
function ModConfig:Setup()
  self:ModifyDataConfig("career_3", "Name", "Defect Robot")
  self:RedirectSourcePath("AnimationLib/支配魔女/Idle", "Mods/YourMod/ModResource/AnimationLib/Defect/Idle")
  self:AddMethodHookBefore("SettingUI.OnEnable", function(ctx)
    CS.UnityEngine.Debug.Log("[YourMod] SettingUI.OnEnable")
  end)
end
```

## 4. Available Lua API (`self` / `ModConfig`)

- `SetDataConfig(id, table)`: update an entire row, except the `Id` field.
- `ModifyDataConfig(id, key, value)`: update one field.
- `RedirectSourcePath(originalPath, newPath)`: redirect a resource path.
- `AddDynamicMethod(methodName, fn)`: register a global Lua method.
- `AddMethodHookBefore(typeDotMethod, fn)`: add a before hook.
- `AddMethodHookAfter(typeDotMethod, fn)`: add an after hook.

## 5. Data/Text CSV Rules

- The header row (row 1) must match the corresponding CSV in the main game project.
- The comment row (row 2) describes fields and should usually be kept.
- `Data` contains gameplay/effect configuration. `Text` contains display text and localization.
- Columns ending with `Script` contain Lua logic. `self` is a `ScriptExecutor`.
- Localization columns can use suffixes such as `_en`, `_zh_hant`, and `_jp`.

## 6. Item Authoring Rules

- On load, the game reads `Data` and `Text` from the mod root and merges tables with the same names.
- In-game item IDs are generated as `ModName_FileName_Id`, so `Data` and `Text` entries are for adding content, not overriding existing rows.
- If an ID contains `*`, it will not enter the random pool. Otherwise, it can appear normally in the pool.
- Effect authoring reference: [C# effect authoring guide](https://www.cnblogs.com/DLSinnocence/articles/18948776)
- Mods only recognize Lua scripts. Convert C# syntax to Lua syntax. For example, use `self:AddBuff(buffId, level)` instead of `AddBuff(buffId, level)`.
- Lua syntax reference: [Lua tutorial](https://www.runoob.com/lua/lua-basic-syntax.html)
- Full game configs: [web version](https://dlsinnocence.github.io/gamewiki/) and [local version](Scripts/Lib/DataConfigs)
- Vanilla effect examples are under `Scripts/Lib/DataConfigs`. They are written in C# style and are for reference only; mod scripts must be written in Lua.
- In scripts, reference vanilla IDs with `DataId.Id`; reference mod IDs as string literals.
- Cards must set `BaseScript` to either `AttackCard` or `CommonCard`, depending on whether the card selects a target.
- Persistent card effects should be written as buffs.

## 7. FAQ

- Mod does not take effect
  - Check whether `Enabled` in `ModConfig.json` is `true`, and whether dependencies are correct.
- Cannot set a dictionary
  - String dictionaries cannot be accessed with `[]`. Use `dict:get_Item` and `dict:set_Item`. See XLua details.
- What is the resource path?
  - The mod path is `Mods/<your mod name>/...`
  - Check the game config tables for vanilla paths.
- Why do some IDs contain `*`?
  - It controls whether the item enters the random pool. Content that should never be randomly obtained, such as career cards, should use `*`.

## 8. Starter Exercise

1. Delete folders under `Data` and `Text`, leaving only `Card`.
2. Open the tables under `Data/Card` and `Text/Card`, then write effects by referring to `ScriptExecutor`.

See this example and try writing your first mod.
