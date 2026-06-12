# ID Concepts

## What The API Confirms

- CSV local ID is written in a Data/Text CSV `Id` column, for example `*defect_discharge`.
- Runtime full ID is generated as `ModName_FileName_Id`, with `.csv` removed from `FileName` and leading `*` removed from the local ID.
- ModId is `ModName.ModAuthor` and is used for Mod identity and dependencies.
- DataId is for original/static ID constants, for example `DataId.buff_bleeding`.

## Teaching Pattern

Use this contrast:

| Concept | Example | Used for |
|---|---|---|
| CSV local ID | `*defect_discharge` | defining a row and pairing Data/Text |
| runtime full ID | `Defect_cardsample_defect_discharge` | scripts, skills, cross-table references |
| ModId | `Defect.SomeAuthor` | dependencies |
| DataId | `DataId.buff_bleeding` | original/static IDs |

## Common Confusions

- `*` is not part of the runtime full ID.
- ModId is not a card or Buff ID.
- Mod-added entries usually do not have `DataId.<name>` constants.

## Not Confirmed By API Docs

- The exact internal generation timing.
- A complete proof of collision handling beyond the documented ID rule.
