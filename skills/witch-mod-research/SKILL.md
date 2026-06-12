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

1. 先读取 `references/deep-research-method.md` 和 `references/report-format.md`。
2. 读取 `../witch-mod-api` 的相关结论，记录 API 已确认、缺失和警告/禁止项。
3. 提取用户线索：用户指出的文件、问题表编号、猜测、现象、已有答案。
4. 把问题建模成多个可证伪假设；每个假设写明需要什么证据。
5. 搜索 `../../resources/official`，优先看 README、模板、Example、Lib，再看反编译。
6. 用证据矩阵记录路径、事实等级、支持哪个假设、限制什么、不能证明什么。
7. 输出最小可确认结论、可推测但未确认点、不可确认点和下游建议；不要直接改 API 文档或生成 Mod 文件。

## Reference Routing

| 需要 | 读取 |
|---|---|
| 资源结构、每类资料用途 | `references/source-map.md` |
| 深度调研、用户线索、API 缺口、交叉验证 | `references/deep-research-method.md` |
| 调研报告格式 | `references/report-format.md` |

## 输出形状

```text
结论等级: 已确认/部分确认/不可确认
问题:
用户线索:
API 边界:
假设:
证据矩阵:
冲突与处理:
最小可确认结论:
可迁移边界:
下游建议:
```

## 硬规则

- 不要把一个 Example 的写法当成全局规则。
- 不要把字段名当成机制。
- 不要把反编译观察省略版本。
- 不要修改 `resources/official` 里的官方材料。
- 不要忽略用户提供的线索；线索必须进入“假设”或“调研路径”。
- 不要只看一个文件就下结论；复杂机制至少尝试 API、模板、Example、Lib 交叉验证。
- 不要只写支持证据；API 未写、模板缺字段、Example 未使用等负证据也要进入限制。
- 不要把“可推测但未确认”写成“已确认”。
- 如果要沉淀结论，先说明应进入 `witch-mod-api`、`witch-mod-case-guide` 还是 `witch-mod-builder`。
