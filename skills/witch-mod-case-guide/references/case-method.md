# Case Method

案例用于指导 agent 如何从一个 Mod 目标走到 API 查询、第一事实调研和 builder brief。案例不是人类教程，也不是最终实现文件。

## 输入

- 用户目标：例如“写一个使魔”“做宠物系统”“新增卡包”“做事件链”。
- 用户线索：提到的字段、文件、已有 Mod、游戏现象、问题表条目。
- API 边界：`../witch-mod-api` 已确认和未确认的内容。
- Research 结果：如有，保留事实等级。

## 案例处理流程

1. 识别目标属于哪个案例或案例组合。
2. 读取对应 `references/cases/*.md`。
3. 列出 API 查询点，不把未查内容当事实。
4. 列出 resources 调研点，交给 `witch-mod-research`。
5. 提炼可迁移模式：只写有证据支持的模式。
6. 生成 builder brief：模板来源、目标文件、ID 规则、资源路径、脚本边界。
7. 写不可越界项和验证清单。

## 输出格式

```text
任务分类:
相关案例:
用户线索:
API 查询点:
resources 调研点:
可迁移模式:
给 builder 的 brief:
不可越界:
验证清单:
```

## 案例质量标准

- 每个案例都要说明先查 API 什么。
- 每个案例都要说明 resources 查哪些路径。
- 每个案例都要区分“官方模板规则”“官方 Example 写法”“Lib 原版模式”“反编译机制”“外部 Mod 参考”。
- 每个案例都要能转成 builder brief。
- 每个案例都要列出不能直接确认的部分。

## 组合案例

复杂 Mod 通常是多个案例组合：

- 宠物系统 = Partner/Companion + PartnerCard + Blessing/Relic + Resource + 可能的 UI/事件。
- 新职业 = Career + Card + Buff + Resource + 可能的 Event/Dialogue。
- 卡包系统 = Card + CardPack + PackBelong + 掉落/获得流程调研。
- 事件链 = EventList + Dialogue + Map/Level + PlayerInfo event API。

组合案例时，先分别确认每个子系统，再说明它们之间的关系是否已被第一事实支持。
