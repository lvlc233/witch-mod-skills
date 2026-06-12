# Deep Research Method

用于复杂问题，例如加载顺序、事件时机、`PackBelong` 机制、字段语义、样例 helper、UI 流程。

## 输入

调研开始前收集三类输入：

- 用户线索：用户指出的文件、现象、猜测、问题表条目、已有结论。
- API 边界：`../witch-mod-api` 的支持等级、已确认事实和缺失事实。
- 资源范围：`../../resources/` 下要查的官方资料、反编译资料或用户补充资料。

## 问题拆解

把一个大问题拆成可验证的小问题：

```text
原问题: PackBelong 怎么生效？
子问题:
1. 哪些 Data/Text 表有 PackBelong 字段？
2. 模板和 Example 是否都使用它？
3. Lib 原版配置里 PackBelong 值长什么样？
4. API/TypeHint/反编译里是否有读取 PackBelong 的方法？
5. 能确认“进入卡包”的流程吗，还是只能确认“所属卡包 ID”？
```

## 调研顺序

1. 先查 API references，明确已有边界。
2. 查 `resources/official/README.zh-CN.md` 和模板 README，找官方说明。
3. 查 `ModTemplate/Data` 和 `Text`，确认表头和备注。
4. 查 `Example`，看官方示例如何落地。
5. 查 `ModTemplate/Scripts/Lib/DataConfigs`，看原版配置是否存在同类模式。
6. 查 `TypeHint_*.lua`，确认对象、方法、字段是否暴露。
7. 仍缺机制时，查反编译；标注版本和推断链。
8. 用户提供其他 Mod 时，只作为外部参考对比。

## 交叉验证

至少区分四种证据：

- 模板规则：模板 README 或 sample CSV 明确说明。
- 样例现象：Example 中出现过。
- 原版模式：Lib 原版配置大量使用。
- 源码机制：反编译显示实际读取或调用。

结论要说明证据组合。例如：

```text
已确认: Card 模板有 PackBelong 字段，Lib 中多个卡/遗物/祝福配置也有 cardpack_x 值。
部分确认: 它表示所属卡包 ID。
不可确认: 玩家如何获得该卡包、该字段何时被读取，需要源码或运行验证。
```

## 深度思考要求

- 对用户猜测先写“可证伪假设”，再查证。
- 如果 API 与第一事实冲突，标出冲突，不自动覆盖。
- 如果模板、Example、Lib 不一致，说明差异，不强行统一。
- 对“是否通用”必须回答可推广范围。
- 对“为什么”必须有源码、官方说明或运行观察；否则只能写推断。
- 对“怎么写 Mod”只给 research 结论，不直接生成文件。

## 输出

使用 `report-format.md`，并额外包含：

```text
API 边界:
用户线索:
假设:
证据矩阵:
结论:
仍需验证:
```
