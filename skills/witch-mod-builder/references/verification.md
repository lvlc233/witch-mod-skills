# Verification

## Static Review

- Run `scripts/check_mod_artifact.py /path/MyMod`.
- Run a diff check for accidental changes outside target files.
- Confirm no files under `resources/official` changed.
- Inspect CSV row count and headers.
- Confirm Data/Text paired rows for edited files.
- Search for unresolved placeholders:
  - `YourModName`
  - `OriginalRole`
  - `YourRole`
  - `ModTemplate`
- Search for forbidden patterns:
  - `Vars[`
  - `PlayerInfo.` in Lua Mod CSV where `ScriptExecutor.PlayerInfo.` is required
  - `AddEvent<`
  - `foreach (`
  - `new Dictionary`
  - local IDs used in runtime references

## Runtime Review

Run in game when possible and verify:

- Mod loads.
- Data/Text rows appear.
- Runtime full IDs resolve.
- Targeting applies to the intended object.
- Events fire at the expected moment.
- Resources load.

If runtime execution is not available, report that the final behavior is unverified.
