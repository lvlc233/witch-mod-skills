# Example: Resource Replace Concept

## Goal

Teach how resource redirection differs from writing a resource path into a CSV field.

## API Facts Used

- `RedirectSourcePath(originalPath, newPath)` maps an original path to a Mod path.
- Mod resources use `Mods/<ModName>/...`.
- Some CSV fields can directly point to ModResource paths.

## Teaching Explanation

Use resource redirection when you want an original resource request to load your Mod resource instead.

Use a ModResource path in CSV when the new Data row directly owns the resource field.

## Common Mistake

Do not put `Mods/<ModName>/ModResource/` on every resource field. Original resource fields can stay original paths.
