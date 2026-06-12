---
name: witch-mod-builder
description: Use when creating or modifying Witch's Apocalyptic Journey mod artifacts such as Mod folders, Data/Text CSV, Entry.lua hooks, resource redirects, Lua snippets, C# DLL Hook files, or validation checklists.
---

# Witch Mod Builder

本 skill 负责生成或修改 Mod 文件。默认使用仓库内 `resources/official` 的官方模板，不维护自造模板。

## 事实边界

- API 判断先用 `../witch-mod-api`。
- 复杂机制不确定时，停止并要求 `../witch-mod-research` 先调研。
- 只复制官方模板到目标 Mod；不要原地修改 `../../resources/official`。

## 默认资源路径

```text
../../resources/official/
```

常用官方模板：

| 任务 | 从这里复制 |
|---|---|
| Lua Mod 骨架 | `ModTemplate/` |
| C# DLL Hook 骨架 | `DllTemplate/` |
| 卡牌 Data/Text | `ModTemplate/Data/Card/cardsample.csv` + `ModTemplate/Text/Card/cardsample.csv` |
| Buff Data/Text | `ModTemplate/Data/Buff/buffsample.csv` + `ModTemplate/Text/Buff/buffsample.csv` |
| 职业/资源综合例子 | `Example/Defect/` |
| 官方 Lib / TypeHint | `ModTemplate/Scripts/Lib/` |

## 工作流

1. 确认目标：Mod 骨架、Data/Text CSV、Entry.lua、资源、C# DLL Hook、修改已有 Mod。
2. 查 `witch-mod-api`，确认 ID、CSV、Lua、资源或 Hook 规则。
3. 从 `resources/official` 复制最接近的官方模板文件或目录到目标工作区。
4. 在目标副本里修改 ModName、文件名、局部 ID、运行时完整 ID、Text、脚本、资源路径。
5. 运行 `references/implementation-checklist.md`。
6. 报告改了哪些文件、用了哪些官方模板、ID 映射和剩余运行风险。

## 硬规则

- 官方模板只读；任何修改都发生在目标 Mod 副本中。
- CSV 第 1 行表头和第 2 行备注行必须保留。
- 用目标 CSV 的现有表头，不发明列。
- Mod 新增行写 CSV 局部 ID；脚本和跨表引用用运行时完整 ID。
- Data/Text Mod 脚本写 Lua/XLua，不直接复制原版 C# 脚本。
- ScriptExecutor 实例方法用 `self:`。
- C# 字典/List 在 Lua 中用 XLua 访问方式。
- typed event payload 逻辑必须标注运行验证风险。

## 输出要求

- 变更文件。
- 使用的官方模板路径。
- local ID -> runtime full ID 映射。
- 已做检查。
- 剩余风险和需要 research 的问题。
