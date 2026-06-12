# Verification

## Static Review

- Run a diff check for accidental changes outside target files.
- Inspect CSV row count and headers.
- Search for forbidden patterns:
  - `Vars[`
  - `PlayerInfo.` in Lua Mod CSV where `ScriptExecutor.PlayerInfo.` is required
  - `AddEvent<`
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
