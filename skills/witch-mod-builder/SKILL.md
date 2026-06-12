---
name: witch-mod-builder
description: Use when creating or modifying Witch's Apocalyptic Journey mod artifacts such as Mod folders, Data/Text CSV, Entry.lua hooks, resource redirects, Lua snippets, C# DLL Hook files, or validation checklists.
---

# Witch Mod Builder

本 skill 负责生成或修改 Mod 文件。默认使用脚本从仓库内 `resources/official` 复制官方模板，不维护自造模板。

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
3. 读取 `references/template-driven-development.md`，选择官方模板。
4. 优先用 `scripts/copy_official_template.py` 复制官方模板到目标工作区。
5. 在目标副本里修改 ModName、文件名、局部 ID、运行时完整 ID、Text、脚本、资源路径。
6. 运行 `scripts/check_mod_artifact.py`，再按 `references/implementation-checklist.md` 和 `references/verification.md` 做人工确认。
7. 报告改了哪些文件、用了哪些官方模板、ID 映射和剩余运行风险。

## Reference Routing

| 需要 | 读取 |
|---|---|
| 复制官方模板 | `scripts/copy_official_template.py --help` |
| 检查生成结果 | `scripts/check_mod_artifact.py --help` |
| 官方模板选择和复制改写流程 | `references/template-driven-development.md` |
| CSV ID、表头、转义 | `references/csv-authoring.md` |
| Lua/XLua 常用片段 | `references/lua-patterns.md` |
| 实现前后检查 | `references/implementation-checklist.md` |
| 静态/运行验证 | `references/verification.md` |
| 小段 Lua 参考片段 | `assets/snippets/` 中按任务选择；只能作为片段，不是官方模板 |

## 硬规则

- 官方模板只读；任何修改都发生在目标 Mod 副本中。
- 不要手写复制流程，除非脚本不能覆盖当前任务；脚本不能覆盖时要说明原因。
- `assets/snippets/` 只用于小段 Lua 写法参考，不能替代官方模板、API 判断或 research 结论。
- CSV 第 1 行表头和第 2 行备注行必须保留。
- 用目标 CSV 的现有表头，不发明列。
- Mod 新增行写 CSV 局部 ID；脚本和跨表引用用运行时完整 ID。
- Data/Text Mod 脚本写 Lua/XLua，不直接复制原版 C# 脚本。
- ScriptExecutor 实例方法用 `self:`。
- C# 字典/List 在 Lua 中用 XLua 访问方式。
- typed event payload 逻辑必须标注运行验证风险。
- 对字段语义、生命周期、事件参数、加载顺序不确定时，先交给 `witch-mod-research`。

## 输出要求

- 变更文件。
- 使用的官方模板路径。
- 使用的脚本命令。
- local ID -> runtime full ID 映射。
- 已做检查。
- 剩余风险和需要 research 的问题。
