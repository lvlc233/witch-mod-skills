# Example: Career Skill Concept

## Goal

Teach the relationship between Career fields and skill cards.

## API Facts Used

- Career has `SkillScript`, `Skill1`, and `Skill2`.
- `Skill1`/`Skill2` reference card IDs.
- Mod skill cards should use runtime full IDs.
- `PlayerInfo.SkillTime` stores skill cooldown time.

## Teaching Explanation

`SkillScript` is script logic attached to the career. `Skill1` and `Skill2` are card references. If those cards are Mod-added cards, use their runtime full IDs.

## Boundary

The API docs do not fully explain how a new Career becomes selectable in the game UI.
