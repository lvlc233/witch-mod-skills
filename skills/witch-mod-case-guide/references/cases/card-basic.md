# Case: Basic Card

## 目标

指导 agent 处理“新增一张卡牌”类任务，并产出给 builder 的 brief。

## API 查询点

- Card Data/Text 的字段和配对规则。
- CSV 局部 ID 与运行时完整 ID 规则。
- `InitScript`、`UseScript`、`DrawScript`、`DropScript` 的 Lua/XLua 边界。
- `AttackCardItem` 与 `CommonCardItem` 的目标选择差异。

## Resources 调研点

- `resources/official/ModTemplate/Data/Card/cardsample.csv`
- `resources/official/ModTemplate/Text/Card/cardsample.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Data/Card/`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Text/Card/`
- 需要真实卡牌模式时再查 `Example/Defect/Data/Card/cardsample.csv`

## 可迁移模式

- Card 通常由一行 Data 和一行 Text 组成。
- Data/Text 使用同目录、同文件名、同局部 ID 配对。
- 脚本和跨表引用 Mod 卡牌时使用运行时完整 ID。
- 原版 Lib 中的脚本多为 C# 风格，不能直接复制到 Lua Mod。

## Builder Brief

- 从官方 Card Data/Text sample 复制目标文件。
- 保留 row 1 表头和 row 2 备注。
- 设计局部 ID，例如 `*my_card`。
- 根据 `ModName_FileName_Id` 计算运行时完整 ID。
- 按是否选目标选择 `BaseScript` 模式。

## 不可越界

- 不要把 `*local_id` 写进 `AddCardById` 或职业技能字段。
- 不要把原版 C# 脚本原样放进 Mod CSV。
- 不要假设 `PackBelong` 的获得流程；这需要 research。
