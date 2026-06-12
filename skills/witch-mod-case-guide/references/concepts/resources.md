# Resource Concepts

## What The API Confirms

- Mod resources live under `Mods/<ModName>/...`.
- Resource redirection uses `RedirectSourcePath(originalPath, newPath)`.
- `originalPath` is the original game resource path.
- `newPath` is the Mod resource path.
- Not every resource field should be prefixed with `Mods/<ModName>/ModResource/`; original resources keep original paths.
- Animation states use `config.json` with `AnimationPerFrame`, `isLoop`, and `Direction`.

## Agent Pattern

Teach resource work as two use cases:

1. Use a new Mod-owned resource in a Data field.
2. Redirect an original resource path to a Mod-owned resource path.

## Common Confusions

- Do not swap the two `RedirectSourcePath` arguments.
- Do not assume all image/audio/animation fields have the same path root.
- Animation config is not the same thing as a CSV row.

## Not Confirmed By API Docs

- All supported image/audio formats.
- All valid animation state names beyond documented examples.
