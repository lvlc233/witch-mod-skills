# Basic API

General C#, Lua, XLua, CSV, JSON, and project-tooling conventions used by this mod repository.

## Lua 语法

### 冒号调用 vs 点调用
- `obj:method(args)` 等价于 `obj.method(obj, args)`，冒号自动传递 `self`
- Mod 脚本中必须使用 `self:method()` 调用 ScriptExecutor 方法

### 常用语法形态
- 函数定义: `function Name(args) ... end`
- 匿名函数/回调: `function(args) ... end`
- 局部变量: `local name = value`
- 空值判断: `if value == nil then return end`
- 非空判断: `if value ~= nil then ... end`
- 条件分支: `if condition then ... end`
- 取反: `if not condition then ... end`
- 比较: `>`, `<`, `>=`, `<=`
- 数值循环: `for i = 1, count do ... end`
- 表字面量: `local list = { "a", "b", "c" }`
- 字符串拼接: `"prefix" .. name`
- 数值/字符串转换: `tonumber(value)`, `tostring(value)`
- 向下取整: `math.floor(value)`
- 随机选择: `math.random(1, #list)`
- 行尾分号在示例中混用；Lua 中通常可省略


*来源: ModTemplate/README.zh-CN.md:90-91, ModTemplate/Scripts/Entry.lua, Example/Defect/Data/Card/cardsample.csv*

## XLua 互操作

### 字符串字典访问
- C# `Dictionary<string, T>` 在 Lua 中不能用 `[]`
- 必须使用 `dict:get_Item(key)` 和 `dict:set_Item(key, value)`
- 常见配套方法: `dict:ContainsKey(key)`

### CS 命名空间
- 通过 `CS.UnityEngine.Debug.Log(...)` 调用 C# 静态方法
- 示例中也使用 `CS.Commands.Log(...)` 调用项目暴露的 C# 日志方法
- `CS.Commands.Log(...)` / `Commands.Log(...)` 是游戏原生日志系统，Lua 和 C# Mod 都可用；`CS.UnityEngine.Debug.Log(...)` 是 Unity 通用日志
- 通过 `CS.<类型或命名空间>` 访问 C# 类型、静态属性和静态方法
- 可先赋值到 Lua 局部变量再调用: `local Debug = CS.UnityEngine.Debug; Debug.Log("msg")`
- 静态嵌套类型/成员可继续点访问，如 `CS.ScriptExecutor.PlayerInfo`

### C# 集合访问
- C# List 等集合常见数量属性为 `.Count`
- C# List/字典索引器在 XLua 中常通过 `obj:get_Item(indexOrKey)` 获取元素
- 从 Lua 遍历 C# 集合时，索引通常按 C# 的 0 起始集合习惯写 `for i = 0, list.Count - 1 do ... end`

*来源: ModTemplate/README.zh-CN.md:77-79, 37-39, ModTemplate/Scripts/Entry.lua, Example/Defect/Data/Card/cardsample.csv*

### Lua Hook 参数展开
- Hook 示例里的 `ctx` 不是 Lua 侧必须手动解包的固定对象；适配层会把 `ModHookContext` 展开后传给 Lua 函数
- Hook 实例方法时，Lua 函数第一个参数是被 Hook 的实例，后面依次是原方法参数
- Hook 静态方法时，Lua 函数参数直接从原方法参数开始

```lua
self:AddMethodHookBefore("SettingUI.OnEnable", function(instance)
  CS.Commands.Log("Hook", "SettingUI.OnEnable")
end)
```

*来源: ModHookContext.cs, LuaModHookAdapter.cs, ModTemplate/README.zh-CN.md:37-39*

## EmmyLua 类型提示

```lua
---@type CS.ScriptExecutor
self = self; -- 仅用于类型提示，让 IDE 提供代码补全
```

*来源: ScriptSample.lua:2-3*

## CSV 格式

### 基本结构
- 第 1 行是表头，必须与目标表结构一致
- 第 2 行是注释/字段说明，建议保留
- 后续行是数据记录
- Data CSV 通常保存数值、路径、脚本等配置
- Text CSV 通常保存文本和本地化列
- Text CSV 中常见本地化后缀包括 `_en`, `_zh-Hant`, `_ja`
- README 中也出现 `_zh_hant`, `_jp` 的写法；实际 CSV 表头主要使用 `_zh-Hant`, `_ja`

### 脚本字段转义
- 含逗号、分号或多段 Lua 代码的字段应整体用双引号包裹
- 字段内部的双引号需要写成两个双引号，例如 `""Self""`
- 空字段保留逗号占位

```csv
Id,InitScript,UseScript
sample,"self.Vars:set_Item(""BaseScript"", ""CommonCardItem"");","self:SetStatus(""Self"");"
```

*来源: ModTemplate/README.zh-CN.md:51-56, ModTemplate/Data/Card/cardsample.csv, Example/Defect/Data/Card/cardsample.csv*

## JSON 格式

### 基本形态
- JSON 对象使用 `{ ... }`
- 字段名和字符串值使用双引号
- 布尔值使用 `true` / `false`
- 空值可使用 `null`
- 数组使用 `[ ... ]`

ModConfig 与动画资源配置属于游戏 Mod 结构，见 `mod-api.md`。

## C# 语法

### 文件结构
- `using` 引入命名空间
- `namespace Name;` 可使用 file-scoped namespace 写法
- `public static class Name` 定义静态类
- 静态方法使用 `public static void Method(...)`

### Attribute 写法
- Attribute 写在目标声明前，形如 `[AttributeName]`
- 带参数 Attribute 形如 `[HookBefore(typeof(TargetType), nameof(TargetType.MethodName))]`
- `typeof(TypeName)` 取得类型对象
- `nameof(TypeName.Member)` 取得成员名字符串
- Hook 示例支持 `[HookBefore(...)]` 和 `[HookAfter(...)]`
- Patch 方法必须为 `static`
- Hook 实例方法时，第一个参数默认为实例本身
- Patch 方法参数可以不全，但必须保持原有顺序

```csharp
using Witch.Mod;
using Witch.UI.Window;

namespace DllTemplate;

public static class DllTemplate
{
    [ModInitialize]
    public static void Entry(ModConfig modConfig)
    {
        Commands.Log("DllTemplate", "DllTemplate生效");
    }
}

class Patch
{
    [HookBefore(typeof(SettingUI), nameof(SettingUI.OnEnable))]
    public static void OnEnable(SettingUI __instance)
    {
        Commands.Log("DllTemplate", "OnEnable");
    }
}
```

*来源: DllTemplate/Dev/Entry.cs, DllTemplate/readme.zh-CN.md*

C# DLL 工程配置属于 Mod 构建流程，见 `mod-api.md` 的 C# DLL Hook 模板。

---
