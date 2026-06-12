# Implementation Checklist

生成或修改 Mod 文件前后都使用本清单。

## Before Editing

- Confirm ModName.
- Confirm artifact type.
- Read relevant API section through `witch-mod-api`.
- Prefer an official template from `../../resources/official`.
- Use snippets only as small code references; snippets are not authoritative templates.
- Inspect target CSV headers if modifying existing files.
- Never edit files under `../../resources/official` directly.

## ID Checks

- CSV row uses local ID.
- Runtime references use `ModName_FileName_Id`.
- Leading `*` is not included in runtime full ID.
- Dependencies use ModId `ModName.ModAuthor`, not Data IDs.
- Original/static IDs may use `DataId.*`; Mod-added entries usually use runtime full ID strings.

## CSV Checks

- Row 1 header preserved.
- Row 2 note preserved.
- Data starts on row 3.
- No invented columns.
- Data/Text local IDs match for paired files.
- Script cells with commas or quotes are CSV-escaped.

## Lua/XLua Checks

- ScriptExecutor calls use `self:`.
- `ModConfig:Setup()` self is not confused with CSV script self.
- Dictionaries use `get_Item` / `set_Item`.
- C# LINQ is not copied into Lua.
- Numeric parameters follow documented string-style examples where appropriate.

## Runtime Checks

- Target-dependent methods are preceded by `self:SetStatus(...)` or another documented target source.
- Resource paths distinguish original paths from ModResource paths.
- Typed event payload logic is marked as needing runtime verification.
- UI/manager calls are avoided unless the task specifically requires them.
- If a mechanism is unclear, stop and request `witch-mod-research` instead of guessing.
