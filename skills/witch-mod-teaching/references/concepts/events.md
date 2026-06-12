# Event Concepts

## What The API Confirms

- ScriptExecutor can register fight/status-related events with `self:AddEvent(eventName, function() ... end)`.
- `AddTempEvent` is one-shot.
- Event registrations usually include the current status instance in EventCenter.
- Global/UI events are separate from ordinary fight events.
- C# generic typed events exist in original scripts, but Lua typed payload availability needs runtime verification.

## Teaching Pattern

Teach events as "run this script when the named game moment happens".

Example confirmed by API shape:

```lua
self:AddEvent("EndRound", function()
  self:SetStatus("Self")
  self:ChangeDefence("1")
end)
```

## Common Confusions

- `AddEventWithVar` is not proof that C# typed payload events are stable in Lua.
- `UIOpen` is not a normal fight event.
- Event names are not a full lifecycle explanation.

## Not Confirmed By API Docs

- Exact dispatch order.
- Exact timing for every event.
- Whether a Lua callback always receives full typed event data.
