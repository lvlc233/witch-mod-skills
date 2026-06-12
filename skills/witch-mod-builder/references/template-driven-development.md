# Template Driven Development

Builder 的核心原则：从官方模板复制，改目标副本，不发明模板。

## 输入

- 目标 Mod 名称、作者、功能描述。
- 目标类型：Lua Mod、C# DLL Hook、Card、Buff、Career、资源替换、修改已有 Mod。
- API 支持度。
- 必要时的 research 报告。

## 选择模板

| 目标 | 首选模板 |
|---|---|
| 新 Lua Mod | `../../resources/official/ModTemplate/` |
| 新 C# DLL Hook Mod | `../../resources/official/DllTemplate/` |
| 新 Card | `ModTemplate/Data/Card/cardsample.csv` + `Text/Card/cardsample.csv` |
| 新 Buff | `ModTemplate/Data/Buff/buffsample.csv` + `Text/Buff/buffsample.csv` |
| 新 Career | `ModTemplate/Data/Career/careersample.csv` + `Text/Career/careersample.csv`，再参考 `Example/Defect` |
| 动画/角色综合例子 | `Example/Defect/` |
| 其他 Data/Text | `ModTemplate/Data/<Type>/*sample.csv` + `Text/<Type>/*sample.csv` |

## 开发流程

1. 复制模板到目标工作区。
2. 删除目标不需要的样例行，但保留 row 1 表头和 row 2 备注。
3. 修改 `ModConfig.json`。
4. 确认文件名，因为运行时完整 ID 使用文件名。
5. 设计局部 ID；需要不进随机池/特殊条目时才保留 `*`。
6. 计算运行时完整 ID。
7. 填 Data 行和 Text 行，确保同目录、同文件名、同局部 ID 配对。
8. 写 Lua 脚本；如果参考 Lib 原版 C# 脚本，先改写为 Lua/XLua。
9. 填资源路径；区分原版路径和 `Mods/<ModName>/...`。
10. 跑 `implementation-checklist.md` 和 `verification.md`。

## 不确定机制处理

遇到以下情况，不要猜，转 `witch-mod-research`：

- 字段语义不清楚，例如 `PackBelong`、`Belong`、`Type`。
- 生命周期不清楚，例如 `InitScript`、`ApplyScript`、`EntryScript` 何时执行。
- 事件参数不清楚，例如 typed payload。
- 模板和 Example 表头不一致。
- 需要说明“为什么”或“是否通用”。

## 输出

```text
变更文件:
使用模板:
ID 映射:
API 依据:
Research 依据:
静态检查:
运行风险:
```
