# Case: Resource Replace

## 目标

指导 agent 处理资源替换、ModResource 路径和动画资源任务。

## API 查询点

- `RedirectSourcePath(originalPath, newPath)` 参数方向。
- ModResource 路径规则。
- CSV 字段中直接引用资源路径的规则。
- 动画 `config.json` 字段。

## Resources 调研点

- `resources/official/ModTemplate/ModResource` 如果用户提供。
- `resources/official/Example/Defect/ModResource/AnimationLib/Defect/`
- `resources/official/Example/Defect/Data/Career/careersample.csv`
- `resources/official/ModTemplate/README.zh-CN.md`

## 可迁移模式

- 替换原版资源时使用 `RedirectSourcePath`。
- 新增条目拥有自己的资源字段时，字段可直接写 ModResource 路径。
- 动画状态目录需要 `config.json`，图片帧和配置不能混用。

## Builder Brief

- 明确是“重定向原版资源”还是“新增资源字段”。
- Mod 自带资源放入目标 Mod 的 `ModResource/`。
- 路径中使用目标 ModName，而不是模板名。

## 不可越界

- 不要给所有资源字段机械添加 `Mods/<ModName>/ModResource/`。
- 不要交换 `RedirectSourcePath` 的两个参数。
- API 不确认所有支持的图片/音频格式。
