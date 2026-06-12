# Example: Basic Card Concept

## Goal

Teach how a card is represented by Data/Text CSV and runtime IDs.

## API Facts Used

- Card Data rows define behavior fields such as `InitScript`, `UseScript`, `Expend`, `Tag`.
- Text rows define name and description.
- Mod card runtime ID uses `ModName_FileName_Id`.
- `AttackCardItem` needs target selection; `CommonCardItem` does not.

## Minimal Teaching Example

A Mod card usually has:

- One Data row: behavior.
- One Text row: displayed text.
- A local CSV ID.
- A runtime full ID used by scripts and cross references.

## Common Mistakes

- Using `*local_id` in `AddCardById`.
- Forgetting Text row pairing.
- Copying C# original script into Lua CSV.
