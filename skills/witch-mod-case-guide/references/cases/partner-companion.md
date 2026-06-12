# Case: Partner / Companion

## 目标

指导 agent 处理“使魔、随从、伙伴、伴随行动单位”类 Mod 目标。

## API 查询点

- `Partner` 与 `PartnerCard` 表是否在 API/Data 类型中出现。
- `Partner` 字段：`InitScript`、`ChoiceIcon`、`Model`、`Animation`、`Bless`、`CareerImage`。
- `PartnerCard` 字段：`InitScript`、`TargetScript`、`UseScript`、`Icon`、`Tag`、`Effects`、`Action`。
- Blessing、Relic、FightScript 是否也能承载“随从效果”。

## Resources 调研点

- `resources/official/ModTemplate/Data/Partner/partnersample.csv`
- `resources/official/ModTemplate/Text/Partner/partnersample.csv`
- `resources/official/ModTemplate/Data/PartnerCard/partnercardsample.csv`
- `resources/official/ModTemplate/Text/PartnerCard/partnercardsample.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Data/Partner/Partner.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Data/PartnerCard/PartnerCard.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Text/Partner/Partner.csv`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Text/PartnerCard/PartnerCard.csv`
- 需要确认进入战斗/行动流程时，查反编译。

## 可迁移模式

- 官方模板确认存在 `Partner` 和 `PartnerCard` 两类表。
- Lib 原版配置显示 Partner 可关联 `Bless`，并有模型、动画、图标字段。
- PartnerCard 类似行动卡，包含目标脚本、使用脚本、特效和动作字段。
- 这支持“使魔/随从”方向的实现探索，但不自动确认完整获得流程或 UI 流程。

## Builder Brief

- 从 Partner 和 PartnerCard 的 Data/Text sample 复制。
- 保留 row 1/row 2。
- 设计 Partner 局部 ID 和 PartnerCard 局部 ID。
- 如果使用 Mod 自带模型/动画，结合 Resource case 设置路径。
- 如果通过 Bless 字段关联祝福，组合 Buff/Blessing research。

## 不可越界

- 不要直接说 Partner 等于“宠物系统”；它只是官方表名和原版模式。
- 不要从 `Bless` 字段推断获得流程。
- 不要从 PartnerCard 字段推断行动 AI 或回合调度；需要反编译或运行验证。

## 验证清单

- Partner Data/Text 是否配对。
- PartnerCard Data/Text 是否配对。
- Bless 引用是否使用正确 ID。
- 动画/模型路径是否存在。
- 行动触发、目标选择、冷却/优先级是否经过运行验证。
