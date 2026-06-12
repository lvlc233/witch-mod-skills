# Case: Career With Skill Cards

## 目标

指导 agent 处理“新增职业/职业技能卡”类任务。

## API 查询点

- Career Data/Text 字段。
- `Skill1` / `Skill2` 如何引用卡牌 ID。
- 职业动画、头像、立绘、配音路径规则。
- `SkillScript` 与技能冷却字段的 API 支持度。

## Resources 调研点

- `resources/official/ModTemplate/Data/Career/careersample.csv`
- `resources/official/ModTemplate/Text/Career/careersample.csv`
- `resources/official/Example/Defect/Data/Career/careersample.csv`
- `resources/official/Example/Defect/Data/Card/cardsample.csv`
- `resources/official/Example/Defect/ModResource/`
- `resources/official/ModTemplate/Scripts/Lib/DataConfigs/Data/Career/career.csv`

## 可迁移模式

- Career 可以引用技能卡牌。
- Mod 新增技能卡牌在 Career 字段中应使用运行时完整 ID。
- 职业通常还涉及资源路径和动画目录。

## Builder Brief

- 先复制 Career Data/Text 模板。
- 如果做完整职业，组合 Card、Buff、Resource 案例。
- 以目标 CSV 表头为准；模板和 Defect 示例表头可能不同。

## 不可越界

- API 不完全解释新职业如何进入可选职业 UI。
- 不要机械套用 Defect 示例的所有字段。
- 不要把 Career ID、ModId、技能卡 runtime ID 混用。
