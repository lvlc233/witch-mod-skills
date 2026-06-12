---
name: witch-mod-teaching
description: Use when teaching Witch's Apocalyptic Journey mod concepts, explaining why/how, evaluating learning question tables, creating learning paths, or turning confirmed Witch mod facts into small educational examples and exercises.
---

# Witch Mod Teaching

本 skill 负责教学：把已确认事实讲清楚，帮助学习者建立概念和练习。

## 事实边界

- API 事实先用 `../witch-mod-api`。
- API 不足时，不自己翻第一事实；输出“需要 `../witch-mod-research` 调研”。
- 已有 research 报告时，可以引用报告中的结论，但要保留事实等级。
- 生产文件交给 `../witch-mod-builder`。

## 教学流程

1. 判断任务：概念解释、对比、问题表评估、学习路径、小例子。
2. 先查 `witch-mod-api` 支持度。
3. 按以下结构回答：
   - API 确认什么。
   - 用学习者能理解的话解释。
   - 最小例子；只在 API 支持时给。
   - 常见误解。
   - 还缺什么事实，是否需要 research。

## 引用路由

| 需要 | 读取 |
|---|---|
| ID、局部 ID、运行时 ID、ModId、DataId | `references/concepts/ids.md` |
| Data/Text CSV、本地化、第二行备注 | `references/concepts/csv-data-text.md` |
| Lua、XLua、`self`、`CS.*`、字典/List | `references/concepts/lua-xlua.md` |
| ScriptExecutor 事件、全局事件、有参事件警戒 | `references/concepts/events.md` |
| Lua Hook 与 C# DLL Hook 边界 | `references/concepts/hooks.md` |
| 资源路径、动画资源 | `references/concepts/resources.md` |
| 评估问题表 | `references/question-table-method.md` |
| 教学小例子 | `references/examples/` |

## 支持标签

- `充分`：API 支持清楚，可教学。
- `部分`：只教已确认部分，明确缺失机制。
- `不可确认`：不当事实讲，转成调研问题。

## 教学禁区

- 不要用“可能/看起来”伪装事实。
- 不要用字段名解释生命周期。
- 不要把一个样例讲成通用规则。
- 不要把 C# 原版脚本语法教成 Lua Mod 写法。
