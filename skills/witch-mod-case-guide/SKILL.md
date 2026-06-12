---
name: witch-mod-case-guide
description: Use when an agent needs Witch's Apocalyptic Journey mod case guidance, reusable mod implementation patterns, task routing from user goals to API/research/builder work, question-table evaluation, or case briefs such as companion, pet system, card, buff, career, resource, event chain, card pack, or relic counter mods.
---

# Witch Mod Case Guide

本 skill 是给 agent 用的案例桥梁层。它不以“教人类”为目标，而是把用户目标转成可执行的案例路径、API 查询点、resources 调研点和 builder brief。

## 职责边界

- API 支持度由 `../witch-mod-api` 判断。
- 第一事实调研由 `../witch-mod-research` 执行。
- 文件生成由 `../witch-mod-builder` 执行。
- 本 skill 负责：任务路由、案例选择、案例拆解、反幻觉边界、给 builder 的实现 brief。

## 工作流

1. 把用户目标归类：Card、Buff、Career、Partner/Companion、Pet system、Event chain、Card pack、Relic、Resource、DLL Hook、UI 等。
2. 读取 `references/case-method.md`，选择或组合案例。
3. 先列 API 查询点，再列 resources 调研点。
4. 如果案例依赖未确认机制，输出 research 任务，不直接写成事实。
5. 如果目标可以实现，输出给 builder 的 brief 和验证清单。

## Reference Routing

| 需要 | 读取 |
|---|---|
| 案例拆解、输出格式、builder brief | `references/case-method.md` |
| 问题表评估 | `references/question-table-method.md` |
| ID、CSV、Lua、事件、Hook、资源基础概念 | `references/concepts/ids.md`、`csv-data-text.md`、`lua-xlua.md`、`events.md`、`hooks.md`、`resources.md` 中相关文件 |
| 卡牌 | `references/cases/card-basic.md` |
| Buff/事件触发效果 | `references/cases/buff-event.md` |
| 职业/技能 | `references/cases/career-skill.md` |
| 使魔/随从/伙伴 | `references/cases/partner-companion.md` |
| 宠物系统组合目标 | `references/cases/pet-system.md` |
| 资源替换 | `references/cases/resource-replace.md` |

## 输出形状

```text
任务分类:
相关案例:
API 查询点:
resources 调研点:
可迁移模式:
给 builder 的 brief:
不可越界:
验证清单:
```

## 硬规则

- 案例不是权威事实；案例必须绑定 API 或 resources 证据。
- 不要把“宠物系统”“使魔系统”等用户命名直接当成官方系统。
- 不要把一个 Example 或其他 Mod 的写法推广成通用规则。
- 不要绕过 research 去解释生命周期、获得流程、加载顺序、事件参数。
- 输出给 builder 前，必须说明哪些字段/机制已确认，哪些仍需验证。
