# Case: Pet System

## 目标

指导 agent 处理用户提出的“宠物系统”目标。这里的“宠物系统”是用户目标名，不是已确认官方系统名。

## 任务拆解

宠物系统通常可能组合多个子案例：

- Partner / Companion：宠物实体、模型、动画、关联祝福。
- PartnerCard：宠物行动。
- Blessing / Relic：宠物带来的被动或战斗效果。
- Resource：宠物图标、模型、动画。
- Event / UI：宠物获得、选择、显示流程；这部分通常需要 research。

## API 查询点

- API 是否确认 Partner、PartnerCard、Blessing、Relic、Resource 的字段。
- API 是否确认宠物获得流程、选择 UI、行动调度。
- ScriptExecutor / PlayerInfo 是否有可用方法支持相关流程。

## Resources 调研点

- 先看 `partner-companion.md` 的所有 Partner/PartnerCard 路径。
- 查 Blessing/Relic 原版配置中是否有随从/宠物效果模式。
- 查 UI windows references 是否有 Partner 或选择界面线索。
- 需要完整机制时查反编译：Partner 如何加载、如何绑定 Bless、如何行动、如何进入 UI。
- 用户提供其他 Mod 时放入 `resources/`，作为外部参考对比。

## 可迁移模式

- 可以把“宠物”拆为：数据实体 + 行动卡 + 被动效果 + 资源 + 获得/显示流程。
- 官方资料支持 Partner/PartnerCard 作为候选实现基础。
- 获得流程和 UI 流程默认不可确认，需要 research。

## Builder Brief

只有在 research 确认最低实现路径后才交给 builder。brief 至少包含：

- 使用 Partner/PartnerCard 还是 Blessing/Relic 承载。
- 需要复制的官方模板。
- 资源路径。
- ID 映射。
- 哪些流程不做或需要运行验证。

## 不可越界

- 不要把“宠物系统”作为官方名词。
- 不要承诺 UI、获得方式、行动调度能直接由 CSV 完成。
- 不要用其他 Mod 的做法覆盖官方事实。
