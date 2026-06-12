---
name: witch-mod-api
description: Use when answering Witch's Apocalyptic Journey mod API questions about ModConfig, Lua/XLua, CSV Data/Text, IDs, ScriptExecutor, events, hooks, resources, UI windows, C# DLL Hook mods, or checking whether the bundled API notes support an answer.
---

# Witch Mod API

本 skill 只负责“干净 API 手册边界”：回答当前整理过的 API 资料能确认什么、不能确认什么。

## 事实边界

- 只读取本 skill 的 `references/`。
- 不读取 `../../resources/`、官方模板、Example、Lib、反编译文件，除非用户明确要求切换到调研。
- 不把第一事实调研结果混入 API 结论；需要调研时，输出“需要 `witch-mod-research` 调研”。

## 工作流

1. 判断问题类型：API 查询、概念边界、实现检查、支持度评估。
2. 用 `rg` 搜索 `references/`，再阅读相关段落。
3. 只给一个支持等级：
   - `充分`：reference 直接支持可操作答案。
   - `部分`：有相关事实，但缺机制、生命周期、完整列表、例子或运行证明。
   - `不可确认`：reference 不足。
4. 明确写出“已确认”和“未确认”，不要用字段名、相邻概念、游戏直觉补空。

## 路由

| 需要 | 读取 |
|---|---|
| Lua、XLua、`self`、`CS.*`、字典/List、CSV/JSON/C# 基础 | `references/basic-api.md` |
| Mod 结构、ModConfig、Entry.lua、ID、Data/Text、ScriptExecutor、事件、资源、C# DLL Hook | `references/mod-api.md` |
| UI 窗口类、窗口职责、EventTrigger 名称 | `references/ui-windows.md` |

## 输出形状

```text
支持等级: 充分/部分/不可确认
答案:
依据:
边界:
需要调研:
```

`需要调研` 只在 API 不足时写，指向 `witch-mod-research`，不要在本 skill 内继续查第一事实。

## 反幻觉规则

- `EventList` 不等于“事件卡”。
- 字段列表不等于生命周期说明。
- 方法名不等于完整行为证明。
- 没有完整列表标注时，不要声称“全部”。
- C# 示例脚本语法不能当成 Lua Mod 语法。
- 不要声称 Lua typed event payload 稳定；这需要运行或第一事实调研。
- CSV 局部 ID、运行时完整 ID、ModId、DataId 必须区分。
