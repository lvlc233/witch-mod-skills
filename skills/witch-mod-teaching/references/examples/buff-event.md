# Example: Buff With Event

## Goal

Teach why Buff scripts often register events.

## API Facts Used

- Buff has `InitScript`, `ApplyScript`, `ClearScript`, and reduce fields.
- ScriptExecutor has `AddEvent`.
- `AddEvent` listens to named fight/status events.
- Lua typed payload availability is not guaranteed by API docs.

## Minimal Teaching Example

```lua
self:AddEvent("EndRound", function()
  self:SetStatus("Self")
  self:ChangeDefence("1")
end)
```

This teaches the pattern "when EndRound happens, run a small effect."

## Boundary

The API docs confirm the pattern and event names. They do not fully confirm exact dispatch order or typed callback payload stability.
