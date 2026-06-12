# Case: Buff With Event

## 目标

指导 agent 处理“新增一个会监听事件的 Buff”类任务。

## API 查询点

- Buff Data/Text 字段。
- `InitScript`、`ApplyScript`、`ClearScript` 和层数减少字段。
- ScriptExecutor 的 `AddEvent`、`AddTempEvent`。
- Lua typed event payload 是否稳定。

## Resources 调研点

- `resources/official/ModTemplate/Data/Buff/buffsample.csv`
- `resources/official/ModTemplate/Text/Buff/buffsample.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Data/Buff/buff.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Text/Buff/buff.csv`
- `resources/official/Example/Defect/Data/Buff/buffsample.csv`

## 可迁移模式

- `ApplyScript` 常用于注册事件监听。
- 监听中通常先选择目标，再执行加 Buff、伤害、防御等效果。
- 层数和临时状态优先用 `self.Vars` 或相关封装，具体字段需查 API/research。

## Builder Brief

- 从官方 Buff Data/Text sample 复制。
- 保留表头和备注行。
- Mod Buff 被其他脚本引用时使用运行时完整 ID。
- 如果只用无参事件，可先采用 `self:AddEvent("EndRound", function() ... end)` 模式。

## 不可越界

- 不要把 `AddEvent<T>` 或原版 C# 泛型事件直接当 Lua 写法。
- 不要假设所有事件都有稳定 Lua payload。
- 不要从事件名推断完整触发顺序。
