---
name: witch-mod-research
description: Use when Witch's Apocalyptic Journey mod questions require first-fact research in bundled resources such as official templates, examples, Lib files, decompiled files, or third-party mods, especially when API notes are partial or unverifiable.
---

# Witch Mod Research

本 skill 专门做第一事实调研。它不负责直接写最终 API 文档，也不负责生成 Mod 文件。

## 默认资料根

默认从仓库相对路径读取资源：

```text
../../resources/
```

官方默认资料在：

```text
../../resources/official/
```

不要使用环境变量。用户额外提供的其他 Mod、补充资料、反编译版本也应放在 `resources/` 下，再按来源命名。

## 事实等级

| 等级 | 来源 | 使用方式 |
|---|---|---|
| 第一事实 | `official/ModTemplate`、`official/DllTemplate`、`official/Example`、`official/README.zh-CN.md`、`official/ModTemplate/Scripts/Lib` | 可作为官方材料观察，但仍要区分“模板规则”和“样例现象” |
| 1.5 级事实 | 反编译文件、反编译 zip、运行时代码观察 | 可解释机制，但要标注版本和推断链 |
| 第二事实 | `witch-mod-api/references` | 整理后的干净 API 手册，不替代第一事实 |
| 外部参考 | `resources/` 下其他人的 Mod 或第三方资料 | 只能辅助对比，不能覆盖官方事实 |

## 调研流程

1. 先把问题改写成可查证的问题，例如“`PackBelong` 如何影响卡包”。
2. 搜索 `../../resources/official`，优先看模板、Example、README、Lib。
3. 如果模板/Example 不足，再查反编译资料；必须记录版本或文件名。
4. 判断证据类型：明确规则、模板字段、样例写法、源码机制、推断。
5. 输出调研报告，不要直接改 API 文档或 skill。

## 输出形状

```text
结论等级: 已确认/部分确认/不可确认
问题:
调研路径:
证据:
可推广范围:
不能推广:
建议沉淀到:
```

## 硬规则

- 不要把一个 Example 的写法当成全局规则。
- 不要把字段名当成机制。
- 不要把反编译观察省略版本。
- 不要修改 `resources/official` 里的官方材料。
- 如果要沉淀结论，先说明应进入 `witch-mod-api`、`witch-mod-teaching` 还是 `witch-mod-builder`。
