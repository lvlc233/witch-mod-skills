# Question Table Method

Use this method when evaluating or filling a learning question table.

## Steps

1. Classify each question:
   - API lookup
   - concept explanation
   - lifecycle/mechanism
   - example-specific code
   - implementation task
2. Check API support through `witch-mod-api`.
3. Assign support:
   - `充分`: direct and operational.
   - `部分`: related facts but missing mechanism, lifecycle, full list, example, or runtime proof.
   - `不可确认`: insufficient reference support.
4. For `部分` and `不可确认`, write the missing fact explicitly.

## Hallucination Checks

- If the answer depends on exact timing, mark partial unless documented.
- If the answer depends on why a system was designed that way, mark partial unless documented.
- If the answer depends on a complete list, require a complete list in the docs.
- If the answer depends on a sample-specific helper, require that helper to be documented.

## Output Shape

```text
Qxxx - 充分/部分/不可确认 - short reason - missing fact if any
```
