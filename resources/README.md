# Resources

`resources/` 是调研材料区。Skill 默认按仓库相对路径读取这里，不使用环境变量。

## 默认官方资料

```text
resources/official/
  README.zh-CN.md
  ModTemplate/
  DllTemplate/
  Example/
  反编译文件夹v1.0.23669078.zip
```

## 资料用途

| 路径 | 适合回答的问题 | 注意 |
|---|---|---|
| `official/README.zh-CN.md` | 总体目录、快速开始、发布流程、官方说明 | 通常是入口，不一定覆盖细节 |
| `official/ModTemplate/README.zh-CN.md` | Lua Mod 编写、Data/Text、Entry.lua、发布/排错 | 是模板说明，不等于完整运行机制 |
| `official/ModTemplate/Data/` | 各 Data CSV 的模板表头和备注行 | 适合 builder 复制；不要原地修改 |
| `official/ModTemplate/Text/` | 各 Text CSV 的模板表头和备注行 | 与 Data 同名同 Id 配对 |
| `official/ModTemplate/Scripts/Entry.lua` | Lua Mod 入口和 ModConfig 写法 | 只说明入口样例 |
| `official/ModTemplate/Scripts/ScriptSample.lua` | ScriptExecutor 脚本上下文样例 | 需要与 API 和 Lib 交叉验证 |
| `official/ModTemplate/Scripts/Lib/TypeHint_*.lua` | 类型提示、可见类/方法/字段 | TypeHint 不等于运行证明 |
| `official/ModTemplate/Scripts/Lib/DataConfigs/` | 原版 Data/Text 配置参考 | 适合查字段、样例脚本、ID、文本结构 |
| `official/DllTemplate/` | C# DLL Hook 模板和工程结构 | 适合 C# Hook 任务 |
| `official/Example/Defect/` | 官方综合示例：卡、Buff、Career、资源 | 只能证明示例写法，不能自动推广为通用规则 |
| `official/反编译文件夹*.zip` | 运行机制、类实现、UI/事件源码线索 | 1.5 级事实；必须标注版本和推断链 |

## 用户补充资料

可以把其他资料放在 `resources/` 下，例如：

```text
resources/community-mods/<mod-name>/
resources/decompiled/<version>/
resources/notes/<topic>.md
```

调研报告必须写明具体路径和来源层级。其他人的 Mod 只能作为外部参考，不能覆盖官方模板和官方源码观察。
