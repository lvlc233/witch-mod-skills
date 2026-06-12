# Data/Text CSV Concepts

## What The API Confirms

- Data CSV stores numeric/effect/path/script configuration.
- Text CSV stores text and localization.
- Row 1 is the header.
- Row 2 is a note/comment row.
- Data rows start from row 3.
- Data and Text pair by same directory, same file name, and same local `Id`.
- Script columns in Mod CSV should be Lua.

## Agent Pattern

Explain Data/Text as two halves of one game entry:

- Data answers "what does it do?"
- Text answers "what does the player see?"

Example:

- `Data/Card/cardsample.csv` defines the card behavior.
- `Text/Card/cardsample.csv` defines the card name and description.
- Both use local ID `*defect_discharge`.

## Common Confusions

- Text `Id` stays the local ID; runtime full ID is for script/runtime references.
- Do not delete row 2 even if it looks like comments.
- Do not copy columns from another table just because a summary mentions them.

## Not Confirmed By API Docs

- Full loading order.
- Conflict behavior when two rows collide unexpectedly.
