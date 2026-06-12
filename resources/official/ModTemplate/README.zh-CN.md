# Mod 编写手册

[English](README.md) | 中文

## 1. 快速开始
- 复制 `ModTemplate`，重命名为你的 Mod 目录（目录名必须与 `ModName` 一致）。
- 修改 `ModConfig.json`：

  - `ModName`：模组名
  - `ModAuthor`：作者名
  - `ModVersion`：版本
  - `ModDescription`：描述
  - `IconPath`：图标路径（通常 `Icon.png`）
  - `Enabled`：是否启用
  - `Dependencies`（可选）：依赖列表，格式 `ModName.ModAuthor`

## 2. 目录约定
- `Scripts/Entry.lua`：入口脚本，加载时执行。
- `Data/`：新增的数值配置表。
- `Text/`：新增的文本配置表。
- `ModResource/`：资源文件（图片、动画等）。

## 3. 入口脚本专用方法
- 推荐入口：`function ModConfig:Setup() ... end`
- 你可以在 `Setup` 内进行三类操作：

  - 改表：`ModifyDataConfig` / `SetDataConfig`
  - 资源重定向：`RedirectSourcePath`
  - 合并表 `MergeDataConfig`
  - 方法 Hook：`AddMethodHookBefore` / `AddMethodHookAfter`

示例：
```lua
function ModConfig:Setup()
  self:ModifyDataConfig("career_3", "Name", "故障机器人")
  self:RedirectSourcePath("AnimationLib/支配魔女/Idle", "Mods/YourMod/ModResource/AnimationLib/Defect/Idle")
  self:AddMethodHookBefore("SettingUI.OnEnable", function(ctx)
    CS.UnityEngine.Debug.Log("[YourMod] SettingUI.OnEnable")
  end)
end
```

## 4. 可用 Lua API（self/ModConfig）
- `SetDataConfig(id, table)`：批量改一行（不会改 `Id` 字段）。
- `ModifyDataConfig(id, key, value)`：改单个字段。
- `RedirectSourcePath(originalPath, newPath)`：重定向资源路径。
- `AddDynamicMethod(methodName, fn)`：注册全局 Lua 方法。
- `AddMethodHookBefore(typeDotMethod, fn)`：前置 Hook。
- `AddMethodHookAfter(typeDotMethod, fn)`：后置 Hook。

## 5. Data/Text CSV 规则
- 表头（第 1 行）必须与主工程对应 CSV 一致。
- 注释（第 2 行）用于字段说明，建议保留。
- *Data*中是物体效果配置，*Text*中是文本及其本地化配置
- 带*Script*后缀的是脚本列，需要填写*lua*逻辑，self为ScriptExecutor类型。
- 带*_en*等后缀的是本地化列，目前游戏支持*_en,_zh_hant,_jp*


## 6. 物品编纂规则
- 游戏加载时，会读取根目录*Data*和*Text*下的表，并将同名表进行合并处理。
- 物品在游戏内的Id组成规则为：`ModName_FileName_Id`，因此，在Data和Text中无法进行覆盖操作，只能进行新增。
- 若Id带`*`，则不会进入游戏随机池中，否则将正常进入池子。
- 效果编纂教程规则令见-> [C#版效果编纂教程](https://www.cnblogs.com/DLSinnocence/articles/18948776)
- 注意，Mod只能识别lua脚本，需要将其中的C#语法改为Lua版本。如调用`AddBuff(buffId, level)`时改为`self:AddBuff(buffId, level)`
- 更多的Lua语法详见->[Lua教程](https://www.runoob.com/lua/lua-basic-syntax.html)
- 完整的游戏配置请见-> [网页版](https://dlsinnocence.github.io/gamewiki/) [本地版](Scripts/Lib/DataConfigs)
- 原版效果示例->Scripts/Lib/DataConfigs（是C#语言的，仅供参考，mod必须用lua编纂）
- 脚本里引用原版Id使用DataId.Id,引用ModId直接写字面量。
- 卡牌必须设定BaseScript是AttackCardItem还是CommonCardItem（是否选目标）。
- 卡牌的持续性效果需要写成Buff。

## 7. 常见问题

- Mod 未生效
  - 检查 `ModConfig.json` 的 `Enabled` 是否为 `true`，以及依赖是否正确。

- 无法设置字典
  - 字符串字典不能用[]访问，必须用dict:get_Item  dict:set_Item等，详情参考Xlua。

- 资源路径是什么？
  - Mod路径为Mods/<你的Mod名>/……
  - 原版路径请参考游戏配置表。

- Id为什么有的带星号有的没有？
  - 区别于是否进池子，有些绝对不会随机获得到的（如职业卡）要加星号。

- 如何添加有参事件
  - 战斗中的有参事件目前只提供了四个类型，HurtData,ActionData,NewEnemyData和DamageData，使用时用AddEvent_HurtData之类的调用。

- Script/Lib里的东西有什么用？
  - 里面包括了给*EmmyLua*插件用的TypeHint和原版所有配置的参考。

- 为什么方法Hook找不到方法？
  - 自检：是否加了CS前缀，实例方法是否加了self:，方法所在类是否实现有Modifiable接口。

## 8. Fight事件列表
- 需要在ScriptExecutor中添加监听。

| 事件名 | 注释 |
| --- | --- |
| `Attack` | 攻击事件 |
| `AddEnemy` | 添加敌人事件 |
| `AttackDone` | 攻击完成事件 |
| `CostPower` | 消耗能量事件 |
| `NoPower` | 能量不足事件 |
| `AddPower` | 增加能量事件 |
| `Dead` | 死亡事件 |
| `ToughCountZero` | 韧性归零事件 |
| `OnEnemyDead` | 敌人死亡事件 |
| `Resurrection` | 复活事件 |
| `EndRound` | 回合结束事件 |
| `ICreateCardItem` | 创建卡牌事件（触发 N 次） |
| `CreateCardItem` | 创建卡牌项事件 |
| `EndCreateCardItem` | 创建卡牌项结束事件 |
| `NoPowerWhenTry` | 尝试使用卡牌时能量不足事件 |
| `Action` | 行动事件 |
| `BurnCard` | 烧牌事件 |
| `Init` | 初始化事件 |
| `OnDiceCheck` | 骰子校验事件 |
| `OnDiceValue` | 骰子点数事件 |
| `Win` | 胜利事件 |
| `Escape` | 逃跑事件 |
| `StartRound` | 回合开始事件 |
| `Shuffle` | 洗牌事件 |
| `OnCameraMove` | 相机移动事件 |
| `FightStart` | 战斗开始事件 |
| `Hurt` | 受伤事件 |
| `Heal` | 治疗事件 |
| `SelectCardEnd` | 选卡结束事件 |
| `OnTriggerEffect` | 触发效果事件 |
| `ScriptExecute` | ScriptExecutor 执行方法 |

### 全局事件（非 Fight）

- 需要在EventCenter中添加监听

| 事件名 | 注释 |
| --- | --- |
| `UIOpen` | UI 打开事件（拼接方法：`UIOpen-Name`） |
| `UIHelp` | UI 帮助事件 |
| `UIClose` | UI 关闭事件 |
| `LanguageChange` | 语言切换事件 |
|…… | …… |

### 其他事件

例如**RoleTable**，其实现了**INotifyPropertyChanged**，需要找到事件进行监听。

## 9. 快速开始
1. 删掉*Data*和*Text*中的文件夹，只留下`Card`
2. 打开`Data`和`Text`下的表格，尝试参照ScriptExecutor类编写效果。

## 10. 发布 Mod

上传工具随游戏本体携带，默认位置为：

`D:\Witch's Apocalyptic Journey\Witch's Apocalyptic Journey_Data\StreamingAssets\Mod Upload Tool\WorkshopUploader.exe`

### 上传前检查

1. 确认 Mod 目录根部存在 `ModConfig.json`。
2. `ModConfig.json` 至少填写：
   - `ModName`：Mod 名称，建议与 Mod 文件夹名一致。
   - `ModAuthor`：作者名。
   - `ModVersion`：版本号。
   - `ModDescription`：创意工坊描述的默认来源，上传工具打开后仍可在界面中编辑。
   - `IconPath`：预览图路径，通常为 `Icon.png`。
   - `Enabled`：本地测试时设为 `true`。
3. 首次上传时可以不写 `PublishedFileId`；上传成功后工具会自动写回。
4. 可选填写 `WorkshopVisibility` 控制默认可见性，支持：
   - `Public`
   - `FriendsOnly`
   - `Private`
   - `Unlisted`

示例：

```json
{
  "ModName": "YourMod",
  "ModVersion": "1.0",
  "ModAuthor": "YOUR_NAME",
  "ModDescription": "Your workshop description",
  "IconPath": "Icon.png",
  "Enabled": true,
  "Dependencies": null,
  "WorkshopVisibility": "Private",
  "PublishedFileId": ""
}
```

### 启动上传工具

1. 启动 Steam 客户端，并登录要发布 Mod 的账号。
2. 打开游戏目录下的上传工具文件夹：

`D:\Witch's Apocalyptic Journey\Witch's Apocalyptic Journey_Data\StreamingAssets\Mod Upload Tool`

3. 运行 `WorkshopUploader.exe`。

### 工具内操作

1. 点击“选择 Mod 文件夹”，选择包含 `ModConfig.json` 的 Mod 根目录。
2. 点击“重新读取 ModConfig”或等待工具读取配置。
3. 填写“标题”。注意：标题需要手动填写，不会自动使用 `ModName`。
4. 检查“描述”“预览图”“可见性”。
5. 如果是更新已发布条目，保留 `PublishedFileId`；如果要新建条目，清空 `PublishedFileId`。
6. 可选填写“更新说明”，用于 Steam 更新日志。
7. 点击“上传到创意工坊”。

### 上传结果

- 首次上传成功后，工具会把 Steam 返回的 `PublishedFileId` 写回 `ModConfig.json`。
- 后续上传同一个 Mod 时，工具会用 `PublishedFileId` 更新原创意工坊条目。
- 如果 `PublishedFileId` 不属于当前游戏或当前 Steam 用户，工具会清空 ID 并按新条目上传。
- 上传内容会临时复制到系统临时目录；`.meta` 文件和 `Scripts/Lib/DataConfigs` 不会上传。
- 如果工具提示需要接受 Steam 创意工坊法律协议，请到 Steam 对应页面确认一次后再检查条目状态。

更多请参见本例子，尝试编写你的第一个Mod吧！
