# Mod API

Game-specific mod concepts, classes, methods, events, config tables, resource paths, hook behavior, ID rules.

---

## Mod 类型

| 类型 | 模板目录 | 入口 | 用途 |
|------|---------|------|------|
| Lua Mod | `ModTemplate/` | `Scripts/Entry.lua` | 新增卡牌/Buff/文本, 资源重定向, Lua Hook |
| C# DLL Hook Mod | `DllTemplate/` | `Scripts/Entry.dll` (编译后) | 复杂 Hook, 需要 C# 特性 |

Lua Mod 是优先选择：大多数新增 Data/Text、资源替换和脚本效果都能通过 Lua Mod 完成。C# DLL Hook Mod 适合需要强类型、复杂 Hook 或直接访问 C# 特性的场景。

## Mod 目录结构

```
ModName/
  ModConfig.json          # 必填: ModName, ModAuthor, ModVersion, ModDescription, IconPath
  Scripts/Entry.lua        # Lua 入口 (Lua Mod)
  Scripts/Entry.dll        # 编译后 DLL (C# Mod)
  Data/                    # 数值配置 CSV
  Text/                    # 文本配置 CSV
  ModResource/             # 图片、动画等资源
```

- 目录名必须与 `ModConfig.json` 中 `ModName` 一致
- `Scripts/Entry.lua` 和 `Scripts/Entry.dll` 是二选一入口；一个 Mod 可以带数据、文本和资源，但运行入口取决于 Mod 类型

## 发布

- 本地验证后使用 `WorkshopUploader.exe` 上传到 Steam 创意工坊
- `PublishedFileId` 首次上传后自动写回
- `.meta` 文件和 `Scripts/Lib/DataConfigs` 不会上传
- 发布前确认 Mod 根目录内只保留运行需要的文件；开发工程、外部资料和本地缓存不要依赖上传后存在

---

## ModConfig.json 字段

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `ModName` | string | 是 | Mod 名称，与目录名一致 |
| `ModAuthor` | string | 是 | 作者名 |
| `ModVersion` | string | 是 | 版本号 |
| `ModDescription` | string | 是 | 描述（创意工坊默认来源） |
| `IconPath` | string | 是 | 预览图路径（通常 `Icon.png`） |
| `Enabled` | bool | 是 | 本地是否启用 |
| `Dependencies` | string[] | 否 | 依赖列表，格式 `ModName.ModAuthor` |
| `PublishedFileId` | string | 否 | 首次上传后自动写回 |
| `WorkshopVisibility` | string | 否 | `Public`, `FriendsOnly`, `Private`, `Unlisted` |

**规则**
- Mod 目录名必须与 `ModName` 一致。
- `ModId` 是运行时标识，格式为 `ModName.ModAuthor`。
- `Dependencies` 写依赖 Mod 的 `ModId`，不是 Data/Text 条目 ID。

**不要**
- 不要把 `ModId` 当作卡牌、Buff、职业技能等数据条目 ID。
- 不要把 Data/Text 的运行时条目 ID 写进 `Dependencies`。

**版本风险**
- 创意工坊相关字段可能随上传工具变化；本地加载必需字段通常是 `ModName`、`ModAuthor`、`ModVersion`、`ModDescription`、`IconPath`、`Enabled`。

## ModConfig Lua API (Setup 内可用)

### 数据修改
| 方法 | 说明 |
|------|------|
| `SetDataConfig(id, table)` | 整行替换（跳过 Id 列）。含 `*Script` 后缀字段时触发重编译 |
| `ModifyDataConfig(id, key, value)` | 单字段修改。key 含 `*Script` 后缀时触发重编译 |
| `MergeDataConfig(source, target)` | 按前缀合并两表。source 行 ADD 到 target，不覆盖同名 key。含 Script 行时触发重编译 |

**规则**
- `SetDataConfig` / `ModifyDataConfig` 用于改已存在的数据行，`id` 写目标行的实际 ID，例如 `career_3`。
- 这两个 API 不是新增 Mod 条目的入口。新增条目应放在 `Data/` 和 `Text/` CSV 中。
- 修改 `*Script` 后缀字段会触发脚本重编译。

**示例**
```lua
function ModConfig:Setup()
  self:ModifyDataConfig("career_3", "Name", "故障机器人")
end
```

**不要**
- 不要用 `ModifyDataConfig("defect_discharge", ...)` 试图修改新增 Mod 卡牌；新增卡牌应写 CSV。
- 不要把 CSV 局部 ID 和游戏运行时完整 ID 混到 `SetDataConfig` / `ModifyDataConfig` 的原版行修改场景里。

### 资源和方法注册
| 方法 | 说明 |
|------|------|
| `RedirectSourcePath(originalPath, newPath)` | 资源路径重定向 |
| `AddDynamicMethod(methodName, fn)` | 注册为全局 Lua 方法, C# 侧可通过 `luaEnv.Global.Get(methodName)` 调用 |

`AddDynamicMethod(methodName, fn)` 会把 Lua 函数注册到 `ScriptExecutor.luaEnv.Global`；典型用途是让 C# 代码或其他 Mod 后续按名称取出并调用该全局 Lua 方法。

**示例**
```lua
function ModConfig:Setup()
  self:AddDynamicMethod("MyGlobalMethod", function()
    CS.Commands.Log("MyMod", "called")
  end)
end
```

### Hook 注册
| 方法 | 说明 |
|------|------|
| `AddMethodHookBefore(typeDotMethod, fn)` | 前置 Hook。typeDotMethod 格式: `Type.MethodName` |
| `AddMethodHookAfter(typeDotMethod, fn)` | 后置 Hook |

### Hook 回调函数签名
Lua Hook 函数接收原始方法的参数：
- **实例方法**: `function(instance, arg1, arg2, ...) end` — 第一个参数为调用者实例
- **静态方法**: `function(arg1, arg2, ...) end` — 直接为方法参数

**不要**
- 不要把 Hook 回调写成必须手动解包 `ctx` 的形式；Lua 侧一般已经收到展开后的参数。

**版本风险**
- Hook 能否命中取决于目标方法是否在运行时可被 Mod Hook 系统拦截。若 Hook 无效，优先检查类型名、方法名、实例/静态参数顺序。

## Entry.lua 入口约定

```lua
function ModConfig:Setup()
  -- self 即 ModConfig 实例，可直接调用 SetDataConfig 等方法
  -- 不需要 require，底层已自动注入 CS 全局和 self 代理
end
```

**Setup 内可用**: 所有 `self:` 方法（见上方 ModConfig Lua API）+ `ScriptExecutor` 类型 + `CS.*` 全局。

**不要**
- 不要在 `Entry.lua` 中假设需要手动 `require` TypeHint 或 Lib 文件。
- 不要把战斗脚本里的 `self` 和 `ModConfig:Setup()` 里的 `self` 混用：`Setup()` 的 `self` 是 ModConfig，CSV 脚本里的 `self` 通常是 ScriptExecutor。

## Data/Text CSV 规则

**规则**
- 第 1 行：表头，必须与主工程对应 CSV 一致
- 第 2 行：备注/注释行，用于字段说明；模板和示例都保留这一行，数据行从第 3 行开始
- **Data**: 游戏数值/效果配置
- **Text**: 文本及本地化
- `*Script` 后缀列：Lua 逻辑，`self` 为 ScriptExecutor 类型
- 本地化列后缀：README 写 `_en`, `_zh_hant`, `_jp`；实际模板/Lib CSV 表头大量使用 `_en`, `_zh-Hant`, `_ja`，编写时以目标 CSV 表头为准
- 同目录同文件名的 Data/Text 表按 `Id` 合并，例如 `Data/Card/cardsample.csv` 对应 `Text/Card/cardsample.csv`
- CSV 的 `Id` 列写局部 ID，仅用于当前 CSV 内定义行、以及同名 Data/Text 表之间配对
- 游戏运行时和脚本查询使用完整条目 ID，格式为 `ModName_FileName_Id`，其中 `FileName` 是 CSV 文件名去掉 `.csv`
- 局部 ID 前缀 `*` 只表示不进入随机池；生成完整条目 ID 或脚本引用时不带 `*`
- 不可覆盖原版 ID，只能新增

**示例**
- ModName: `Defect`
- 文件: `Data/Card/cardsample.csv`
- CSV 局部 ID: `*defect_discharge`
- 运行时完整 ID: `Defect_cardsample_defect_discharge`

`Data/Card/cardsample.csv` 和 `Text/Card/cardsample.csv` 都写局部 ID `*defect_discharge` 来配对同一张卡。脚本、`Skill1`、`SkillTime`、`AddCardById` 使用完整 ID `Defect_cardsample_defect_discharge`，不写 `*`。

Buff 同理：
- 文件: `Data/Buff/buffsample.csv`
- CSV 局部 ID: `electric_orb`
- 运行时完整 ID: `Defect_buffsample_electric_orb`

**不要**
- 不要在脚本查询、`AddBuff`、`GetBuff`、`AddCardById`、`SkillTime` 中写局部 ID。
- 不要把局部 ID 前缀 `*` 写进运行时完整 ID。
- 不要用 Mod 新增 CSV 覆盖原版 ID；新增内容会生成 Mod 自己的完整 ID。

**版本风险**
- CSV 表头随游戏版本变化时，复制旧表头可能导致加载失败或字段丢失。没有外部材料时，优先保持当前文档列名和字段顺序，不要随意增删列。

## Lua 脚本编写约定

### 基础规则
- 原版 CSV 脚本常使用 C# 语法，Mod 必须改写为 Lua：
  - `self:AddBuff(...)` 替代 `AddBuff(...)`
  - `self.Vars:get_Item("key")` / `self.Vars:set_Item("key", val)` 替代 `Vars["key"]`
  - `self.Self:GetBuff(id)` 替代 `Self.GetBuff(id)`
  - `ScriptExecutor.PlayerInfo.*` 替代 `PlayerInfo.*`
- 引用原版 ID：`DataId.Id`
- 引用 Mod 条目 ID：直接写生成后的完整字符串，例如 `"Defect_buffsample_focus"`
- 卡牌 BaseScript：`AttackCardItem`（需选目标）或 `CommonCardItem`（无需选目标）
- 卡牌持续性效果 → 写成 Buff

### C#↔Lua 转换速查

| C# (原版写法) | Lua (Mod) |
|---|---|
| `Vars["key"]` | `self.Vars:get_Item("key")` / `:set_Item("key", v)` |
| `Self.GetBuff(id)` | `self.Self:GetBuff(id)` |
| `PlayerInfo.*` | `ScriptExecutor.PlayerInfo.*` |
| `HandCard.Where(...)` | 手动遍历 (XLua 不支持 LINQ) |
| `Self.DamageFilter["k"]=v` | `self:SetDamageFilter("k", v)` |
| `EscapeFight()` | `self:EscapeFight()` |
| `new DataConfig(id, type)` | `CS.DataConfig(id, CS.DataType.Card)` |
| `AddEvent<HurtData>("Hurt",(d)=>{...})` | C# 原版脚本的泛型有参事件写法；Lua 侧不要直接等同为 `self:AddEvent(..., function(d) ...)` |

**不要**
- 不要直接复制原版 CSV 的 C# 代码到 Mod CSV；Mod 脚本必须写 Lua。
- 不要在 Lua 里用 `Vars["key"]` 写 C# 字典索引语法。

**版本风险**
- XLua 暴露的成员可能随游戏版本变化。若 Lua 报 nil 或方法不存在，优先检查方法名、冒号调用、参数个数和 `CS.` 命名空间。

## Hook 规则

- **方法名格式**: `Type.MethodName`（如 `SettingUI.OnEnable`）
- **Modifiable**: Rougamo AOP 切面，编译时织入方法 OnEntry/OnSuccess 触发 Hook，几乎所有方法都可被 Hook
- **Lua Hook 回调参数**: 实例方法时为 `function(instance, args...)`, 静态方法时为 `function(args...)`
- 同名 Hook 自动去重，Hook 链最大深度 64，有防重入保护

## 资源路径

**规则**
- Mod 路径：`Mods/<ModName>/...`
- 原版路径：保持游戏配置中使用的原版资源路径
- `RedirectSourcePath(originalPath, newPath)` 中，`originalPath` 写原版资源路径，`newPath` 写 Mod 资源完整路径，例如 `AnimationLib/支配魔女/Idle` → `Mods/ModTemplate/ModResource/AnimationLib/Defect/Idle`
- ModResource 下资源作为新增配置的资源字段时，也可写 `Mods/<ModName>/ModResource/...`，例如 Defect 示例职业 `Animation` 为 `Mods/Defect/ModResource/AnimationLib/Defect`
- 不是所有资源字段都需要写 `Mods/...`；沿用原版资源库的字段仍按原版路径写，例如 Defect 示例的 `VocalLib/支配魔女`、`Icon/Role/...`、`Images/...`

**不要**
- 不要把 `RedirectSourcePath` 的两个参数写反。
- 不要给所有资源字段机械加 `Mods/<ModName>/ModResource/`；只有使用 Mod 自带资源时才这样写。

## ScriptExecutor 事件列表 (README/Lib 用例)

**规则**
- `ScriptExecutor:AddEvent(eventName, fn)` 监听战斗/状态相关事件。
- 事件名通常会按当前状态实例拼接后进入 EventCenter，因此监听对象和 `self:SetStatus(...)` 的上下文会影响触发范围。
- 下表是 Mod 脚本常用事件名。全局 UI 事件另见“全局事件”小节。

| 事件名 | 含义 |
|--------|------|
| `Attack` | 攻击 |
| `AddEnemy` | 添加敌人 |
| `AttackDone` | 攻击完成 |
| `CostPower` | 消耗能量 |
| `NoPower` | 能量不足 |
| `AddPower` | 增加能量 |
| `Dead` | 死亡 |
| `ToughCountZero` | 韧性归零 |
| `OnEnemyDead` | 敌人死亡 |
| `Resurrection` | 复活 |
| `EndRound` | 回合结束 |
| `ICreateCardItem` | 创建卡牌项（每张触发一次） |
| `CreateCardItem` | 创建卡牌项开始 |
| `EndCreateCardItem` | 创建卡牌项结束 |
| `NoPowerWhenTry` | 尝试用卡时能量不足 |
| `Action` | 行动 |
| `BurnCard` | 烧牌 |
| `Init` | 初始化 |
| `OnDiceCheck` | 骰子校验 |
| `OnDiceValue` | 骰子点数 |
| `Win` | 胜利 |
| `Escape` | 逃跑 |
| `StartRound` | 回合开始 |
| `Shuffle` | 洗牌 |
| `OnCameraMove` | 相机移动 |
| `FightStart` | 战斗开始 |
| `Hurt` | 受伤 |
| `Heal` | 治疗 |
| `SelectCardEnd` | 选卡结束 |
| `OnTriggerEffect` | 触发效果 |
| `ScriptExecute` | ScriptExecutor 执行方法 |

**不要**
- 不要把 `LanguageChange`、`UIOpen`、`UIClose` 这类 UI/全局事件当成普通战斗事件使用。
- 不要假设所有 EventType 枚举都能用同一种 Lua 调用方式监听。

**版本风险**
- 事件名和事件数据结构可能随游戏版本变化。若监听无效，先检查事件名是否仍存在、是否需要拼接实例 ID、以及是否应使用全局 EventCenter 事件。

### 有参事件数据结构

**规则**
- 原版 C# 脚本里可见 `AddEvent<T>(...)` 泛型事件写法。
- Lua 侧公开签名主要是 `AddEvent(eventName, script)` / `AddEventWithVar(name, script)`。
- 当前文档不能保证 Lua Mod 一定能直接收到有参事件对象；需要有运行验证后再依赖有参字段。

| 事件 | 数据类型 | 字段 |
|------|---------|------|
| `Hurt` | HurtData | damageType, val, sourceId, fromDataId |
| `Action` | ActionData | data, dataId, dataType, rawData, Id |
| `AddBuff` | AddBuffData | data, dataId, dataType, fromId, dataFromid, toId |
| `BurnCard` | BurnData | data, dataId, dataType, rawData, Id |
| `AddEnemy` | NewEnemyData | Id |
| `Damage` | DamageData | data, dataId, dataType, rawData |
| `ScriptExecute` | ScriptExecuteData | MethodName, Executor, Arguments[] |

**不要**
- 不要把 C# 泛型写法 `AddEvent<HurtData>("Hurt", ...)` 直接复制成 Lua。
- 不要在未验证的情况下依赖 `function(fromdata)` 一定收到完整事件对象。
- 不要假设 `AddEvent_HurtData` 这类便捷函数一定存在。

## 全局事件 (EventCenter 监听)

**规则**
- 全局事件不一定绑定到当前 ScriptExecutor 的状态实例。
- UI 打开/关闭类事件可能使用动态事件名，例如 `UIOpen-<name>`。

| 事件名 | 含义 |
|--------|------|
| `UIOpen` | UI 打开（拼接格式: `UIOpen-Name`） |
| `UIHelp` | UI 帮助 |
| `UIClose` | UI 关闭 |
| `LanguageChange` | 语言切换 |
| `SelectCardEnd` | 选卡结束 |
| `BreaksUIOpen` | 休息界面打开 |
| `HouseUIOpen` | 宿舍界面打开 |
| `FirstTalk` | 首次对话 |
| `PerWin` | 每次战斗胜利 |
| `RelicAdd` | 遗物获得 |
| `StartTutorial` | 教程开始 |
| `ResolutionChanged` | 分辨率改变 |
| `HouseDialoguePendingNewStateChanged` | 宿舍对话状态变化 |
| `OutDeckUITutorial` | 牌组教程 |

**不要**
- 不要把全局事件表当作战斗事件表。
- 不要把 `UIOpen` 静态名和 `UIOpen-<name>` 动态名混用。

---

## C# DLL Hook 模板

### 项目结构
- 开发工程在 `Dev/` 目录，发布时不需要
- 编译前需在 `.csproj` 中设置 `GamePath` 为游戏根目录
- 使用 Rider 或 VS Code 编译

### C# Hook 属性
| 属性 | 位置 | 说明 |
|------|------|------|
| `[ModInitialize]` | 入口方法 | 标记 Mod 初始化入口 |
| `[HookBefore]` | Hook 方法 | 前置 Hook |
| `[HookAfter]` | Hook 方法 | 后置 Hook |

### Hook 规则
- 方法必须为 `static`
- 若要 Hook 实例方法，第一个参数默认为实例本身
- 参数可以不全，但必须保持原有顺序
- 编译后重命名为 `Entry.dll` 放入 `Scripts/`
- **不支持跨平台**

### 项目配置 (.csproj)
- TargetFramework: `net472`
- RootNamespace: `DllTemplate`
- AssemblyName: `Entry` (输出 `Entry.dll`)
- 引用 DLL:
  - `UnityEngine.CoreModule.dll`
  - `Witch.dll` (命名空间 `Witch.Mod`, 含 `ModConfig` 类, `Commands` 类, Hook 属性)
  - `Witch.Core.dll`
- GamePath 指向游戏根目录
- DllPath = `$(GamePath)\<游戏名>_Data\Managed`
- DebugType: `embedded`, LangVersion: `latest`
- ProduceReferenceAssembly: `False`
- GenerateDocumentationFile: `False`
- Debug/Release 配置中 `IsPublishable` 为 `True`
- 引用 DLL 的 `Private` 为 `false`，避免把游戏 DLL 复制进输出

### 构建流程
- 修改 `Dev/DllTemplate.csproj` 中的 `GamePath`
- 使用 Rider、VS Code 或 `dotnet build` 编译
- 编译后的 DLL 改名为 `Entry.dll`
- 将 `Entry.dll` 放入 Mod 的 `Scripts/` 目录
- `Dev/` 是开发工程目录，发布时不需要保留
- C# DLL Hook 模板注明不支持跨平台

### C# 代码示例

```csharp
using Witch.Mod;
using UnityEngine;
using Witch.UI.Window;

public static class MyMod
{
    [ModInitialize]
    public static void Entry(ModConfig modConfig)
    {
        Commands.Log("MyMod", "Mod loaded");
    }
}

class Patch
{
    [HookBefore(typeof(SettingUI), nameof(SettingUI.OnEnable))]
    public static void OnEnable(SettingUI __instance)
    {
        Commands.Log("Patch", "SettingUI.OnEnable hooked");
    }
}
```

### HookBefore/HookAfter 属性构造
```csharp
[HookBefore(typeof(目标类), nameof(目标类.方法名))]
[HookAfter(typeof(目标类), nameof(目标类.方法名))]
```
- 第一个参数: `typeof(TargetClass)`
- 第二个参数: `nameof(TargetClass.MethodName)`

**版本风险**
- C# DLL Hook 依赖游戏 DLL、Unity/Mono 运行环境和模板工程配置；游戏更新后若类型名、程序集或方法签名变化，需要重新编译并验证 Hook。

---

## ScriptExecutor 方法 (Lua 脚本内 self 可用)

**通用规则**
- CSV 脚本内的 `self` 通常是 ScriptExecutor。
- 大多数数值参数在脚本示例中以字符串传入，例如 `"1"`、`"10"`。
- 引用 Mod 新增卡牌、Buff、职业技能时使用完整条目 ID，不使用 CSV 局部 ID。
- 调用 ScriptExecutor 实例方法时使用冒号：`self:AddBuff(...)`。

**不要**
- 不要把 ModConfig:Setup 里的 `self` 和 CSV 脚本里的 `self` 混为同一种对象。
- 不要把原版 C# 脚本里的 `AddBuff(...)`、`PlayerInfo.*`、`Vars["key"]` 原样复制到 Lua Mod。

### 状态设置
| 方法 | 说明 |
|------|------|
| `self:SetStatus("Self")` | 效果对象=自身 |
| `self:SetStatus("Target")` | 效果对象=目标 |
| `self:SetStatus("All")` | 效果对象=所有 |
| `self:SetStatus("AllTarget")` | 所有敌方 |
| `self:SetStatus("AllFriends")` | 所有友方 |
| `self:SetStatus("AllFriendsExSelf")` | 除自己外的所有友方 |
| `self:SetStatus("AllRandomEnemy3")` | 随机 3 名敌人 |
| `self:SetStatus("AllRandomTarget1")` | 随机 1 名敌人 |

**SetStatus filter 格式:** `[All][AllRandom]<Type>[ExSelf][数字]`
- `All` — 全体; `AllRandom` — 随机选取; `ExSelf` — 排除自身
- `Type`: `Self` / `Target`(敌方) / `Friend(s)`(友方) / `Enemy`
- 尾部数字: 随机的目标数 (如 `AllRandomEnemy3` = 随机3敌人)
- `self.Target` 和 `self.Object` 在调用后分别指向目标和目标列表

**示例**
```lua
self:SetStatus("Self")
self:AddBuff("Defect_buffsample_focus", "1")

self:SetStatus("AllRandomEnemy1")
self:Damage("7", "Normal")
```

**不要**
- 不要在没有先设定目标的情况下假设 `Damage`、`AddBuff` 一定作用到正确对象。
- 不要把 `AllRandomEnemy3` 的数字写在中间；数量写在末尾。

### Buff 操作
| 方法 | 说明 |
|------|------|
| `self:AddBuff(buffId, "层数")` | 添加 Buff，层数为字符串 |
| `self:RemoveBuff(buffId)` | 移除 Buff |
| `self:RunImmediately(buffId, "事件名")` | 立即触发 Buff 的指定事件 |
| `self:RemoveBadBuff(val, good)` | 移除负面 Buff (val=数量, good=是否保留好Buff) |
| `self:RemoveAllBadBuff(obj)` | 移除 obj 上的所有负面 Buff |
| `self:RemoveAllBuff()` | 移除全部 Buff |
| `self:RepeatByBuffLevel(buffId, action)` | 按 Buff 层数重复执行 action |
| `self:RandomAddBuff(count)` | 随机添加 Buff |
| `self:RandomAddBuffAndAbility(count)` | 随机添加 Buff 与异能 |
| `self:RandomAddGoodBuff(count, type)` | 随机添加好 Buff |

**规则**
- `buffId` 使用运行时完整 ID 或原版 ID。
- Mod Buff 示例：`Defect_buffsample_focus`。
- 原版 Buff 示例：`buff_vulnerability`。

**不要**
- 不要在 `AddBuff` / `GetBuff` 中使用 CSV 局部 ID，例如 `focus` 或 `electric_orb`。

### 卡牌操作
| 方法 | 说明 |
|------|------|
| `self:AddCardByCardList("数量", "标签")` | 从当前手牌/待抽牌检索 |
| `self:AddCardByUsedCardList("数量", "标签")` | 从已用牌检索 |
| `self:AddCard(id)` | 添加卡牌 (带延迟获取) |
| `self:AddCardById(id)` | 直接通过 ID 添加 |
| `self:AddCardToDeckById(Id, toUsed)` | 添加到牌堆 (toUsed=true 则入已用牌) |
| `self:AddCardByData(Id, AddTag)` | 按 Data 添加并加标签 |
| `self:AddCardToFightManager(dataConfig, toUsed)` | 直接给 FightManager 加卡 |
| `self:AddFakeCard(toUsed)` | 添加假卡 (仅数据) |
| `self:GetCardFromDeck(idata)` | 从牌堆取出 |
| `self:UseCard(idata)` | 使用指定卡 |
| `self:ThrowCard(val, type)` | 弃牌 (val=数量, type=标签筛选) |
| `self:BurnCard(val, type)` | 烧牌 |
| `self:BurnCardByData(fromdata)` | 按 DataConfig 烧牌 |
| `self:CopyCard(count, source, AddTag)` | 异步复制卡牌 |
| `self:CopyCardWare(count, source, AddTag)` | 同步复制卡牌 |
| `self:CreateCard(config)` | 创建新卡牌 |
| `self:ChooseCardToAction(count, onCardSelected, type)` | 选卡后执行回调 |
| `self:OutFightSelectCardToAction(count, source, cardevent)` | 战斗外选卡 |
| `self:PackToDeckAction(count, source, action, DelayTime)` | 打包卡到牌堆后执行 |
| `self:GetDeckUIToAction(count, source, action, DelayTime)` | 从牌堆UI选择后执行 |
| `self:AddCardByDeck(count, source, tag)` | 从指定牌源添加 |
| `self:GetCardByTag(count, tag)` | 按标签检索卡牌 |
| `self:GetcardsByRarity(Minrarity, Maxrairty)` | 按稀有度获取卡牌列表 |
| `self:GetcardsOutLock()` | 获取未锁定卡牌列表 |
| `self:EnchGetCard()` | 附魔获取卡牌 |
| `self:CardGetEnch(card)` | 卡牌附魔 |

`CopyCard` 是异步选牌复制流程；`CopyCardWare` 是同步入口，内部触发同一复制逻辑但不等待异步结果。

**规则**
- `AddCardById` 和运行时卡牌引用使用完整条目 ID。
- 从已有卡牌数据中取出的 `data:get_Item("Id")` 通常已经是运行时 ID，可直接传给 `AddCard`。

**不要**
- 不要在 `AddCardById` 中写 `*defect_discharge` 或 `defect_discharge`；应写 `Defect_cardsample_defect_discharge`。

### 生命/属性
| 方法 | 说明 |
|------|------|
| `self:SetHp(val)` | 设置生命值 |
| `self:SetMaxHp(val)` | 设置最大生命 |
| `self:ChangeHp(val)` | 修改生命 |
| `self:PureChangeHp(val)` | 纯修改生命 (绕过某些检测) |
| `self:ChangeMaxHp(val)` | 修改最大生命 |
| `self:ChangeDefence("防御值")` | 修改防御 |
| `self:ChangeSkill(val)` | 修改技能值 |
| `self:Resurrection(value)` | 复活 |

### 能量/抽牌
| 方法 | 说明 |
|------|------|
| `self:SetPower(val)` | 设置能量 |
| `self:ChangePower(val)` | 修改能量 |
| `self:ChangeMaxPower(val)` | 修改最大能量 |
| `self:DrawCount(val)` | 抽 N 张牌 |
| `self:ChangeRound()` | 手动改变回合 |
| `self:ShuffleDeck()` | 洗牌库 |
| `self:ShuffleHand()` | 洗手牌 |
| `self:ChangeCardTop(val)` | 改变牌库顶 |

### 事件
| 方法 | 说明 |
|------|------|
| `self:AddEvent("事件名", function() ... end)` | 添加无参事件监听 |
| `self:AddTempEvent("事件名", function)` | 添加一次性事件 (触发后自动移除) |
| `self:AddEventWithVar(name, script)` | 带变量的事件监听 |
| `self:AddBaseEvent(eventName, action)` | 添加基础事件 |
| `self:TrySendOnlineEvent(eventName, parameters)` | 尝试发送联机事件 |

`AddEvent` 注册的监听通常持续到战斗结束；`AddTempEvent` 是一次性监听，触发后移除。两者都会按当前 `status.InstanceId` 拼接事件名注册到 EventCenter。

触发全局/剧情事件使用 `ScriptExecutor.PlayerInfo.EventTrigger(name)`，不是 `ScriptExecutor` 实例方法。

**不要**
- 不要写 `self:EventTrigger("...")`；ScriptExecutor 实例没有这个触发方法。

### 伤害/战斗
| 方法 | 说明 |
|------|------|
| `self:Damage(val, damagetype)` | 造成伤害 |
| `self:OnlineDamage(val, fromDataId, fromId, damagetype)` | 联机伤害 |
| `self:SetDamageFilter(key, value)` | 设置伤害过滤/修正 |
| `self:AddDamageFilter(key, delta)` | 增加伤害过滤修正 |
| `self:RemoveDamageFilter(key)` | 移除伤害过滤 |
| `self:ClearDamageFilter()` | 清除所有伤害过滤 |
| `self:DiceCheck(percent, action)` | 骰子校验 (percent=概率) |
| `self:ComboCheck()` | 检查连击 |
| `self:ComboSc()` | 连击脚本 |

`Damage` 的 `damagetype` 常见值为 `"Normal"` 和 `"True"`；`OnlineDamage` 还需要来源数据 ID (`fromDataId`) 与来源实例 ID (`fromId`)。

**不要**
- 不要省略目标选择。造成伤害前通常先 `self:SetStatus("Target")` 或设置其他目标过滤。

### 敌人/状态
| 方法 | 说明 |
|------|------|
| `self:AddEnemy(id)` | 添加敌人 |
| `self:AddEnemyAction(outData)` | 添加敌人行动 |
| `self:DesEnemyAction()` | 减少敌人行动 |
| `self:GetEnemy(status)` | 获取 Enemy 对象 |
| `self:SetStatusById(searchId)` | 按 ID 搜索状态 |
| `self:ProcessEffect(status, effectName)` | 处理效果 |
| `self:ForAllStatus(action)` | 对所有状态执行操作 |

### 变量/动态值
| 方法 | 说明 |
|------|------|
| `self:ChangeDynamicVar(varName, value)` | 修改动态变量 |
| `self:ChangeDynamicVarPercent(varName, value)` | 按百分比修改动态变量 |
| `self:ChangeVars(type, val)` | 修改 vars |
| `self:AddDescription(index, type, value)` | 添加描述替换值 ({0},{1} 等) |
| `self:GetDesValue(index)` | 获取描述替换值 |

### 职业/货币
| 方法 | 说明 |
|------|------|
| `self:ChangeMoney(val, changeMax)` | 修改金钱 (changeMax=是否同时修改上限) |
| `self:ChangeCareer(Id)` | 切换职业 |
| `self:ChangeSummon(Isshow)` | 召唤物显示/隐藏 |

### 动作/战斗流程
| 方法 | 说明 |
|------|------|
| `self:DoAction(index)` | 执行第 index 次行动 |
| `self:AddAction(count)` | 增加行动次数 |
| `self:EndTheGame()` | 结束游戏 |
| `self:EscapeFight()` | 逃跑 |
| `self:LossFight()` | 失败 |
| `self:returnFightType()` | 返回战斗类型 |
| `self:atk()` | 返回攻击力字符串 |
| `self:def()` | 返回防御力字符串 |
| `self:CallEffect()` | 调用效果 |

### 遗物/祝福/仪式
| 方法 | 说明 |
|------|------|
| `self:FightRelicCheck(action)` | 战斗中遗物检查 |
| `self:ReplaceSelfRelicWithRandomRelic(count)` | 随机替换遗物 |
| `self:UpdateRelicShow()` | 更新遗物显示 |
| `self:RandomAddBless(count)` | 随机添加祝福 (从 ScriptExecutor) |

### 仪式/法术
| 方法 | 说明 |
|------|------|
| `self:RepeatRitualEcho(ritualBuffId, eventName)` | 重复仪式回响 |
| `self:Resentment(count)` | 怨恨机制 |
| `self:UpdateAllDharmasSpellList()` | 更新所有法术列表 |
| `self:ClearAllDharmasSpellList()` | 清除所有法术列表 |
| `self:UpdateSkillTime()` | 更新技能冷却 |

### 脚本/工具
| 方法 | 说明 |
|------|------|
| `self:RunScript("ScriptName")` | 运行脚本 |
| `self:CallScript(scriptId, scriptName)` | 按 ID 调用脚本 |
| `self:PreCompileScripts(ScriptName, options)` | 预编译脚本 |
| `self:Clear()` | 清除 |
| `self:Log(content)` | 日志输出 |
| `self:TagCheck(theData, tag)` | 标签检查 |
| `self:CheckFrom(thisId)` | 检查来源 ID |
| `self:WatchRoleTable(propertyName, action)` | 监听角色属性变化 (API 与 PropertyWatcher 相同) |
| `self:Undone(args)` | 撤销操作 |

**版本风险**
- ScriptExecutor 方法签名可能随游戏版本变化。若运行时报错，优先检查方法是否仍存在、参数数量、参数类型和冒号调用。

### DataId 引用

**规则**
- `DataId` 只适合引用游戏原版或已生成的静态 ID 常量，例如 `DataId.buff_bleeding`、`DataId.blessing_1`。
- Mod 新增条目通常没有 `DataId.<name>` 常量，脚本里直接写运行时完整 ID 字符串，例如 `"Defect_buffsample_focus"`、`"Defect_cardsample_defect_discharge"`。
- CSV 里的局部 ID、运行时完整 ID、ModId 是三种不同概念：
  - CSV 局部 ID：写在 CSV `Id` 列，例如 `*defect_discharge`。
  - 运行时完整 ID：用于脚本/技能/引用，例如 `Defect_cardsample_defect_discharge`。
  - ModId：用于依赖和 Mod 身份，例如 `Defect.SomeAuthor`。

**不要**
- 不要写 `DataId.Defect_cardsample_defect_discharge` 来引用 Mod 卡牌。
- 不要把 `ModName.ModAuthor` 写到卡牌、Buff、职业技能等 Data 引用字段。
- 不要把带 `*` 的 CSV 局部 ID 当作运行时完整 ID。

注意：这里的 Mod 条目 ID 不是 `ModId`。`ModId` 是 `ModName.ModAuthor`，用于依赖；条目 ID 是 `ModName_FileName_Id`，用于卡牌、Buff、职业技能等数据引用。

### 类型说明
- 所有参数类型在 TypeHint 中标记为 `string`（CSV 数值以字符串形式传入）
- `System.Action | function` 表示可接受 Lua 函数作为回调

## ScriptExecutor.PlayerInfo (静态访问)

### 属性
| 属性 | 类型 | 说明 |
|------|------|------|
| `Hp` | number | 当前生命 |
| `MaxHp` | number | 最大生命 |
| `Money` | ObfuscatedInt | 金钱 |
| `Power` | number | 当前能量 |
| `MaxPower` | number | 最大能量 |
| `Level` | number | 等级 |
| `MoneyMultiplier` | number | 金钱倍率 |
| `RelicCount` | number | 遗物数 |
| `BlessingCount` | number | 祝福数 |
| `CardTopCount` | number | 牌库顶数 |
| `CardTotalCount` | number | 总卡牌数 |
| `CardList` | List | 卡牌 ID 列表 |
| `UnCardList` | List | 未解锁卡牌列表 |
| `BlessingList` | List | 祝福 ID 列表 |
| `RelicList` | List | 遗物 ID 列表 |
| `Strength` | number | 力量 |
| `Lucky` | number | 幸运 |
| `Wisdom` | number | 智慧 |
| `Perceive` | number | 感知 |
| `TempStrength` | number | 临时力量 |
| `TempLucky` | number | 临时幸运 |
| `TempWisdom` | number | 临时智慧 |
| `TempPerceive` | number | 临时感知 |
| `DefaultRoll` | number | 默认骰子值 |
| `PlayerName` | string | 玩家名 |
| `PlayerCount` | number | 玩家数 (多人) |
| `LastCard` | IDataConfig | 最后使用的卡牌 |
| `TrueCount` | number | 真实计数 |
| `enemylevel` | number | 敌人等级 |
| `enemyCount` | number | 敌人数量 |
| `Reward` | number | 奖励值 |
| `Win` | FightType | 胜利战斗类型 |
| `Loss` | FightType | 失败战斗类型 |
| `Enemy` | FightType | 敌人战斗类型 |
| `Pattern` | FightType | 模式战斗类型 |
| `Player` | FightType | 玩家战斗类型 |
| `Escape` | FightType | 逃跑战斗类型 |
| `SkillTime` | Dictionary | 技能冷却时间 |
| `ChooseVars` | List | 选择变量 |
| `MainVarUpperBound` | number | 主变量上限 |
| `SecondaryVarUpperBound` | number | 次要变量上限 |
| `OtherVarUpperBound` | number | 其他变量上限 |
| `SpecialVars` | Dictionary | 特殊变量 |

### 方法
| 方法 | 说明 |
|------|------|
| `PlayerInfo.AddBless(id)` | 添加祝福 |
| `PlayerInfo.RemoveBless(id)` | 移除祝福 |
| `PlayerInfo.CopyBless(instanceId)` | 复制祝福 |
| `PlayerInfo.AddRelic(id)` | 添加遗物 |
| `PlayerInfo.RemoveRelic(id)` | 移除遗物 |
| `PlayerInfo.CopyRelic(instanceId)` | 复制遗物 |
| `PlayerInfo.AddCard(id)` | 添加卡牌 |
| `PlayerInfo.RemoveCard(id)` | 移除卡牌 |
| `PlayerInfo.CopyCard(instanceId)` | 复制卡牌 |
| `PlayerInfo.AddCardByData(data)` | 通过 DataConfig 添加卡牌 |
| `PlayerInfo.DelayAddCard(id, delayFrames)` | 延迟添加卡牌 (按帧) |
| `PlayerInfo.DelayAddRelic(id, delayFrames)` | 延迟添加遗物 |
| `PlayerInfo.DelayAddBless(id, delayFrames)` | 延迟添加祝福 |
| `PlayerInfo.RandomAddCard(count)` | 随机添加卡牌 |
| `PlayerInfo.RandomAddCardByDeck(count)` | 从牌组随机添加 |
| `PlayerInfo.RandomRemoveCard(count)` | 随机移除卡牌 |
| `PlayerInfo.RandomcardByRarity(rarity)` | 按稀有度随机卡牌 |
| `PlayerInfo.RandomAddBless(count)` | 随机添加祝福 |
| `PlayerInfo.Goodbless(count)` | 添加好祝福 |
| `PlayerInfo.RandomRemoveBless(count)` | 随机移除祝福 |
| `PlayerInfo.RandomAddRelic(count)` | 随机添加遗物 |
| `PlayerInfo.RandomRemoveRelic(count)` | 随机移除遗物 |
| `PlayerInfo.RandomrelicByRarity(rarity)` | 按稀有度随机遗物 |
| `PlayerInfo.WinTheFight()` | 直接胜利 |
| `PlayerInfo.GiveWin()` | 给予胜利 |
| `PlayerInfo.ChangeEventSubtip(text)` | 修改事件副标题 |
| `PlayerInfo.ChangeType(type)` | 修改战斗类型 |
| `PlayerInfo.ChangeSelected(value)` | 修改选择 |
| `PlayerInfo.ChangeAllVars(value)` | 修改所有变量 |
| `PlayerInfo.SetGameVar(key, value)` | 设置游戏全局变量 |
| `PlayerInfo.GetGameVar(key)` | 获取游戏全局变量 |
| `PlayerInfo.ShowDialogue(id)` | 显示对话 |
| `PlayerInfo.EndDialogue()` | 结束对话 |
| `PlayerInfo.HideDialogue(flag)` | 隐藏/显示对话 |
| `PlayerInfo.ShowOptions(tuples)` | 显示选项 |
| `PlayerInfo.ShowReward()` | 显示奖励 |
| `PlayerInfo.ShowCaption(text)` | 显示字幕 |
| `PlayerInfo.ShowItemShowUI(iconPath, title, description, tips)` | 显示物品展示 UI |
| `PlayerInfo.EventTrigger(name)` | 触发事件 |
| `PlayerInfo.AddEvent(name, action, obj)` | 添加事件监听 |
| `PlayerInfo.ContinueEvent(id)` | 继续事件 |
| `PlayerInfo.EndEvent()` | 结束事件 |
| `PlayerInfo.LockChoice(index)` | 锁定选项 |
| `PlayerInfo.EventTryChangeMap()` | 尝试切换地图 |
| `PlayerInfo.AnnounceEventDone()` | 宣布事件完成 |
| `PlayerInfo.RandomSelect(lists)` | 随机选择 (返回字符串) |
| `PlayerInfo.StartLevel(type, id2)` | 开始关卡 |
| `PlayerInfo.GameOver()` | 游戏结束 |
| `PlayerInfo.QuitAndDeleteSave()` | 退出并删除存档 |
| `PlayerInfo.Getsave()` | 获取 GameRuntimeData |
| `PlayerInfo.AddItem(itemId, type)` | 添加物品 |
| `PlayerInfo.GetCareer()` | 获取当前职业数据 |
| `PlayerInfo.UpdateAch(id, progress)` | 更新成就进度 |
| `PlayerInfo.UnlockItem(id)` | 解锁物品 |
| `PlayerInfo.GetTagDiff()` | 获取标签差异 |

**规则**
- Lua Mod 中通常通过 `ScriptExecutor.PlayerInfo` 访问这些静态成员；从原版 C# 脚本迁移时，把 `PlayerInfo.*` 改成 `ScriptExecutor.PlayerInfo.*`。
- `AddCard`、`AddBless`、`AddRelic` 等方法的 ID 参数遵循对应 Data 类型的运行时 ID 规则：原版可用原版 ID，Mod 新增内容用完整条目 ID。
- `EventTrigger(name)` 是触发全局/剧情事件的入口；不要写成 ScriptExecutor 实例方法。

**版本风险**
- PlayerInfo 是高频运行时入口，字段和方法数量多。AI 生成脚本时应优先使用本节列出的稳定常用项，涉及存档、联机、教程、成就等系统时需要额外运行验证。

### GameVar 枚举 (SetGameVar/GetGameVar key)

| 变量名 | 说明 |
|------|------|
| `ExDeleteCard` | 额外删除卡牌 |
| `ExLockDes` | 额外锁定描述 |
| `ExDeleteDes` | 额外删除描述 |
| `ExTough` | 额外韧性 |
| `RefreshCount` | 刷新次数 (商店) |
| `PriceMul` | 价格倍率 |
| `EXEnemyHp` | 额外敌人血量% |
| `EXEnemyAtk` | 额外敌人攻击% |
| `Difficulty` | 难度值 |
| `EndBoss` | 最终 Boss (map id) |
| `LateThrow` | 延迟弃牌 |
| `UselessWis` | 无用智慧 |
| `ExpensiveCard` | 昂贵卡牌 |
| `HasSix` | 是否有第六关 |
| `TombUse` | 墓碑使用 |
| `ExCardBottom` | 额外牌底 |
| `Branch` | 分支选择 |
| `HighExHp` | 高层额外血量 |
| `ExBless` | 额外祝福 |
| `Slot*` (~20个) | 老虎机/混沌乐园模式相关 |

使用: `ScriptExecutor.PlayerInfo.SetGameVar("Difficulty", "3")` / `ScriptExecutor.PlayerInfo.GetGameVar("Difficulty")`

**规则**
- GameVar key 是字符串；Lua 中直接传字符串即可。
- 这类变量用于跨事件或模式流程的运行时状态，不适合当作单张卡牌或单个 Buff 的临时变量。

**不要**
- 不要把 `self.Vars`、`RoleTable.VarsMap` 和 `PlayerInfo.SetGameVar` 混用：前者偏脚本/对象局部状态，GameVar 偏全局流程状态。

## StatusManager (状态管理器)

每个战斗实体 (玩家/敌人) 的 HP/防御/Buff 状态。ScriptExecutor 中的 `self.Self` 和 `self.Target` 都是 IStatusManager 类型 (实际为 StatusManager)。

### 属性
| 属性 | 类型 | 说明 |
|------|------|------|
| `maxHp` / `MaxHp` | number | 最大生命 |
| `curHp` / `CurHp` | number | 当前生命 |
| `defend` / `Defend` | number | 当前防御 |
| `isResurrecting` | boolean | 是否复活中 |
| `DamageFilter` | Dictionary | 伤害过滤/修正表 |
| `effectList` | List | 效果列表 |
| `dynamicVariables` | Dictionary | 动态变量 |
| `HasFirstDeadReviveMark` | boolean | 有首次死亡复活标记 |

### 方法
| 方法 | 说明 |
|------|------|
| `status:Hit(val, damageType, fromDataId, fromInstanceId)` | 受到伤害 |
| `status:Heal(val, damageType)` | 治疗 |
| `status:AddBuff(buffConfig)` | 添加 Buff (IBuffItemConfig 或 buffId+level) |
| `status:RemoveBuff(buffId)` | 移除指定 Buff |
| `status:GetBuff(buffId)` | 获取 Buff |
| `status:GetBuffs()` | 获取所有 Buff |
| `status:CheckAllBuff(way)` | 检查所有 Buff |
| `status:UpdateBuff()` | 更新 Buff |
| `status:ClearAllBuff()` | 清除所有 Buff |
| `status:ClearBuffById(fromId)` | 按来源 ID 清除 Buff |
| `status:SetDynamicVariable(key, value, enqueue)` | 设置动态变量 |
| `status:AddDynamicVariable(key, delta, enqueue)` | 增加动态变量 |
| `status:SetDamageFilter(key, value, enqueue)` | 设置伤害过滤 |
| `status:AddDamageFilter(key, delta, enqueue)` | 增加伤害过滤 |
| `status:RemoveDamageFilter(key, enqueue)` | 移除伤害过滤 |
| `status:ClearDamageFilter(enqueue)` | 清除伤害过滤 |
| `status:EnemyDead(Delay)` | 敌人生效死亡 |
| `status:CheckDead()` | 检查死亡 |
| `status:Resurrection(value)` | 复活 |
| `status:TryMarkFirstDeadRevive()` | 标记首次死亡复活 |
| `status:TryConsumeFirstDeadReviveMark()` | 消耗首次死亡复活标记 |
| `status:ResetFirstDeadReviveMark()` | 重置首次死亡复活标记 |
| `status:DamageCalculate(BaseDamage)` | 伤害计算 |
| `status:DefenceCalculate(BaseDefence)` | 防御计算 |
| `status:UnDamageCalucate(BaseDamage)` | 反伤害计算 |
| `status:Init(father)` | 初始化 (绑定 FightObject) |
| `status:AddSummon(path, name)` | 添加召唤物 |
| `status:FindSummon(name)` | 查找召唤物 |
| `status:RemoveSummon(name)` | 移除召唤物 |
| `status:ShowSummon(Isshow)` | 显示/隐藏召唤物 |
| `status:UpdateAllDharmasSpellList(spellChain)` | 更新法术列表 |
| `status:ClearAllDharmasSpellList()` | 清除法术列表 |
| `status:PlayVocal(state)` | 播放语音 |
| `status:UpdateStatus(NeedEffect)` | 更新状态 |
| `status:ResetDamageStatus()` | 重置伤害状态 |

**规则**
- `self.Self`、`self.Target`、`self.Object` 中的战斗实体通常是状态管理对象或状态对象集合；先用 `self:SetStatus(...)` 选定对象，再访问目标。
- 直接调用 `status:*` 属于底层操作；普通卡牌/Buff 脚本优先使用 `self:AddBuff`、`self:Damage`、`self:ChangeHp` 等 ScriptExecutor 封装。

**版本风险**
- 底层状态方法参数更贴近 C# 实现，签名变化风险高于 ScriptExecutor 封装。

## GameConfigManager 扩展方法

| 方法 | 说明 |
|------|------|
| `GameConfigManager.Instance:GetTable(type)` | 获取指定 DataType 的 GameConfigData (数据表) |
| `GameConfigManager.Instance:GetOneById(id)` | 通过 ID 获取单条数据 |
| `GameConfigManager.Instance:GetTypeById(id)` | 通过 ID 获知其 DataType |
| `GameConfigManager.Instance:GetItemsByPack(type, packId)` | 按卡包获取物品列表 |
| `GameConfigManager.Instance:GetPackItems(packId)` | 获取卡包内所有物品 |
| `GameConfigManager.Instance:CardPackCheck(cards)` | 卡包检查 |
| `GameConfigManager.Instance:GetPackBelong(item)` | 获取物品所属卡包 |
| `GameConfigManager.Instance:GetDataByPrefix(list, prefix)` | 按前缀过滤数据 |
| `GameConfigManager.Instance:GetByNote(TheList)` | 按备注获取 |
| `GameConfigManager.Instance:BuySave()` | 购买保存 |
| `GameConfigManager.Instance:BuySaveByName(item)` | 按名称购买保存 |
| `GameConfigManager.Instance:AddNativeIds()` | 添加原生 ID |
| `GameConfigManager.Instance:LoadResource(path)` | 加载资源 |

**规则**
- 查询表时使用 `CS.DataType.<Type>`，例如 `GameConfigManager.Instance:GetTable(CS.DataType.Card)`。
- 按 ID 查询时传运行时完整 ID；Mod 新增条目不要传 CSV 局部 ID。
- `LoadResource(path)` 的路径规则与“资源路径”小节一致：原版资源写原版路径，Mod 自带资源写 `Mods/<ModName>/...`。

**不要**
- 不要用 `GetOneById("*local_id")` 查询 Mod CSV 局部 ID。

### DataType 枚举

常用方式：`GameConfigManager.Instance:GetTable(CS.DataType.Card)` 获取指定数据表。

完整枚举值：
`Card`, `Enemy`, `EnemyCard`, `KeyWords`, `EnchTag`, `Level`, `Partner`, `PartnerCard`, `Map`, `Item`, `Buff`, `Career`, `Relic`, `Bless`, `Food`, `Coin`, `IllustraedBook`, `DesList`, `BuyItems`, `Hard`, `Event`, `Tutorial`, `Announcement`, `Dialogue`, `Effect`, `RoleData`, `Task`, `Affection`, `SlotCal`, `SlotReward`, `CardPack`, `Achievement`, `Narration`, `HouseDialogue`, `HouseDialogueConfig`.

**版本风险**
- 枚举值可能随游戏版本增加或改名；无法确认时优先查询当前运行环境中的 `CS.DataType`。

## GameRuntimeData (游戏运行数据 / 存档)

| 属性 | 类型 | 说明 |
|------|------|------|
| `roleTable` | RoleTable | 角色数据 |
| `settingTable` | SettingTable | 设置 |
| `AchievementTable` | AchievementTable | 成就表 |
| `Money` | number | 金钱 |
| `CardData` | List | 卡牌数据 |
| `RelicData` | List | 遗物数据 |
| `HardTags` | List | 难度标签 |
| `UnLockDataConfigs` | HashSet | 已解锁的 DataConfig |
| `Items` | ObservableCollection | 物品集合 |
| `BuyedItems` | Dictionary | 已购买物品 |
| `MeetEvents` | Dictionary | 遭遇事件记录 |
| `IsTutorialCompleted` | Dictionary | 教程完成状态 |
| `TutorialData` | Dictionary | 教程数据 |
| `UseCardPack` | HashSet | 使用的卡包 |
| `Gain` | Dictionary | 收益 |
| `playCount` | number | 游玩次数 |
| `MaxExp` | number | 最大经验 |
| `Level` | ObfuscatedInt | 等级 |
| `Exp` | ObfuscatedInt | 经验 |
| `Truth` | ObfuscatedInt | 真理值 |

### 方法
| 方法 | 说明 |
|------|------|
| `GameRuntimeData.Instance:Save()` | 保存游戏 |
| `GameRuntimeData.Instance:Load()` | 加载游戏 |
| `GameRuntimeData.Instance:AddItem(id, type)` | 添加物品 |
| `GameRuntimeData.Instance:IsLocked(Id)` | 检查是否锁定 |
| `GameRuntimeData.Md5(str)` | MD5 加密 |

**规则**
- 存档和运行数据属于全局状态，普通战斗效果不应优先直接改 `GameRuntimeData`。
- 需要给玩家添加卡牌/遗物/祝福时，优先使用 `ScriptExecutor.PlayerInfo` 或 ScriptExecutor 的封装方法。

## VisualScriptExecutor (可视化脚本执行器)

用于 UI/场景事件脚本 (对话、移动等)，不同于战斗中的 ScriptExecutor。

| 方法 | 说明 |
|------|------|
| `vse:RunScript("ScriptName")` | 运行脚本 |
| `vse:SetStatus(filter)` | 设置状态过滤 |
| `vse:AddEvent(eventName, action)` | 添加事件监听 |
| `vse:Clear()` | 清除 |
| `vse:ShowDialogue(id)` | 显示对话 |
| `vse:EndDialogue()` | 结束对话 |
| `vse:HideDialogue(flag)` | 隐藏对话 |
| `vse:DoMoveX(index, x, time, delay)` | X 轴移动 |
| `vse:DoMoveY(index, y, time, delay)` | Y 轴移动 |
| `vse:DoScale(index, scale, time, delay)` | 缩放 |
| `vse:DoFadeIn(index, time)` | 淡入 |
| `vse:DoFadeOut(index, time)` | 淡出 |
| `vse:TrySendOnlineEvent(eventName, parameters)` | 尝试发送联机事件 |

TypeHint 暴露了 `AddEvent` / `TrySendOnlineEvent` 签名；反编译实现显示 `AddEvent` 为空方法，`TrySendOnlineEvent` 抛出 `NotImplementedException`，实际可用性需单独验证。

**不要**
- 不要把 VisualScriptExecutor 当成战斗脚本的 ScriptExecutor 使用。
- 不要在未验证前依赖 `vse:AddEvent` 或 `vse:TrySendOnlineEvent` 完成真实逻辑。

## Dice (骰子系统)

| 属性/方法 | 说明 |
|------|------|
| `Dice.Default` | 默认骰子实例 |
| `Dice.Value` | 值骰子 |
| `Dice.Check` | 校验骰子 |
| `dice:WithType(type)` | 设置类型 (string) |
| `dice:WithRange(min, max)` | 设置范围 |
| `dice:Roll()` | 投掷 → Dice.State{Value, Bonus} |
| `Dice.State.Value` | 骰子点数 |
| `Dice.State.Bonus` | 加值 |

ScriptExecutor 中通过 `self.ValueDice` / `self.CheckDice` / `self.DefaultDice` 访问。

**规则**
- 骰子对象返回的是带 `Value` / `Bonus` 的状态对象；需要点数时取 `dice:Roll().Value`。
- 在普通战斗脚本里优先使用 ScriptExecutor 已暴露的骰子字段，不要自行构造复杂骰子流程。

## PropertyWatcher (属性监听器)

用于监听 RoleTable 等 INotifyPropertyChanged 的类:
```lua
PropertyWatcher.Instance:AddListener(roleTable, "Money", function() ... end)
PropertyWatcher.Instance:RemoveListener(roleTable, handler)
```

ScriptExecutor 中的 `self:WatchRoleTable(propertyName, action)` 是它的简化封装。

**规则**
- 监听 RoleTable 时优先用 `self:WatchRoleTable("Money", function() ... end)`。
- 回调会在属性变更时触发；不要在回调中无限写回同一属性，避免循环触发。

## RandomPool (随机池)

用于从数据列表中按不同规则抽取:

| 方法 | 说明 |
|------|------|
| `RandomPool.New(datas, fromDice)` | 创建随机池 (datas=List, fromDice=Dice) |
| `pool:DrawByProperty(property, count, weightDic)` | 按属性权重抽 |
| `pool:DrawByType(count, weightDic)` | 按类型权重抽 |
| `pool:DrawByNote(count, weightDic)` | 按备注权重抽 |
| `pool:DrawByCount(count)` | 等权重抽 |
| `pool:DrawByRarity(count)` | 按稀有度抽 |
| `pool:DrawByTag(count, weightDic)` | 按标签权重抽 |

**规则**
- `datas` 通常来自配置表查询结果，`fromDice` 是骰子对象。
- 权重字典的 key 必须能匹配被抽取数据的属性、类型、备注或标签。

## RoleTable 扩展属性

| 属性 | 说明 |
|------|------|
| `enchasedDict` | 附魔字典 |
| `GetCardReward` / `GetCard` | 获取卡牌奖励 |
| `WithoutArmedRelicList` | 未装备遗物列表 |
| `relicGets` | 遗物获取记录 |
| `relicOwnSc` | 遗物持有脚本 |
| `SkillTime` | 技能冷却时间 |
| `BuyBlessCount` | 购买祝福计数 |
| `MaxAlCardCount` | 最大卡牌数 |
| `SpecialVarMap` | 特殊变量映射 |
| `ExtraordinaryBlessings` | 非凡祝福列表 |
| `ChooseVars` | 选择变量 |
| `VarsMap` | 变量映射 |
| `SafeBoxRelicCount` | 保险箱遗物数 |
| `SafeBoxCardCount` | 保险箱卡牌数 |
| `SafeBoxGetMoneyCount` | 保险箱取钱数 |
| `SafeBoxSaveMoneyCount` | 保险箱存钱数 |
| `GetRelic` | 已获遗物 |
| `GetCardInBack` | 已在牌背的卡 |
| `IsStarted` | 是否已开始 |
| `InHighTide` | 是否在高潮 |
| `SpecialCount` | 特殊计数 |
| `sumFeat` | 总功绩 |
| `MainVarUpperBound` | 主变量上限 |
| `SecondaryVarUpperBound` | 次要变量上限 |
| `OtherVarUpperBound` | 其他变量上限 |
| `San` / `MaxSan` | 理智/最大理智 |
| `MoneyCal` | 金钱计算值 |
| `Reward` | 奖励 |

### 方法
| 方法 | 说明 |
|------|------|
| `roleTable:ReturnMoneyCal(baseMoney)` | 计算返回金钱 |
| `roleTable:Listen()` | 开始监听属性变化 |
| `roleTable:ResetFight(role)` | 重置战斗数据 |
| `roleTable:TryAddBless(blessid)` | 尝试添加祝福 |
| `roleTable:VarsCheck(key)` | 变量检查 |
| `roleTable:UseVarsChanges(key, value)` | 使用变量变化 |
| `roleTable:LevelCount()` | 等级计数 |
| `roleTable:Init()` | 初始化 |
| `roleTable:ResetBackCard()` | 重置背面卡牌 |

**规则**
- RoleTable 是玩家长期角色数据表，常通过 `GameRuntimeData.Instance.roleTable` 或 PlayerInfo 间接访问。
- 普通战斗脚本如需监听角色属性变化，优先使用 `self:WatchRoleTable(...)`，不要直接重写监听器。

**版本风险**
- RoleTable 字段和属性名可能随存档结构变化。生成脚本时只直接操作明确需要的字段，并优先使用 PlayerInfo 封装。

### PropertyChanged 事件 (WatchRoleTable)

RoleTable 实现 `INotifyPropertyChanged`，17 个属性变化时触发:

`cardList`, `UnCardList`, `relicList`, `WithoutArmedRelicList`, `Money`, `San`, `MaxSan`, `InHighTide`, `Reward`, `sumFeat`, `CardCount`, `CardBottomCount`, `CardTopCount`, `MainVarUpperBound`, `SecondaryVarUpperBound`, `OtherVarUpperBound`, `VarsMap`

`blessingConfigs`, `Career`, `isDead` 在其他系统中有监听但非直接 PropertyChanged。

**不要**
- 不要监听不存在于上表的属性名后假设一定触发。

## FightCardManager (卡牌管理)

| 属性 | 说明 |
|------|------|
| `cardList` | 当前手牌列表 |
| `usedCardList` | 已用卡牌列表 |
| `FightcardList` | 战斗卡牌列表 |
| `tempList` | 临时卡牌列表 |
| `nascentList` | 新生卡牌列表 |
| `CardTags` | 卡牌标签字典 |

| 方法 | 说明 |
|------|------|
| `FightCardManager.Instance:DrawCard()` | 抽一张牌 |
| `FightCardManager.Instance:HasCard()` | 是否有可抽的牌 |
| `FightCardManager.Instance:RandomIndex(NeedUsed)` | 随机索引 |
| `FightCardManager.Instance:CardTagCheck(dataConfig)` | 标签检查 |
| `FightCardManager.Instance:RefreshTag(dataConfig)` | 刷新标签 |

**规则**
- FightCardManager 是战斗中的卡牌列表管理器；普通新增/移除卡牌优先使用 `self:AddCard*`、`self:ThrowCard`、`self:BurnCard`。
- 直接操作列表时要注意 C# List 的 0 起始索引和 XLua 的 `get_Item` 访问。

## FightManager (战斗管理器)

| 属性 | 说明 |
|------|------|
| `Instance` | 单例实例 |
| `IsFake` | 是否假战斗 (测试) |
| `fightType` | 战斗类型 (FightType) |
| `level` | 当前关卡 ID |
| `ValueDice` / `CheckDice` / `DefaultDice` | 骰子包装器 |
| `roleQueue` | 角色队列 |
| `ActionQueue` | 行动队列 |
| `statuses` | 状态字典 (按 InstanceId) |
| `eventList` | 事件队列 |
| `enemyManager` | 敌人管理器 |
| `patternManager` | 模式管理器 |
| `SumOfEnemyPositive` | 敌人正数总和 |
| `NowActionRole` | 当前行动角色 |

| 方法 | 说明 |
|------|------|
| `FightManager.Instance:CmdSendEvent(action, Id, sourceInstanceId, fromId, theData, Vars)` | 发送事件 (联机同步) |
| `FightManager.Instance:Init(level, roleQueueStream, ...)` | 初始化战斗 |
| `FightManager.Instance:CmdAddEnemy(enemyId)` | 添加敌人 (同步) |
| `FightManager.Instance:ChangeUnit(newType)` | 切换战斗单元 |
| `FightManager.Instance:EndPlayerturn()` | 结束玩家回合 |
| `FightManager.Instance:TurnEnd()` | 回合结束 |
| `FightManager.Instance:DOAllAction()` | 执行所有行动 |
| `FightManager.Instance:DoAction(fightObject)` | 执行单个行动 |
| `FightManager.Instance:CmdChangeCareer(CareerId, playerIdentity)` | 切换职业 (联机) |
| `FightManager.Instance:CmdChangeSummon(Isshow, playerIdentity)` | 切换召唤物显示 |
| `FightManager.Instance:EnqueueEvent(statusCommand, conn)` | 入队事件 |
| `FightManager.Instance:Weaved()` | 是否完成 |

**规则**
- FightManager 是底层战斗流程管理器；普通卡牌/Buff 效果优先用 ScriptExecutor 封装。
- `Cmd*` 方法通常涉及联机同步或命令队列，不适合作为单机脚本的首选入口。

**版本风险**
- 直接操作 FightManager 容易受战斗流程、联机和队列状态影响；除非明确知道调用时机，否则不要让 AI 自动生成这类调用。

## FightManager.RoleData

战斗中角色数据快照:

| 属性 | 说明 |
|------|------|
| `InstanceId` | 角色实例 ID |
| `MaxHp` / `CurHp` / `Defend` | 生命/防御 |
| `State` | 状态 (IStatusManager.State) |
| `career` | 职业 DataConfig |

这是一份战斗中角色数据快照，不等同于可随意写入的 RoleTable 长期数据。

## MapManager (地图管理器)

| 属性 | 说明 |
|------|------|
| `ModeMapManager` | 模式管理器 (IModeManager) |
| `CurrentMode` | 当前模式 |
| `mapList` / `mapData` | 地图列表/数据 |
| `SumOfEnemyPositive` / `ExHp` | 敌人属性 |
| `MapTree` | 地图树 |
| `Level` | 当前层级 |
| `NowDice` | 当前骰子 |
| `eventWait` / `eventDone` | 事件等待/完成计数 |

| 方法 | 说明 |
|------|------|
| `MapManager.Instance:SetMap(mapManager)` | 设置地图 |
| `MapManager.Instance:TryChange()` | 尝试切换地图 |
| `MapManager.Instance:MapUIStart(mapSelectUI)` | 启动地图 UI |
| `MapManager.Instance:CmdSelectMap(maps, mapdata, conn)` | 选择地图 (联机) |
| `MapManager.Instance:SetLevel(level)` | 设置层级 |
| `MapManager.Instance:WinTheGame()` | 是否获胜 |
| `MapManager.Instance:SetReward(battleRewardsUI)` | 设置奖励 |

**规则**
- MapManager 管关卡、地图选择和奖励流程，通常由事件脚本或 UI 流程间接触发。
- 普通战斗内效果不要直接改地图状态。

## MapTree (地图树)

生成 map 选关树:

| 属性 | 说明 |
|------|------|
| `root` / `currentNode` | 根节点 / 当前节点 |
| `treedice` | 树骰子 |
| `SelectNode` | 可选节点列表 |
| `DefaultNode` | 默认节点列表 |
| `hasUsed` | 已使用节点列表 |

| 方法 | 说明 |
|------|------|
| `mapTree:TypeGenerate(type)` | 按类型生成节点 |
| `mapTree:GetNodeByNodeId(nodeId)` | 按 ID 获取节点 |

### MapTree.Node
- `depth`: 节点深度
- `type`: 节点类型 (string)
- `data`: 节点数据 (Dictionary)
- `NodeDice`: 节点骰子
- `childrens`: 子节点数组

**版本风险**
- 地图树结构和节点字段与模式系统耦合；生成地图相关 Mod 时需要单独验证目标模式。

## PlayerManager (联机玩家管理器)

| 属性 | 说明 |
|------|------|
| `playerInfo` | 玩家信息 |
| `LobbyInfos` | 大厅信息 |
| `ShareCards` / `ShareRelics` / `ShareFood` | 共享卡/遗物/食物 |
| `PlayerId` | 玩家 ID |

| 方法 | 说明 |
|------|------|
| `PlayerManager.Instance:CmdJoinLobby(info, conn)` | 加入大厅 |
| `PlayerManager.Instance:LeaveLobby(info)` | 离开大厅 |
| `PlayerManager.Instance:RpcUpdateLobby(players)` | 更新大厅 |
| `PlayerManager.Instance:CmdReady(ready, playerId)` | 准备 |
| `PlayerManager.Instance:GameOver()` | 游戏结束 |
| `PlayerManager.Instance:CmdSyncRoleTable(roleTable)` | 同步角色表 |
| `PlayerManager.Instance:SetGameVar(key, value)` | 设置游戏变量 |
| `PlayerManager.Instance:SendRpcCommand(command)` | 发送 RPC 命令 |
| `PlayerManager.Instance:RpcGameOver()` | RPC 游戏结束 |

**规则**
- PlayerManager 属于联机系统；普通单机效果不要优先使用。
- 需要同步到其他玩家的操作应走对应 `Cmd*` / RPC 命令，而不是只改本地对象。

## BlessingRelic (祝福遗物处理器)

战斗中祝福/遗物的应用:

| 方法 | 说明 |
|------|------|
| `BlessingRelic.Instance:Apply(status)` | 对状态应用所有祝福遗物效果 |
| `BlessingRelic.Instance:Clear()` | 清除 |
| `BlessingRelic.Instance:Init()` | 初始化 |

普通祝福/遗物效果优先写在对应 Data 表的 OwnScript/FightScript 中，不要直接调用处理器来绕过生命周期。

## BuffItem (Buff UI 物品)

| 属性 | 说明 |
|------|------|
| `buffConfig` | Buff 配置 (IBuffItemConfig) |
| `status` | 状态管理器 |
| `effectList` | 效果列表 |
| `scriptExecutor` | 脚本执行器 |
| `HasClear` | 是否已清除 |

| 方法 | 说明 |
|------|------|
| `buffItem:Init(config, Status, buffBarUI)` | 初始化 |
| `buffItem:BuffProcess(isacting)` | Buff 处理 |
| `buffItem:ApplyBuff()` | 应用 Buff |
| `buffItem:ClearBuff()` | 清除 Buff |
| `buffItem:DurationCheck(way)` | 持续时间检查 |
| `buffItem:ClearDynamicVar(fromId, needAnnounce)` | 清除动态变量 |
| `buffItem:UpdateMsg()` / `buffItem:UpdateTooltip()` | 更新显示 |

BuffItem 是 UI/运行时 Buff 物品对象；新增或移除 Buff 优先使用 `self:AddBuff`、`self:RemoveBuff` 或状态管理封装。

## Network 查询类

联机网络数据查询:

| 类 | 用途 | 结果类型 |
|------|------|------|
| `Network.Query.QueryCareers` | 查询职业 | `List<DataConfig>` |
| `Network.Query.QueryDeck` | 查询牌组 | `List<DataConfig>` |
| `Network.Query.QueryFood` | 查询食物 | `List<DataConfig>` |
| `Network.Query.QueryRelic` | 查询遗物 | `Witch.UI.Window.RelicData` |
| `Network.Query.QueryStatus` | 查询状态 | `Witch.UI.Window.StatusUIData` |

使用: `New()` → `CmdExecute()` 发送请求，结果通过 `Result` 属性获取。

### Network.Command.RpcCommandBase

联机同步命令基类，子类包括:
- `RpcEatFood`: 吃食物 (dataConfig, getId, isEat)
- `RpcGetItem`: 获取物品 (itemType, dataConfig, getId, isGet)

通过 `PlayerManager.SendRpcCommand(command)` 发送。

**版本风险**
- 联机查询和命令依赖网络状态、连接对象和 Mirror 同步流程；没有联机测试时不要把它作为核心效果路径。

## AnimatorRole (角色动画器)

| 属性 | 说明 |
|------|------|
| `animationPerFrame` | 每帧时长 |
| `dataConfig` | 角色 DataConfig |
| `SpecialScale` | 特殊缩放 |
| `OriPos` | 原始位置 |
| `InstanceId` | 实例 ID |

| 方法 | 说明 |
|------|------|
| `animatorRole:Init(fromData, instanceId, needDialogueBox, yoff)` | 初始化 |
| `animatorRole:TryGetAnimationConfig(path)` | 获取动画配置 |
| `animatorRole:InitSprite(sprite, instanceId)` | 精灵初始化 |

动画路径应遵循资源路径规则；Mod 自带动画通常放在 `Mods/<ModName>/ModResource/AnimationLib/...`。

## UIAnimation (UI 动画)

用于播放 GIF/序列帧动画:

| 属性 | 说明 |
|------|------|
| `FPS` / `FrameCount` | 帧率/帧数 |
| `IsPlaying` / `AutoPlay` / `Loop` | 播放状态 |
| `GifAsset` | GIF 资源 |
| `OnComplete` | 完成回调 |

| 方法 | 说明 |
|------|------|
| `uiAnimation:SetGif(gif)` | 设置 GIF |
| `uiAnimation:Play()` / `PlayReverse()` | 播放 |
| `uiAnimation:Pause()` / `Resume()` / `Stop()` | 暂停/恢复/停止 |

UIAnimation 是 UI 序列帧/GIF 播放组件，不是角色战斗动画配置格式。

## DiceIcon (骰子图标)

| 属性 | 说明 |
|------|------|
| `result` / `bonusText` / `range` | UI 文本 (TMP) |
| `value` / `bonus` | 当前值/加值 |
| `rollDuration` | 滚动动画时长 |

| 方法 | 说明 |
|------|------|
| `diceIcon:Roll(title)` | 显示骰子滚动动画 |

DiceIcon 只负责 UI 表现；实际骰子结算仍以 Dice/ScriptExecutor 的骰子结果为准。

## FightLine (战斗连线)

用于绘制卡牌与目标之间的贝塞尔曲线连线:

| 方法 | 说明 |
|------|------|
| `fightLine:SetStartPos(localPos)` | 设置起点 |
| `fightLine:SetEndPos(uiWorldPos)` | 设置终点 |
| `fightLine:Combine(uiObject)` | 连接 UI 物体 |
| `fightLine:GetBezier(start, control, _end, t)` | 贝塞尔计算 |

FightLine 是 UI 连线表现对象；不要把它当作目标选择或伤害判定入口。

## DialogueManager (对话管理器)

| 方法 | 说明 |
|------|------|
| `DialogueManager.Instance:ShowDialogue(id)` | 显示对话 |
| `DialogueManager.Instance:HideDialogue(flag)` | 隐藏/显示 |
| `DialogueManager.Instance:ShowOptions(tuples)` | 显示选项 |
| `DialogueManager.Instance:EndDialogue()` | 结束对话 |
| `DialogueManager.Instance:NextDialogue()` | 下一段对话 |
| `DialogueManager.Instance:ShowEmoji(instanceId, emoji)` | 显示表情 |

对话流程中优先使用 `ScriptExecutor.PlayerInfo.ShowDialogue` / `EndDialogue`，需要直接控制对话 UI 时再访问 DialogueManager。

## UI 窗口与数据结构 (运行时摘要)

本节只保留 Lua/Mod 脚本可能直接触达的 UI 类型和数据结构摘要；完整 UI 窗口清单、触发事件和窗口职责归档在 `ui-windows.md`。

**规则**
- 本节是运行时 UI 类型速查，不是普通卡牌/Buff 脚本的首选入口。
- 能通过 ScriptExecutor、PlayerInfo 或 EventCenter 完成的逻辑，优先使用这些封装。
- 直接操作 UI 类型时要先确认对象实例来源；TypeHint 有类型不代表当前脚本上下文已有实例。

**不要**
- 不要在普通战斗效果里直接 new 或随意改 UIBase 派生对象。
- 不要把 UI 表现方法当作数据结算方法；伤害、Buff、抽牌等结算仍走战斗系统。

### Witch.UI.Window.FightUI (战斗主界面)

| 属性 | 说明 |
|------|------|
| `LastCard` | 最后使用的卡 DataConfig |
| `cardItemList` | 手牌列表 |
| `SelectedCard` / `WaitCard` | 已选/等待卡牌 |
| `SelectType` | 选择类型 (string) |
| `CanBeforeEnd` | 可否提前结束 |
| `ShouldCard` | 应出卡数 |
| `totalDamageText` | 伤害文本字典 |
| `autoCard` | 自动出牌 |
| `UsedCardList` | 已用牌列表 Transform |
| `StatusList` | 状态列表 |

| 方法 | 说明 |
|------|------|
| `fightUI:CreateCardItem(dataConfig)` | 创建卡牌 UI 项 |
| `fightUI:UpdateCardItemPos(OnComplete, from)` | 更新卡牌位置 |
| `fightUI:ShuffleCardItems()` | 洗牌动画 |
| `fightUI:RemoveAllCards()` | 移除所有卡牌 |
| `fightUI:ThrowCardScript(val, Type)` | 弃牌脚本 |
| `fightUI:Burning(val, Type)` | 烧牌 UI |
| `fightUI:BurnCard(cardItem)` | 烧单张卡 |
| `fightUI:SelectCardToAction(val, onCardSelected, Type)` | 选卡后执行 |
| `fightUI:SelectInit(uitype)` | 选择初始化 |
| `fightUI:UpdatePower()` | 更新能量显示 |
| `fightUI:CreateDeckMenu()` | 创建牌堆菜单 |
| `fightUI:ShowBattleReward()` | 显示战斗奖励 |
| `fightUI:CanWin()` | 是否可获胜 |
| `fightUI:AutoUseCard()` | 自动用牌 |
| `fightUI:EnqueueDamageText(text, position, popUpType, status, to, realDamage)` | 排队伤害冒字 |

FightUI 主要负责战斗界面显示、手牌 UI 和选择交互。卡牌效果不要直接改 `cardItemList` 来代替 ScriptExecutor 的卡牌操作。

### Witch.UI.Window.BuffBarUI (Buff 状态栏)

| 方法 | 说明 |
|------|------|
| `buffBarUI:CreateNewBuff(buffId, level)` | 创建新 Buff 项 |
| `buffBarUI:AddBuff(buffConfig)` | 添加 Buff (接受 IBuffItemConfig 或 buffId+level) |
| `buffBarUI:RemoveBuff(buffId)` | 移除 Buff |
| `buffBarUI:GetBuff(buffId)` | 获取 Buff 项 |
| `buffBarUI:GetBuffs()` | 获取所有 Buff 项 |
| `buffBarUI:CheckAllBuff(way)` | 检查所有 Buff 持续时间 |
| `buffBarUI:UpdateAllBuff()` | 更新所有 Buff 显示 |
| `buffBarUI:ClearAllBuff()` | 清除所有 Buff |

BuffBarUI 是状态栏 UI；添加/移除 Buff 优先走 `self:AddBuff` / `self:RemoveBuff`，让 UI 跟随状态更新。

### Witch.UI.Window.StatusBarUI (状态栏)

各角色头顶的状态条 (HP/防御/行动意向等)。

### Witch.UI.Window.LineUI / FightLine (战斗连线)

绘制攻击目标之间的贝塞尔曲线:

| 方法 | 说明 |
|------|------|
| `lineUI:SetStartPos(pos)` | 设置起点 |
| `lineUI:SetEndPos(pos)` | 设置终点 |
| `lineUI:FadeIn()` / `lineUI:FadeOut(callback)` | 渐入/渐出 |
| `lineUI:GetBezier(start, mid, _end, t)` | 贝塞尔插值计算 |

LineUI / FightLine 只负责连线表现，不负责决定目标或结算攻击。

### Witch.UI.Window.PopUpTextUI (浮动伤害/治疗文字)

| 属性 | 说明 |
|------|------|
| `val` | 当前显示值 (string) |
| `isDestroy` | 是否已销毁 |
| `maxHeight` / `maxFontSize` | 最大高度/字体大小 |
| `target` | 目标类型 |
| `pause` | 是否暂停 |

卡牌使用时可通过战斗系统排队伤害文字；直接改 PopUpTextUI 只影响表现，不改变真实伤害。

### 数据传输对象 (ValueType)

#### RelicData
遗物 UI 数据结构: `{Id, relicList}`, 从 `RoleTable` 构造。

#### OutDeckUIData
牌组界面数据: `{Id, cardList, UnCardList, CardBottomCount, CardTopCount, MaxAlCardCount}`, 从 `RoleTable` 构造。

#### StatusUIData
状态 UI 数据: `{instanceId, VarsMap, blessingConfigs, relics, career, San, MaxSan, Money, ChooseVars}`, 从 `RoleTable` 构造。

#### CareerData
职业数据: `{instanceId, career, San, MaxSan}`, 从 `RoleTable` 构造。

### Witch.UI.Window.HouseManager (主界面/宿舍)

主菜单功能管理:

| 方法 | 说明 |
|------|------|
| `houseManager:StartGame()` | 开始游戏 |
| `houseManager:StartShop()` | 打开商店 |
| `houseManager:OpenLibrary()` | 打开图书馆 |
| `houseManager:OpenTower()` | 打开塔 |
| `houseManager:OpenStore()` | 打开仓库 |
| `houseManager:OpenStorehouse()` | 打开储藏室 |
| `houseManager:OpenDictionary()` | 打开字典 |
| `houseManager:OpenSetting()` | 打开设置 |
| `houseManager:OpenAnnouncement()` | 打开公告 |
| `houseManager:OpenExhibition()` | 打开展览 |
| `houseManager:OpenSpring()` | 打开温泉 |
| `houseManager:OpenWitchHouse()` | 打开巫师之家 |
| `houseManager:OpenAdministration()` | 打开管理 |
| `houseManager:ClickItem(houseItemType)` | 点击场景物品 |
| `houseManager:ReturnMain()` | 返回主菜单 |
| `houseManager:DataUpdate()` | 数据更新 |
| `houseManager:ChangeNight()` | 切换昼夜 |

HouseManager 属于主界面/宿舍流程；普通战斗脚本不要直接调用。

### Witch.UI.Window.TopBarUI (顶部状态栏)

战斗中显示遗物、属性、玩家状态:

| 方法 | 说明 |
|------|------|
| `topBarUI:CreateConnectPlayerStatus(players)` | 创建联机玩家状态 |
| `topBarUI:ChangeCareerAvator()` | 切换职业头像 |
| `topBarUI:FadeIn()` / `topBarUI:FightHide()` | 淡入/战斗隐藏 |
| `topBarUI:OnGameRuntimeDataChanged(sender, args)` | 游戏数据变化回调 |
| `topBarUI:ShowLeftUp()` / `topBarUI:HideLeftUp()` | 显示/隐藏左上角 |

TopBarUI 是显示层；需要改变金钱、属性、遗物等数据时优先改 PlayerInfo/RoleTable 数据，让 UI 自行刷新。

### Witch.UI.Window.AchievementTable (成就表)

| 属性 | 说明 |
|------|------|
| `AchievementTable.AchievementInfo` | 成就信息: {id, name, description, tip, level, reward, status} |
| `AchievementCatalog.Definition` | 成就目录定义 |

方法与 GameRuntimeData.AchievementTable 关联。

**版本风险**
- UI 类型和字段受场景、窗口生命周期和预制体结构影响，比 Data/Text 配置更容易随版本变化。没有实例来源和运行验证时，不要让 AI 自动生成直接 UI 操作。

## CSV 表结构

**通用规则**
- Data/Text CSV 都必须保留第 1 行表头和第 2 行备注行，数据从第 3 行开始。
- 新增 Mod 条目的 CSV `Id` 写局部 ID；运行时引用按 `ModName_FileName_Id` 生成完整 ID，去掉局部 ID 前缀 `*`。
- Data 与 Text 通过同目录同文件名和同一个局部 `Id` 配对。
- 表头以你正在编辑的目标样例 CSV 为准；不同模板和示例可能列不完全相同。
- 脚本列在 Mod CSV 中写 Lua，不直接复制原版 C# 参考脚本。

**不要**
- 不要删除第 2 行备注行。
- 不要把概括表里的列机械补进目标 CSV；目标表头没有的列不要擅自新增。
- 不要在运行时脚本、技能字段或查询 API 中使用 CSV 局部 ID。

### Card (卡牌)
**模板样例 Data 列:** `Id`, `Rarity`, `Expend`, `Tag`, `InitScript`, `DrawScript`, `UseScript`, `DropScript`, `Icon`, `Effects`, `Action`, `PackBelong`

**Defect 示例 Data 列:** `Id`, `Rarity`, `Expend`, `Tag`, `InitScript`, `DrawScript`, `UseScript`, `DropScript`, `Icon`, `Effects`, `Action`

| 列 | 说明 |
|------|------|
| `Id` | 唯一标识，*前缀=不进随机池 |
| `Rarity` | 稀有度 (1-3) |
| `Expend` | 耗能 |
| `Tag` | 标签 (Retain, Burnout, Froze, Instant, Combo, Curse, SpellComponents, Unusable, Ascension 等) |
| `InitScript` | 必须设置 `BaseScript` = `AttackCardItem` / `CommonCardItem` |
| `PackBelong` | 所属卡包 ID；模板样例中存在，Defect 示例卡牌表未包含 |

**原版卡牌子类型（用于理解标签和机制）:**

| 文件 | 卡牌数 | 关键词 |
|------|--------|--------|
| `card.csv` | 18 | 基础通用牌 |
| `blood.csv` | 13 | 流血机制 (bleeding) |
| `burningcard.csv` | 4 | 灼烧机制 (burn) |
| `careercard.csv` | 11 | 职业技能牌 (全部 * 前缀) |
| `combo.csv` | 15 | 连击机制 (Combo tag) |
| `counterattackcard.csv` | 13 | 反击机制 |
| `cursecard.csv` | 15 | 诅咒牌 (Curse tag) |
| `elementscard.csv` | 13 | 元素机制 |
| `healcard.csv` | 9 | 治疗牌 |
| `luckycard.csv` | 10 | 金币机制 |
| `nocard.csv` | 5 | 魂系机制 (全部 * 前缀) |
| `onlinecard.csv` | 17 | 联机/队友互动 |
| `perceivecard.csv` | 4 | 感知机制 |
| `ReturnAgain.csv` | 15 | 返还机制 |
| `ritualcard.csv` | 19 | 仪式机制 |
| `SpellCard.csv` | 23 | 法术牌 (SpellComponents tag) |
| `timekeeper.csv` | 18 | 时停机制 (Froze/Instant tag) |
| `universalcard.csv` | 20 | 通用功能牌 |
| `Crowdfundingcard.csv` | 43 | 众筹牌 |

**规则**
- `InitScript` 至少要设置合适的 BaseScript：需要选目标的攻击牌用 `AttackCardItem`，不需要选目标的通用牌用 `CommonCardItem`。
- `UseScript`、`DrawScript`、`DropScript` 等脚本列在 Lua Mod 中写 `self:*` 调用。
- Mod 卡牌被职业技能、脚本或事件引用时使用完整 ID，例如 `Defect_cardsample_defect_discharge`。

**不要**
- 不要把原版卡牌的 C# 脚本原样复制进 Mod 卡牌 CSV。
- 不要在 `Skill1`、`AddCardById` 或脚本中写局部 ID `*defect_discharge`。

### Dialogue (对话)
**Data 列:** `Id`, `BaseScript`, `EndScript`, `Roles`, `EventName`, `ChoiceCount`, `ChoiceScript1`, `ChoiceScript2`

- `Roles`: 格式 `role_amelia`，说话者用 `<>` 包裹
- `EventName`: 触发时点 (如 `FirstFight`, `2Fight`, `Mapselect`)
- `ChoiceCount`: 选项数，ChoiceScript 使用 `ShowDialogue("id")` 跳转分支
- EndScript 可调用 `PlayerInfo.WinTheFight()`, `EndDialogue()`, `PlayerInfo.QuitAndDeleteSave()` 等

**对话文件列表:** 2Fight, 3Fight, 4Fight, 7Node, ending, FirstBless, FirstFight, FirstShop, Mapselect, SecondAD, StartTutorial, WinChruch

### HouseDialogue (宿舍对话)
- Data 目录: `HouseDialogue/faildialog1-3.csv`, `windialog1-17.csv`
- 配置表: `HouseDialogueConfig/fail.csv`, `success.csv` (联合键: `Id`, `DialogueId`, `Build`)

### EnchTag (附魔标签)
- 给卡牌添加标签效果
- `Tag` 列定义标签名，`UseScript` 在使用时执行
- 示例标签: Burnout, Inherent (固有)
- 众筹版在 `Crowdfundingenchtag.csv`

---

## 关键游戏类层次

| 类 | 基类 | 关键字段/方法 | 说明 |
|------|------|------|------|
| `ScriptExecutor` | System.Object | Self, Target, Vars, AddBuff, Damage, AddEvent | Lua 脚本上下文 (80+ 方法) |
| `CardItem` | MonoBehaviour | canUse, dataConfig, Vars, Tags, scriptExecutor | 卡牌游戏对象 |
| `FightManager` | Mirror.NetworkBehaviour | Instance, eventList, statuses; CmdSendEvent(), CmdAddEnemy() | 战斗管理器 |
| `FightCardManager` | System.Object | cardList, usedCardList | 卡牌管理 |
| `FightPlayer` | FightObject | Type, Id, Status, MaxPowerCount | 战斗玩家 |
| `Enemy` | OtherObj | Type, Init(), DoAction() | 敌人 |
| `EnemyManager` | System.Object | enemyList, LevelId, AddEnemy() | 敌人管理 |
| `StatusManager` | MonoBehaviour | maxHp, curHp, defend, DamageFilter | 状态管理 (Self/Target) |
| `Commands` | System.Object | Log(), give(), copy(), remove() | 游戏命令系统 |
| `RoleTable` | System.Object | cardList, relicList, Money, Career | 角色数据表 |

---

### Buff (增益/减益)
**模板样例 Data 列:** `Id`, `InitScript`, `ApplyScript`, `ClearScript`, `ReducePerTurn`, `ReducePerAttacked`, `ReducePerUse`, `UpperBound`, `Icon`, `Type`, `Rarity`, `Effects`, `SoundEffects`, `Action`, `CanZero`

**Defect 示例 Data 列:** `Id`, `InitScript`, `ApplyScript`, `ClearScript`, `ReducePerTurn`, `ReducePerAttacked`, `ReducePerUse`, `UpperBound`, `Icon`, `Type`, `Rarity`, `Effects`, `SoundEffects`, `Action`

| 列 | 说明 |
|------|------|
| `Id` | 唯一英文 ID，如 `timelock`, `bloodwall`, `bleeding` |
| `InitScript` | 初始化脚本 (Lua Mod 需改写为 `self:` 调用)。通常: `Vars["stack"] = "1"` 做层数初始化 |
| `ApplyScript` | Buff 生效时执行的事件监听逻辑。核心模式: `self:AddEvent("事件名", function() ... end)` |
| `ClearScript` | Buff 清除时执行的清理逻辑 |
| `ReducePerTurn` | 每回合层数减少量 (0=不减少) |
| `ReducePerAttacked` | 每被攻击层数减少量 |
| `ReducePerUse` | 每使用卡牌层数减少量 |
| `UpperBound` | 层数上限: 1, 10, 100, 999, 9999, 999999 (不同 buff 差异很大) |
| `Icon` | 图标路径: `Icon/Buff/<名称>` |
| `Type` | 类型: `能力`(ability), `正面`(positive), `负面`(negative), `契印`(imprint/covenant) |
| `Rarity` | 稀有度: 1-4 |
| `CanZero` | 是否可降至0层；模板样例中存在，Defect 示例 Buff 表未包含 |
| `Effects` | 特效名称：如 `中毒` 用于 ProcessEffect |
| `SoundEffects` | 音效路径 |
| `Action` | 行动类型标记 |

**ID 命名规则:** 英文 snake_case，SpecialBuff 使用 `Prefix:Name` 格式 (如 `Law:Judgment`)。

**ApplyScript 常用事件模式:**
- `EndRound` — 回合结束触发（中毒/灼烧/诅咒）
- `StartRound` — 回合开始触发（时停/蓄力）
- `Hurt` — 受伤时触发（蓄势/荆棘/不朽）
- `Action` / `ActionAfter` — 行动前/后触发（血墙/元素/连击）
- `CostPower` — 消耗能量时触发（源蜕）
- `FightStart` — 战斗开始时触发
- `ICreateCardItem` — 创建卡牌时触发
- `AttackDone` — 攻击完成后触发
- `BurnCard` — 烧牌时触发
- `Buff 层数变化事件` — `buff_<name>OnLevelChange`，特定 buff 层数变化
- `NoPowerWhenTry` — 尝试用卡能量不足
- `EndCreateCardItem` — 卡牌项创建完成
- `NoCard` — 无手牌
- `AddPower` — 能量增加时
- `StartRoundEnd` — 回合开始结束时
- `BeforeDead` — 死亡前触发
- `Resurrection` — 复活时触发
- `Escape` — 逃跑时触发
- `Shuffle` — 洗牌时触发
- `Dead` — 死亡时触发
- `Win` — 胜利时触发
- `AddBuff` (带 AddBuffData) — 有 Buff 被添加时触发
- `buff_<name>OnLevelChange` — 特定 buff 层数变化时触发

**规则**
- `ApplyScript` 通常注册事件监听，监听中再根据层数、目标、变量执行效果。
- Lua Mod 中 Buff 层数和临时状态优先放在 `self.Vars` 或动态变量里，按 XLua 字典方式访问。
- 其他脚本引用 Mod Buff 时使用完整 ID，例如 `Defect_buffsample_focus`。

**不要**
- 不要在 `ApplyScript` 中写裸 `AddEvent(...)`；Mod Lua 应写 `self:AddEvent(...)`。
- 不要在 `AddBuff` / `GetBuff` 中写局部 ID，例如 `focus` 或 `electric_orb`。
- 不要假设所有有参事件对象都能直接传进 Lua 回调；需要运行验证。

### Career (职业)
**Data 列:** `Id`, `SanMax`, `SkillScript`, `Animation`, `Vocal`, `Skill1`, `Skill2`, `ChoiceIcon`, `DollIcon`, `Character`, `Avatar`, `CareerImage`, `ActionImage1`, `ActionImage2`, `Dialogue`, `EmojiPath`, `AttackEffect`, `SkillEffect`, `HitEffect`, `DefendEffect`

| 列 | 说明 |
|------|------|
| `Id` | 数值 ID (1-3), `*` 前缀=特殊职业 |
| `SanMax` | 最大理智值 |
| `SkillScript` | 被动技能与战斗初始化 (C# AddEvent 模式) |
| `Animation` | 动画文件夹路径；原版资源可写 `AnimationLib/<职业名>`，ModResource 资源可写 `Mods/<ModName>/ModResource/AnimationLib/<目录>` |
| `Vocal` | 配音路径；Defect 示例沿用原版 `VocalLib/支配魔女` |
| `Skill1`/`Skill2` | 职业技能卡牌 ID；Mod 示例中使用生成后的完整 ID，如 `Defect_cardsample_defect_discharge` |
| `DollIcon` | 玩偶动画: `DollAni/<职业名>/<path>` |
| `Character` | 立绘: `Images/Character/<name>` |
| `Avatar` | 头像: `Images/Avatar/<name>` |
| `CareerImage` | 职业图: `Images/CareerImage/<name>` |
| `AttackEffect`/`SkillEffect`/`HitEffect`/`DefendEffect` | 动画效果名称 |

**SkillScript 特征:**
- 使用 `PlayerInfo.SkillTime["cardId"] = N` 设置技能冷却；Mod 卡牌通常使用生成后的完整 ID 作为 key
- 使用 `PlayerInfo.SpecialVars["key"]` 保存职业专属永久状态
- `ChangeCareer("career_N")` 切换职业 (用于变身或多阶段)
- 条件判断 `PlayerInfo.enemylevel` 区分不同层级的奖励

模板 `ModTemplate/Data/Career/careersample.csv` 和 `Example/Defect/Data/Career/careersample.csv` 的表头不同：模板包含 `ChoiceIcon` 与 `AttackEffect`/`SkillEffect`/`HitEffect`/`DefendEffect`，Defect 示例使用 `FightWidget`。编写时以当前目标 CSV 表头为准。

**规则**
- 职业技能字段 `Skill1` / `Skill2` 引用卡牌运行时完整 ID；Mod 卡牌不要写 CSV 局部 ID。
- 职业动画如果使用 Mod 自带资源，路径写 `Mods/<ModName>/ModResource/AnimationLib/<目录>`。
- `SkillTime` 的 key 要与实际技能卡牌 ID 一致；Mod 卡牌通常使用完整 ID。

**不要**
- 不要把职业 `Id`、ModId 和技能卡牌 ID 混用。
- 不要机械套用另一个样例的职业表头；先按目标 CSV 表头写。

### Relic (遗物)
**Data 列:** `Id`, `Rarity`, `OwnScript`, `FightScript`, `Icon`, `PackBelong` (众筹版额外有)

| 列 | 说明 |
|------|------|
| `Id` | 数值 ID (1-80), `*` 前缀=模板/不进随机池 |
| `Rarity` | 稀有度 1-4 |
| `OwnScript` | 获得遗物时执行的脚本 (C# 语法) |
| `FightScript` | 战斗中执行的脚本 (C# AddEvent 模式) |
| `Icon` | 图标路径: `Icon/Relic/<名称>` |
| `PackBelong` | 所属卡包 ID (如 `cardpack_5`, `cardpack_7`)，仅众筹版有 |

**FightScript 常用模式:**
- 计数器: `Vars["ThisCount"] = "0"` 初始化, 事件触发时累加, `UpdateRelicShow()` 更新显示
- 骰子判定: `CheckDice.Roll().Value`, `DefaultDice.Roll().Value`, `ValueDice.Roll().Value`
- 动态变量: `ChangeDynamicVar("key", "val")`
- 遗物联携: `FightRelicCheck((list, id) => {...})` — 检查其他遗物
- 伤害减免: `Self.DamageFilter["key"] = 100f` — 设置伤害过滤
- 战斗类型判断: `returnFightType()` — 返回当前 FightType
- 直接操作: `EscapeFight()`, `PlayerInfo.AddBless(id)`, `PlayerInfo.RemoveRelic(id)`
- 卡牌过滤: `HandCard.Where(x => x.data["InitScript"].Contains("CommonCardItem")).Count()` 等 LINQ (Lua 需手写遍历)

**规则**
- 遗物脚本常依赖长期计数、战斗开始监听、回合监听和 UI 显示刷新。
- Lua Mod 中把 `Vars["ThisCount"]` 改成 `self.Vars:get_Item("ThisCount")` / `set_Item`。
- 涉及手牌过滤时，不要使用 LINQ；遍历 C# List 并手写条件。

**不要**
- 不要把 `Self.DamageFilter["key"] = ...` 原样复制进 Lua；应使用 `self:SetDamageFilter(...)` 或状态对象的封装方法。
- 不要在未设置事件生命周期时重复注册同一遗物监听，避免效果叠加。

### Blessing (祝福)
**Data 列:** `Id`, `Weight`, `OwnScript`, `FightScript`, `Icon`, `Type`, `Source`, `Rarity`, `PackBelong` (众筹版额外有)

| 列 | 说明 |
|------|------|
| `Id` | 数值 ID (1-50), `*` 前缀=有条件解锁的进阶祝福 |
| `Weight` | 随机选择权重 (2-8) |
| `OwnScript` | 获得时执行的脚本, 常直接写 `PlayerInfo.Strength+=2` 等属性修改 |
| `FightScript` | 战斗脚本 (C# AddEvent 模式) |
| `Type` | `正面` (buff) 或 `负面` (debuff) |
| `Source` | `物资` (material) 或 `技能` (skill) |
| `Rarity` | 1-4 |

**进阶祝福 (`*` 前缀) 特征:**
- 开头检查属性阈值，不满足则 `return` (不下脚本)
- 例如: `*101` 需要 `PlayerInfo.Strength < 10`, `*105` 需要 `PlayerInfo.Strength < 20`
- 模板类: Strength/Lucky/Wisdom/Perceive 各有 1/2/3/4 级进阶

**规则**
- `OwnScript` 偏获得时立即生效，`FightScript` 偏每场战斗注册或应用效果。
- Mod Lua 中访问玩家属性用 `ScriptExecutor.PlayerInfo.*`。
- `*` 前缀仍只影响随机/解锁语义，运行时引用时不带 `*`。

**不要**
- 不要把 `PlayerInfo.Strength+=2` 原样写进 Lua；应显式读取并赋值，或用已有封装。
- 不要把进阶祝福的阈值检查省掉，否则会改变解锁/出现规则。

### Enemy (敌人)
**Data 列:** `Id`, `Name`, `Hp`, `Attack`, `Defend`, `ActionCount`, `Rarity`, `InitScript`, `CardList`, `AttributeText`, `Animation`

| 列 | 说明 |
|------|------|
| `Id` | 5 位数字 ID (10001+), `*` 前缀=特殊/模板敌人 |
| `Rarity` | 单体强度 1-3 |
| `InitScript` | 初始 Buff: `AddBuff("SpecialBuff_xxx", "N")` (C# 语法) |
| `CardList` | 卡牌列表, 逗号分隔敌人卡 ID (如 `enemycard_OrdinaryHit`) |
| `AttributeText` | 属性标签: `;` 分隔多个 SpecialBuff ID |
| `Animation` | 动画路径: `AnimationLib/<名称>` |

InitScript 中可用条件初始化:
- `int.Parse(PlayerInfo.GetTagDiff()) > N` — 根据玩家Tag差异动态设置Buff层数
- `atk()` — 返回当前攻击力字符串

**规则**
- 敌人 `CardList` 引用敌人卡 ID，不是玩家卡牌 ID。
- `InitScript` 在 Lua Mod 中同样需要改写为 Lua 语法和 `self:*` 调用。
- 敌人动画如果使用 Mod 自带资源，按 ModResource 路径规则填写。

### Effect (效果)
**Data 列:** `Id`, `InitScript`, `Timepoint`, `Script`, `Cost`, `DesValType`
- `Timepoint`: 触发时点 | `Cost`: 负荷 | `DesValType`: 占位符类型

### EventList (遭遇事件)
**模板样例 Data 列:** `Id`, `1Script`, `2Script`, `3Script`, `4Script`, `InitScript`, `IsHighRisk`, `EntryScript`

**原版/Lib Data 列:** `Id`, `1Script`, `2Script`, `3Script`, `4Script`, `InitScript`, `EntryScript`

| 列 | 说明 |
|------|------|
| `Id` | 数值 ID (1-20), `*` 前缀=特殊事件, `Sub_*` 前缀=子事件 |
| `1Script`~`4Script` | 最多 4 个选项的脚本 (使用 `PlayerInfo.*` 方法, C# 语法) |
| `InitScript` | 选项解锁条件: `Vars["Choice1"] = "1"` 启用选项1, `Vars["Choice2"] = "2"` 禁用选项2 |
| `IsHighRisk` | 是否为高危事件；模板样例中存在，原版/Lib 表中不存在 |
| `EntryScript` | 事件退出后执行: 通常 `PlayerInfo.StartLevel("Fight"/"build", id)` 进入下级 |

**事件脚本关键 API:**
- `PlayerInfo.ContinueEvent("N")` — 跳转向子事件 `Sub_<id>_<N>` (多步事件链)
- `PlayerInfo.EndEvent()` — 结束事件 (回到地图)
- `PlayerInfo.StartLevel("Fight", "level_xxx")` — 进入战斗
- `PlayerInfo.StartLevel("build", "break"/"shop")` — 进入建造/商店
- `PlayerInfo.ChangeEventSubtip(@"\<tag\>(.*?)\<\/tag\>")` — 替换描述中的占位文本
- `PlayerInfo.LockChoice("N")` — 禁用第 N 个选项
- `PlayerInfo.RemoveCard("All")` / `PlayerInfo.RemoveRelic("All")` — 批量移除
- `PlayerInfo.SetGameVar("key", "val")` / `PlayerInfo.GetGameVar("key")` — 跨事件持久化变量
- `PlayerInfo.AnnounceEventDone()` — 告知地图事件已完成, 配合 `SetGameVar` 用于 Boss 条件
- `OutFightSelectCardToAction(count, source, callback)` — 选卡交互
- `PlayerInfo.DefaultRoll` — 默认骰子值 (C# 语法)

**InitScript 条件示例:**
- `Vars["Choice1"]="1"` — 启用选项1
- `if (PlayerInfo.Money<50) { Vars["Choice2"]="2"; }` — 钱不够禁用选项2
- 仅限特定选项可用时直接写到 Vars

**子事件命名:** `Sub_<parentId>_<order>`, 如 `Sub_*999_2` 是 `*999` 的第2步

**规则**
- 事件脚本主要走 `ScriptExecutor.PlayerInfo.*` 静态入口，控制对话、选项、奖励、地图和关卡跳转。
- 选项可用性通过 `Vars["ChoiceN"]` 控制；Lua Mod 需要用 XLua 字典访问方式改写。
- 子事件 ID 仍按 CSV 局部 ID 规则生成完整运行时 ID；跨脚本引用时不要带 `*`。

**不要**
- 不要把 `PlayerInfo.*` 原样复制到 Lua；应写 `ScriptExecutor.PlayerInfo.*`。
- 不要在事件脚本中直接操作战斗专用的 `self.Target`、`self.Self`，除非该脚本确实运行在战斗上下文。

### 其他 Data 类型

| 类别 | Data 列 |
|------|--------|
| EnemyBless | `Id`, `Rarity`, `FightScript` |
| Food | `Id`, `Icon`, `Hp`, `HPPercent`, `Rarity` |
| Item | `Id`, `Rarity`, `Type`, `Icon` |
| Task | `Id`, `Reward`, `InitScript`, `Target`, `Belong` |
| Achievement | `Id`, `ListenScript`, `Type`, `Reward`, `RewardType` |
| EnchTag | `Id`, `Tag`, `LoadScript`, `DrawScript`, `DropScript`, `PreUseScript`, `UseScript`, `UnloadScript`, `Rarity`, `Icon`, `PackBelong` |
| EnemyCard | `Id`, `InitScript`, `TargetScript`, `UseScript`, `BackIcon`, `Icon`, `Tag`, `Effects`, `Action` |
| PartnerCard | `Id`, `InitScript`, `TargetScript`, `UseScript`, `Icon`, `Tag`, `Effects`, `Action` |
| Destiny | `Id`, `Rarity`, `OwnScript`, `FightScript`, `Icon`, `Type` |
| SlotReward | `Id`, `Type`, `NodeId` |
| Coin | `Id`, `Type`, `NodeId`, `TokenType`, `TokenWeight` |
| Map | `Id`, `Type`, `NodeId`, `Level` |
| Level | `Id`, `EnemyIds`, `Note`, `Level`, `BGM` |
| Dialogue | `Id`, `BaseScript`, `EndScript`, `Roles`, `EventName`, `ChoiceCount`, `ChoiceScript1/2` |
| HouseDialogue | 同上 (无 EventName) |
| Hard | `Id`, `Belong`, `Level`, `UseScript`, `FightScript`, `MaxCount`, `Type` |
| Tutorial | `Id`, `EventName`, `Initial` |
| SlotCal | `Id`, `Type`, `NodeId` |
| Affection | `Id`, `Character`, `Reward`, `InitScript`, `Target`, `Belong` |
| OutSideShop | `Id`, `PriceType`, `Price`, `TimePrice`, `Icon`, `Type`, `Toid`, `BuyScript`, `BuyCount`, `CanClose` |
| Partner | `Id`, `InitScript`, `ChoiceIcon`, `Model`, `Animation`, `Bless`, `CareerImage` |
| RoleData | `Id`, `Avatar`, `CharacterImage`, `HouseAvatar` |

以上列以 `ModTemplate/Data/*/*sample.csv` 为准；Defect 示例只覆盖 Buff/Card/Career，且这三类表头与模板并不完全相同。编写时优先复制当前目标类型的样例表头，不要只按概括表补列。

**版本风险**
- “其他 Data 类型”只提供列名速查，不保证每一类都已有完整 Mod 示例。新增这些类型时先复制同类型样例表头，再按本节规则补 Data/Text。

### 所有 Text CSV 通用规则
- `Id` 列关联同名 Data 表
- 本地化列后缀: 实际模板/Lib CSV 表头多为 `_en`, `_zh-Hant` (繁体中文), `_ja`；README 中写作 `_zh_hant`, `_jp`，以目标 CSV 表头为准
- `Note` 列不是所有 Text 表都有；例如 `Card` 有 `是否完成`/`Type`/`Note`，`Dialogue` 没有 `Note`，`Narration` 的 `Note` 位于后部，编写时以目标 Text CSV 表头为准
- 各表特有列: `Tips`(遗物/祝福剧情文本), `Series`(遗物系列), `Tag`(遗物标签), `Level`(敌人出现层数), `ShouldShow`(关键词显示), `Type`(部分文本表分类)

## ID 命名约定 (原版数据)

| 类型 | ID 格式 | 示例 |
|------|---------|------|
| Buff | 英文 snake_case | `timelock`, `bloodwall` |
| SpecialBuff | `Prefix:Name` | `Law:Judgment`, `Law:Death` |
| Card | 数字 | `1`, `*2` |
| Relic | 数字 | `1`, `*23` |
| Career | 数字 | `1`, `*3` |
| Enemy | 5 位数字 | `10001` |
| Achievement | 英文 snake_case | `tutorial_ameliya` |
| Destiny | 数字 | `1` |
| Event | 数字 / `*`前缀 | `*999`, `1` |

- `*` 前缀 = 模板/特殊条目/不进随机池
- 原版 CSV 使用 C# 语法 (`AddBuff()`, `Vars["key"]`)，Mod 必须改写为 Lua (`self:AddBuff()`, `self.Vars:set_Item()`)

## 原版脚本中的事件名

原版 CSV (C# 语法) 中常见的事件名：
`EndRound`, `StartRound`, `Hurt`, `Action`, `CostPower`, `FightStart`, `Dead`, `Shuffle`, `Win`, `AddEnemy`, `Attack`, `OnEnemyDead`, `OnDiceCheck`, `CreateCardItem`

## 描述占位符

- `{buff_xxx}`: 在描述文本中插入 buff 名称
- `{stack}`: 插入当前层数
- `{0}`, `{1}`: 运行时数值替换

## Text CSV 格式 (本地化)

每个 Data CSV 有对应的 Text CSV，文件名和 Id 列一一对应。标准 Text 列:

| 列 | 说明 |
|------|------|
| `Id` | 与对应 Data CSV 的 Id 一致 |
| `Note` | 备注 (通常为空) |
| `Name` / `Name_zh-Hant` / `Name_en` / `Name_ja` | 名称 (简中/繁中/英文/日文) |
| `Description` / `Description_zh-Hant` / `Description_en` / `Description_ja` | 描述 (四语言) |

### Buff Text 示例
```
Id: timelock
Name: 时之笼, Name_en: Timelock, Name_ja: 時の籠
Description: 层数等同于已储存的效果数...(层数为{stack}点)...
```
使用 `{stack}` 占位符表示层数，`{0}`/`{1}` 表示运行时参数。

### Relic Text (遗物文本)
额外的列: `Series` (系列名), `Tag` (标签), `Tips` (剧情描述, 四语言)
`Description` 为效果描述，`Tips` 为 flavor text。

### Career Text (职业文本)
额外的列: `Title` (称号, 四语言), `Action1`/`Action2` (主动技能描述), `Passive1`/`Passive2` (被动技能描述)
使用 XML 标签: `<name>技能名</name><des>效果描述</des><cd>CD:N</cd>`

### Event Text (事件文本)
额外的列: `TotalDescribe` (整体描述), `1Describe`~`4Describe` (每个选项的描述), `CompareUse` (属性比较描述)
使用 XML 标签:
- `<main>...</main>` — 主文本
- `<add>中！</add>` — 附加信息
- `<subtip>...</subtip>` — 子提示 (结果预览)
- `<tip=exclaim>...</tip>` — 惊叹提示
- `<good>...</good>`, `<bad>...</bad>`, `<Normal>...</Normal>` — 彩色标签 (绿/红/白)
- `<wis>`, `<str>`, `<lucky>`, `<per>` — 属性标签 (智慧/力量/幸运/感知)

### EnchTag Text
Id/Name 对应 Data 的 Id，不涉及额外描述或脚本。

**规则**
- Text CSV 的 `Id` 与对应 Data CSV 的局部 `Id` 保持一致，包括是否带 `*`。
- 运行时查询和脚本引用仍使用生成后的完整 ID；Text 配对不改变 ID 生成规则。
- 描述中的 `{stack}`、`{0}`、`{1}` 和 XML 标签由游戏 UI 解析，不要翻译或转义成普通文本。

**不要**
- 不要把 Text CSV 的本地化列名自行改成 README 中的另一套后缀；以目标 CSV 表头为准。
- 不要删除语言列，即使暂时只填写简体中文。

## 动画资源配置

动画资源目录 `ModResource/AnimationLib/` 下每个动画状态含 `config.json`:

```json
{
    "AnimationPerFrame": 0.1,
    "isLoop": true,
    "Direction": "Right"
}
```

| 字段 | 类型 | 说明 |
|------|------|------|
| `AnimationPerFrame` | float | 每帧时长 (秒) |
| `isLoop` | bool | 是否循环播放 |
| `Direction` | string | 动画方向 (`Right`) |

动画状态类型: `Idle`, `Attack`, `Skill`, `Hit` (来自 Entry.lua 中的 `ReplaceAnimationLib`)

**规则**
- 每个动画状态目录都需要自己的 `config.json`。
- 职业表或资源重定向中引用动画目录时，指向动画库根目录或具体状态目录要与目标字段语义一致。

**不要**
- 不要把动画配置路径和图片资源路径混用。
- 不要只放图片帧而缺少 `config.json`。

---
