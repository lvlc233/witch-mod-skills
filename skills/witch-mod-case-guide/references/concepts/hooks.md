# Hook Concepts

## What The API Confirms

- Lua Mod can register hooks with `AddMethodHookBefore(typeDotMethod, fn)` and `AddMethodHookAfter(typeDotMethod, fn)`.
- `typeDotMethod` format is `Type.MethodName`.
- Lua hook callbacks receive original method parameters; instance methods receive the instance first.
- C# DLL Hook mods use `[ModInitialize]`, `[HookBefore]`, and `[HookAfter]`.
- C# patch methods must be static, and instance method hooks receive the instance as the first parameter.

## Agent Pattern

Explain Hook as "run code before or after an existing method runs".

Do not call hook targets events unless explaining the distinction:

- Event: game broadcasts a named moment.
- Hook: Mod intercepts a method call.

## Common Confusions

- `SettingUI.OnEnable` is a method target, not a fight event name.
- Lua hook `ctx` from older examples should not be treated as a required object to unpack.
- C# attributes are not C# object properties; they annotate methods/classes.

## Not Confirmed By API Docs

- A complete list of hookable classes.
- Whether a specific target method still exists after a game update.
