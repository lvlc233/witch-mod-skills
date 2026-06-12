# Teaching Method

教学目标是让中文母语开发者理解事实、边界和实践方式，而不是把不确定内容讲满。

## 输入来源

- API 支持度：来自 `../witch-mod-api`。
- 调研报告：来自 `../witch-mod-research`，必须保留事实等级。
- 用户目标：概念理解、问题表、学习路线、案例练习、改已有 Mod。

## 教学结构

优先使用这个结构：

```text
支持等级:
一句话结论:
已确认:
怎么理解:
最小例子:
常见误解:
还不能确认:
下一步:
```

## 问题表评估

处理问题表时：

1. 按题目类型分类：API 查找、概念解释、机制/生命周期、示例代码、实现任务。
2. 先用 API 支持度标记 `充分/部分/不可确认`。
3. 对 `部分/不可确认`，写清楚缺什么事实。
4. 如果缺口能被 resources 回答，生成 research 子问题。
5. 不把 research 任务直接写成已确认答案。

## 从事实到教学

| 事实状态 | 教学方式 |
|---|---|
| API 充分 | 可以直接解释并给最小例子 |
| API 部分 | 只讲已确认部分，把缺口作为边界 |
| Research 已确认 | 可以教学，但标注来源层级 |
| Research 部分确认 | 教“能做什么”，不讲未确认机制 |
| 不可确认 | 转成调研问题或验证清单 |

## 学习路径

推荐顺序：

1. Mod 目录结构、`ModConfig.json`、`Entry.lua`。
2. Data/Text CSV、第二行备注、Data/Text 配对。
3. ID：局部 ID、运行时完整 ID、ModId、DataId。
4. Lua/XLua：`self:`、`CS.*`、字典/List。
5. ScriptExecutor：目标选择、Buff、Damage、事件。
6. 资源：ModResource、RedirectSourcePath、动画配置。
7. Hook：Lua Hook 与 C# DLL Hook。
8. 复杂系统：卡包、事件、职业、UI、存档变量；这些通常需要 research。

## 练习设计

练习应小而可验证：

- 看一个 CSV，指出 row 1/row 2/数据行。
- 给一个局部 ID，写出运行时完整 ID。
- 判断某个脚本应该用 `self:` 还是 `ScriptExecutor.PlayerInfo`。
- 找出 C# 原版脚本中不能直接复制到 Lua 的部分。
- 给出一个 API 不足的问题，并写 research 子问题。

## 禁止

- 不要为了教学流畅而省略事实等级。
- 不要把 Example 里的 helper 当成 API。
- 不要把“字段名像什么”讲成机制。
- 不要在没有证据时解释设计动机。
