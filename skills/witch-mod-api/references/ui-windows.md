# UI Windows

Window/UI 类型索引：类作用、公开方法、EventCenter 触发、Mod 相关点。

---

### AchievementBase.cs (99 lines)
- **类**: `AchievementBase` — 成就基类
- **AchievementInfo struct** (7 字段): id, name, description, tip, level, reward, status
- **方法**: `SetStatus(string status)`

### AchievementCatalog.cs (593 lines)
- **类**: `AchievementCatalog` — 静态成就目录
- **方法**: `Get(string id)`, `NormalizeId(string rawId)`
- **Definition**: Id, Category, Level, Reward, Target — 成就模板定义

### AchievementRuntimeService.cs (3110 lines)
- **类**: `AchievementRuntimeService` — 成就运行时服务（成就解锁逻辑）
- **关键方法**: `RecordRunClearedForCurrentMode()`, `RecordPlayerResurrected()`, `RecordPlayerDamaged(StatusManager, fromDataId)`, `CompleteAchievement(id)`, `UpdateProgress(id, progress)`
- `RecordBranchChosen()`, `RecordPrebattleSetup()`, `RecordCardRewardSkipped()` 等

### AchievementTable.cs (436 lines)
- **类**: `AchievementTable` — 成就数据表
- **静态**: `IsAchievementRow(IReadOnlyDictionary line)`
- **数据**: `table: Dictionary<string, List<AchievementBase>>`, `ItemDic: Dictionary<string, HashSet<string>>`

### AchievementUI.cs (215 lines)
- **类**: `AchievementUI : UIBase` — 成就界面
- **方法**: `OnEnable()`, `DataUpdate()`

### AchItem.cs (246 lines)
- **类**: `AchItem : ItemNonDrag` — 成就列表项
- **方法**: `Init(DataConfig)`, `GetReward()` — 领取奖励, `DataUpdate()`
- **字段**: `RewardType: string`

---

### AcknowledgmentsUI.cs (3597 lines)
- **类**: `AcknowledgmentsUI : UIBase, IScrollHandler, IPointerClickHandler, IBeginDragHandler, IDragHandler, IEndDragHandler`
- **功能**: 致谢/众筹名单滚动 UI (虚拟滚动)
- **关键字段**: `crowdListPath="Text/test"`, `autoScrollSpeed=0.08f`, `manualScrollPauseSeconds=2f`
- **内部类**: `CrowdLevel`, `VirtualSection`, `PooledItem`, `CrowdGroup`, `CrowdEntry`
- 纯展示，无 Mod 相关回调

### AffectionUI.cs (200 lines)
- **类**: `AffectionUI : UIBase` — 好感度 UI
- **方法**: `OnEnable()`, `AddReward(DataConfig)`, `ShowNowLevel()`
- **字段**: `firstShow = true`

### AnnouncementUI.cs (530 lines)
- **类**: `AnnouncementUI : UIBase` — 公告 UI
- **方法**: `Awake()`, `ShowAnnouncement()`, `DataUpdate()`, `HasUnreadAnnouncement()` (静态), `OpenDoct()`, `OpenChoice()`, `ShowWin(Dictionary)`

### BackpackUI.cs (228 lines)
- **类**: `BackpackUI : UIBase` — 背包 UI
- **方法**: `ShowStatus(StatusUIData)`, `DataUpdate()`, `Init()`, `OnEnable()`, `OnDestroy()`

### BattleRewardsUI.cs (751 lines)
- **类**: `BattleRewardsUI : UIBase` — 战斗奖励 UI
- **方法**: `DataUpdate()`, `ModeSetReward()`, `SetMoney(int)`, `RandomSetRelic(List)`, `RandomSetCard()`, `RandomAddBless()`, `GenerBlessing()`, `AnimationPlay(GameObject)`
- **字段**: `RelicRewardList: List<DataConfig>`, `CardCount: int`

### BlessingChoiceGenerator.cs (532 lines)
- **类**: `BlessingChoiceGenerator` — 祝福选择生成器
- **方法**: `RewardGenerator(List blessings)` — 按权重生成祝福选项, `CreateBlessUI(Transform, Action)`
- **字段**: `choices: List<Tuple<List<DataConfig>, List<DataConfig>>>` — 选项对

### BlessItem.cs (131 lines)
- **类**: `BlessItem : DictionaryItem` — 祝福图标项
- **方法**: `Init(DataConfig)`, `OnPointerClick(PointerEventData)`, `BindDictionaryDescription(Transform)`

### BreaksUI.cs (456 lines)
- **类**: `BreaksUI : MonoBehaviour` — 休息界面
- **方法**: `CreateRole(ValueTuple[])`, `ShowWarehouse()`, `RelicBackPoint()`, `ReturnHome()`, `CreateFoodItem()`
- **EventTrigger**: `"BreaksUIOpen"` — 在初始化时触发
- 不是 UIBase，直接继承 MonoBehaviour

### BuffBarUI.cs (792 lines)
- **类**: `BuffBarUI : UIBase` — Buff 状态栏
- **方法**: `CreateNewBuff(buffId, level)`, `FindBuff(buffId)`, `MarkStatusDisplayDirty()`, `UpdateAllBuff()`, `PureAllBuff()`, `ClearAllBuff()`
- **EventTrigger**: `buffItemConfig.BuffId + "OnLevelChange" + status.InstanceId` — Buff 层数变化动态事件
- **字段**: `BuffDic: Dictionary<string, BuffItem>`, `isDirty: bool`

### BuffShowItem.cs (50 lines)
- **类**: `BuffShowItem : ItemNonDrag` — Buff 展示项
- **方法**: `Init(DataConfig)`

---

### ButtonUse.cs (192 lines)
- **类**: `ButtonUse : MonoBehaviour` — 宿舍 UI 按钮
- **方法**: `ButtonUseSc()`, `DataUpdate()`
- **AddEventListener**: `LanguageChange` — 语言切换时刷新数据
- **字段**: `dictionaryUI`, `ItemType="WindowsButton"`, `Add=""`, `belongs=""`

### CaptionStyle.cs (18 lines)
- **枚举**: `CaptionStyle` — 字幕样式 (Center等)

### CaptionUI.cs (231 lines)
- **类**: `CaptionUI : UIBase` — 字幕显示
- **方法**: `ShowCaption(text, style=Center, animationTime=1f, delay=0f, animationType=0)`

### CardChoiceItem.cs (561 lines)
- **类**: `CardChoiceItem : MonoBehaviour` — 卡牌选择项
- **方法**: `Initialize(CardChoiceUI, fromId)`, `FadeIn/FadeOut(delay)`, `DataUpdate()`, `MoveToDeck()`

### CardChoiceUI.cs (353 lines)
- **类**: `CardChoiceUI : UIBase` — 卡牌选择界面
- **方法**: `DataUpdate()`, `Select(GameObject, DataConfig)` — 选卡回调, `Close()`

### CardEditorUI.cs (1553 lines)
- **类**: `CardEditorUI : UIBase` — **卡牌编辑器** (大图书馆自定义卡牌)
- **方法**: `UpdateTotal()`, `DataUpdate()`, `UpdateSprite()`, `Close()`, `OnEnable()`, `UpdateBuff()`, `InitTime()`, `ButtonUse()`, `CreateTimeItem()`, `RefreshTimeItems()`
- **字段**: `cost`, `total`, `MethodCount: Dictionary<string,int>`, `IndexSprite: static Dictionary`, `thisRatity`, `collection: List<Dictionary>`, `buttons: List<FloatingWindow.button>`

### CardEffectBuff.cs (112 lines)
- **类**: `CardEffectBuff : MonoBehaviour` — 卡牌效果 buff 选择
- **方法**: `SetData()`
- **静态字段**: `NowItem: static CardEffectItem`
- **字段**: `data: Dictionary<string,string>`

### CardEffectItem.cs (1319 lines)
- **类**: `CardEffectItem : MonoBehaviour` — 卡牌效果编辑项
- **方法**: `RefreshEditorDescriptions(editorUI)` (静态), `IsBuff()`, `CalculateCost()`, `CreateDescription()`, `CreateTimeDes()`, `UpdateAll()`, `ShowChangeBuff()`, `HideBuffList()`, `ChangeBuff(buffName)`
- **字段**: `effectName, effectDes, isBuff, sourceName, methodName, effectCost, costMultiplier=1f, vars: Dictionary`

### CardEnchUI.cs (343 lines)
- **类**: `CardEnchUI : ShopUI` — 卡牌附魔界面（继承 ShopUI）
- **方法**: `DataUpdate()`, `SetShopItems()`, `UpdateEnchShow()`, `ShowCardToEnch(ShopItem)`
- **AddEventListener**: `SelectCardEnd` — 选卡后附魔
- **字段**: `cardList: List<IDataConfig>`

### CardPackItem.cs (162 lines)
- **类**: `CardPackItem : MonoBehaviour, IPointerClickHandler` — 卡包选项
- **方法**: `Init(DataConfig)`, `OnPointerClick()`, `PackCheck()`
- **字段**: `BasicChick: bool`

### CardPackUI.cs (483 lines)
- **类**: `CardPackUI : UIBase` — 卡包管理界面
- **方法**: `DataUpdate()`, `Init()`, `SetPackEnabled(id, isEnabled)` — 启用/禁用卡包, `ShowInfo(CardPackItem)`
- **字段**: `TotalCardPack: List`, `CardCount/RelicCount/BlessCount/EnchCount: int`

### CareerData.cs (30 lines)
- **结构体**: `CareerData { instanceId: string, career: DataConfig, San: int, MaxSan: int }`

### ChangeFloatWindow.cs (73 lines)
- **类**: `ChangeFloatWindow : MonoBehaviour, IPointerClickHandler` — 浮动窗口切换

### ChatUI.cs (416 lines)
- **类**: `ChatUI : UIBase` — 聊天 UI
- **方法**: `SendChatMessage(text)`, `AddMessage(text)`
- **静态字段**: `Instance: static ChatUI`
- **字段**: `isOpen: bool`

### CurtainTurnUI.cs (188 lines)
- **类**: `CurtainTurnUI : UIBase` — 幕布切换 UI
- **方法**: `Play(Action)` — 播放动画后回调

---

### DeckUI.cs (326 lines) — DeckUI : UIBase
- **方法**: `OnEnable()`, `CreateDeckMenu()`, `CreateUsedDeckMenu()`, `CreateDeckMenuForSelect(count, DataConfigList, SourceList)`, `OnDisable()`
- **EventTrigger**: `"SelectCardEnd"` — 选卡完成
- **字段**: `DataConfigList: List<IDataConfig>`, `count: int`

### DesItem.cs (49 lines) — DesItem : ItemNonDrag
- **方法**: `OnPointerClick()`
- **字段**: `Claimed: bool`

### DestinyTreeUI.cs (344 lines) — DestinyTreeUI : ShopUI
- **方法**: `DataUpdate()`, `Divination()` — 占卜, `GenerateBless()`, `SetShopItems()`
- **字段**: `Cost: int`, `InitCost = 70`

### DialogueUI.cs (2101 lines) — DialogueUI : UIBase
- **方法**: `ShouldAutoChooseSingleChoice()` (static), `Awake()`, `ShowDialogue(DataConfig)`, `SetDialogueBoxVisible(bool)`, `DoMoveX/Y/Scale/FadeIn/FadeOut`, `ShowChoice()`, `GetText(DataConfig)`, `EndDialogue()`, `ShowHistory()`
- **内部类**: `RoleSlot`
- **字段**: `RoleData: Dictionary`, `RoleId`, `IsSpeaker: bool`, `hideNameplate: bool`

### DialogueVisualResolver.cs (193 lines) — static class
- **方法**: `ResolveRoleImagePath(roleData, overrideValue)`, `GetDefaultY(roleData)`, `GetDefaultScale(roleData)`, `ParseFloat(value, fallback)`

### DictBuffItem.cs (117 lines) — DictBuffItem : DictionaryItem
- **方法**: `DataUpdate()`, `Init(DataConfig)`, `SetName()`

### DictEnchItem.cs (141 lines) — DictEnchItem : DictionaryItem
- **方法**: `DataUpdate()`, `Init(DataConfig)`, `OnPointerClick()`, `SetName()`

### DictionaryItem.cs (573 lines) — DictionaryItem : ItemNonDrag
- **方法**: `Init(DataConfig)`, `Awake()`, `DataUpdate()`, `OnPointerClick/Enter(PointerEventData)`
- **字段**: `dictionaryUI`

### DictionaryShowItem.cs (195 lines) — DictionaryShowItem : ItemNonDrag
- **方法**: `InitEnch(DataConfig)`, `Init(DataConfig)`, `DataUpdate()`, `OnPointerEnter()`, `ShowFloatingWindow()`, `OnPointerClick()`
- **字段**: `dictionaryUI`, `defaultCount: int`

### DictionaryUI.cs (1843 lines) — DictionaryUI : UIBase (大图书馆)
- **方法**: `DataUpdate()`, `RegisterEvent()`, `Retrieve()`, `ReturnList()`, `LastCommand()`, `NextCommand()`, `Selected()`, `ReleaseCardItem()`, `PreLoad()` (async), `ResetPage()`, `Init()`, `Close()`, `SortingByType(type)`, `SelectCardByPage()`, `RefreshPageDisplay()`, `TotalCreateItem()`, `ShowInfo()`, `CloseInfo()`, `CreateCardTag()`, `ResetTag()`
- **字段**: `nowIndex, page: int`, `ChooseTags: Dictionary`, `CardItems/BlessItems/RelicItems/EnemyItems/BuffItems/EnchItems: List<DictionaryItem>`

### DictItem.cs (221 lines) — DictItem : DictionaryItem, IPointerEnterHandler
- **方法**: `Init(DataConfig)`, `OnPointerEnter()`, `SetCardMsg(Transform)`, `DataUpdate()`

### DictTagItem.cs (343 lines) — DictTagItem : MonoBehaviour, IPointerClickHandler
- **方法**: `Init(name/tag, dictionaryUI)`, `OnPointerClick()`, `ReturnNormal()`, `DataUpdate()`
- **字段**: `TagType: string`, `tagName: string`

### DisplayCard.cs (432 lines) — DisplayCard : CardItem, IPointerClickHandler
- **方法**: `OnHover()`, `OnExit()`, `OnPointerClick()`, `OnSelect()`, `OnUnSelect()` — 展示卡牌交互
- **AddEventListener**: `LanguageChange` — 语言切换刷新
- **字段**: `isSelect: bool`

### EmojiPanelUI.cs (254 lines) — EmojiPanelUI : UIBase
- **方法**: `CreateEmoji()`, `Start()`, `ShowEmoji(GifAsset/UIAnimation)`

### EnchCardItem.cs (175 lines) — EnchCardItem : ItemNonDrag
- **方法**: `OnPointerClick()`, `ShowFloatingWindow()`, `Init(DataConfig)`, `Unload()` — 卸下附魔

### EnemyItem.cs (308 lines) — EnemyItem : DictionaryItem
- **方法**: `DataUpdate()`, `Init(DataConfig)`, `SetName()`
- **静态字段**: `MapName: static Dictionary<string,string>` — 敌人名称映射

---

### EventUI.cs (2062 lines) — EventUI : UIBase
- **方法**: `FadeIn()`, `Init(string id)`, `ContinueEvent(string id)` — 子事件跳转, `Entry()` — 退出入口, `TryChangeMap()`, `AnnounceEventDone()`, `LockChoice(string index)`, `EndEvent()`, `ChangeSubtip(string subtip)`, `DataUpdate()`, `RegisterEvent()`, `ClearEvent()`
- **AddEventListener**: `LanguageChange`

### FightUI.cs (6591 lines) — FightUI : UIBase (战斗主界面)
- **关键方法**: `EnqueueDamageText(text, pos, popUpType, status, to, realDamage)` — 伤害冒字, `SetTurn(obj, index, count)`, `ShowChest()`, `AutoUseCard()`, `ShowTitle()`, `Init()`, `CreateCardItem(Count/DataConfig)`, `UpdateCardItemPos()`, `ShuffleCardItems()`, `RemoveAllCards()`, `ThrowCardScript()`, `Burning()`, `SelectCardToAction()`, `BurnCard(cardItem)`, `SelectInit()`, `ShowBattleReward()`, `CanWin()`, `EndInstance()`, `CallActionAnimation()`, `DoCardUseAnimation()`
- **EventTrigger**: `EndRound`, `ICreateCardItem`, `CreateCardItem`, `EndCreateCardItem`
- **内部类**: `DamageTextInfo`, `AnimationData`

### GameEntryUI.cs (3103 lines) — GameEntryUI : UIBase (主菜单)
- **方法**: `UICLOSE()`, `Init()`, `CloseAllWindows()`, `DataUpdate()`, `Outlobby()`, `ReturnHouse()`, `Close()`, `ChangeReady(bool)`, `SetReady(ready, playerId)`, `StartGame()`, `NormalGame()`
- **字段**: `isHost: bool`

### GameExitUI.cs (1090 lines) — GameExitUI : UIBase (结算界面)
- **方法**: `NextShow()`, `ReturnAsync()`
- **静态字段**: `loss: static bool`
- **字段**: `TrueCount: int`, `Exp: int`

### HardItem.cs (344 lines) — HardItem : MonoBehaviour, IPointerClickHandler (难度词缀项)
- **方法**: `Init(hardData)`, `AddSc()`, `RemoveSc()`, `ChangeShow()`, `OnPointerClick/Enter/Exit`

### HouseButton.cs (18 lines) — HouseButton : MonoBehaviour
- **字段**: `BaseStr = ""`

### HouseManager.cs (1781 lines) — HouseManager : MonoBehaviour (宿舍管理器)
- **方法**: `ChangeNight()`, `ChangeUIShow()`, `AnnCheck()`, `Openwindow()`, `OpenLibrary()`, `OpenTower()`, `OpenExhibition()`, `OpenStore()`, `OpenAdministration()`, `OpenSpring()`, `OpenWitchHouse()`, `CloseBook()`, `DataUpdate()`, `ShadowChat()`, `StartShop()`, `OnClickCardEditor()`, `OpenStorehouse()`, `OpenDictionary()`, `OnClickMod()`, `StartGame()`, `ClickItem(HouseItemType)`, `ReturnMain()`, `ShowTask()`, `OpenSetting()`, `OpenAnnouncement()`
- **AddEventListener**: `LanguageChange`, `HouseDialoguePendingNewStateChanged`
- **EventTrigger**: `HouseUIOpen`, `FirstTalk` (if tutorial not done)

### HouseUI.cs (638 lines) — HouseUI : MonoBehaviour
- **方法**: `ShadowChat()`, `StartShop()`, `OnClickCardEditor()`, `OpenStorehouse()`, `OpenDictionary()`, `OnClickMod()`, `ReturnMenu()`, `ClickItem(HouseItemType)`, `OpenAnnouncement()`
- **EventTrigger**: `HouseUIOpen`, `FirstTalk`

### IllustratedBookUI.cs (239 lines) — IllustratedBookUI : UIBase
- **字段**: `page: string`

### InkTurnUI.cs (577 lines) — InkTurnUI : UIBase (转场效果)
- **方法**: `Play()`, `Play(Action firstUI, Action secondUI)`, `FastPlay(Action, Action)`
- **字段**: `textures: List<Texture2D>`

---

### Item.cs (1198 lines) — Item : MonoBehaviour (卡牌/物品基类)
- **字段**: `itemName, itemDescription, itemTip, rareLevel, itemId, Rarity, ifEquipped, color, ItemType="Item", itemPrice, canClick=true, isHover, isDrag`

### ItemNonDrag.cs (335 lines) — ItemNonDrag : Item (不可拖拽物品)

### ItemShowUI.cs (87 lines) — ItemShowUI : UIBase
- **方法**: `ShowItem(DataConfig)`, `ShowItem(Sprite, title, description)`

### LanguageUseUI.cs (206 lines) — LanguageUseUI : UIBase
- **方法**: `ReturnMain()`, `ChangeChinese()`, `ChangeJa()`, `ChangeEn()` — 语言切换

### LineUI.cs (491 lines) — LineUI : UIBase (攻击线/贝塞尔曲线)
- **方法**: `SetStartPos(Vector3)`, `SetEndPos(Vector2?)`, `FadeIn()`, `FadeOut(callback)`
- **字段**: `arcLengthSamples = 50`

### LoadingUI.cs (134 lines) — LoadingUI : UIBase
- **方法**: `Close()`

### MainMenuUI.cs (410 lines) — MainMenuUI : UIBase
- **方法**: `DataUpdate()`, `StartGame()`, `CloseTheGame()`, `ShowAck()`, `OpenWebsite(url)`, `OpenSettings()`, `OnClickMod()`

### MapSelectUI.cs (2969 lines) — MapSelectUI : UIBase (地图选择)
- **方法**: `ClearPersistedDrawLayer()` (static), `FadeIn()`, `DataUpdate()`, `ResetBackCard()`, `TryContinue()`, `ShowMap()`, `SetNodes()`, 绘图相关: `HandleDrawPointerDown/Drag/Up`, 网络绘图: `ReceiveNetworkDrawBegin/Point/End/Erase/ClearAll`
- **字段**: `IsAnimating: bool`, `StrokeId`, `AuthorId`

### ModeChoiceUI.cs (930 lines) — ModeChoiceUI : UIBase (模式选择)
- **方法**: `DataUpdate()`, `Init(startTutorialWhenFirstPlay=true)`, `CreateNewSave(modeType="Normal")`, `TeachMode(needDelete=false)`, `NormalMode()`, `SlotMode()`, `SublimationMode()`, `ShowUnDone()`, `ReturnGame(modeType)`

### ModManagerUI.cs (1578 lines) — ModManagerUI : UIBase (Mod 管理器)
- **方法**: `DataUpdate()`, `RefreshFromUI()`, `ToggleLocalMod(info, bool?)`, `RefreshLocalModList()`, `MarkRequiresRestart()`, `InitDes(ModItem)`, `TryRefreshDescriptionImage(ModItem)`
- **字段**: `HasChangeMod: bool`

### OptionsUI.cs (217 lines) — OptionsUI : UIBase
- **方法**: `FadeIn()`, `AddOption(text, Action)`, `Close()`

### OutDeckUI.cs (422 lines) — OutDeckUI : UIBase (牌组编辑)
- **方法**: `SetRole(OutDeckUIData)`, `DataUpdate()`, `ShowMsg()`, `ChangeCardShow()`, `CreateItem(cardData, ifequipped)`
- **EventTrigger**: `OutDeckUITutorial` (2次)

### OutDeckUIData.cs (39 lines)
- **字段**: `Id: string`, `CardBottomCount/CardTopCount/MaxAlCardCount: int`

---

### OutSideItem.cs (79 lines) — OutSideItem : ItemNonDrag

### OutsiderShopUI.cs (1030 lines) — OutsiderShopUI : ShopUI (泉水商店)
- 继承 ShopUI, `DataUpdate()`

### OutsideShopItem.cs (415 lines) — OutsideShopItem : ItemNonDrag

### PackShowItem.cs (114 lines) — PackShowItem : ItemNonDrag

### PageItem.cs (95 lines) — PageItem : MonoBehaviour, IPointerClickHandler

### PopUpTextUI.cs (442 lines) — PopUpTextUI : MonoBehaviour (浮动伤害/治疗文字)

### RelicItemConfig.cs (538 lines) — RelicItemConfig : Item (遗物物品)

### ResultItem.cs (201 lines) — ResultItem : ItemNonDrag

### ResultUI.cs (99 lines) — ResultUI : UIBase

### SafeBoxItem.cs (568 lines) — SafeBoxItem : Item (保险箱物品)

### SafeBoxUI.cs (1519 lines) — SafeBoxUI : UIBase (保险箱 UI)
- **静态方法**: `SafeboxSave()`, `ClearList()`, `ResetCount()`

### SceneItem.cs (290 lines) — SceneItem : MonoBehaviour, IPointerClickHandler (宿舍场景物品)

### SceneTurnUI.cs (168 lines) — SceneTurnUI : UIBase

### SelectHardUI.cs (777 lines) — SelectHardUI : UIBase (难度选择)
- **静态字段**: `UseSc: static List<HardTagEntry>`, `AddReward: static int = 0`

### SellItem.cs (511 lines) — SellItem : Item (出售物品)

### SettingUI.cs (2747 lines) — SettingUI : UIBase (设置界面)
- 大文件，包含 Save/Apply/ResetButton/CloseTheGame/ReturnMain/SendFeedback

### ShopItem.cs (624 lines) — ShopItem : ItemNonDrag (商店物品)

### ShopUI.cs (832 lines) — ShopUI : UIBase (商店基类)
- `CreateSellCard()`, `UpdateSellRelic()`, `Flushed()`, `ChangeFlushShow()`, `OnRoleTableChanged()`

### ShowCard.cs (1110 lines) — ShowCard : Item (展示卡牌)

### ShowCareer.cs (149 lines) — ShowCareer : ItemNonDrag

### ShowVarItem.cs (166 lines) — ShowVarItem : MonoBehaviour, IPointerClickHandler

### SlotMachHand.cs (2450 lines) — SlotMachHand : MonoBehaviour (老虎机动画手)

### SlotMachUI.cs (6031 lines) — SlotMachUI : MapSelectUI (老虎机/混沌乐园模式)

### SlotRod.cs (50 lines) — SlotRod : MonoBehaviour, IPointerClickHandler

### SlotSettlementUI.cs (774 lines) — SlotSettlementUI : UIBase

### StatusBarUI.cs (508 lines) — StatusBarUI : MonoBehaviour (状态条)
- **静态方法**: `GetDisplayName(StatusManager status)`

### StatusUI.cs (714 lines) — StatusUI : MonoBehaviour

### StorehouseItem.cs (133 lines) — StorehouseItem : ItemNonDrag

### StorehouseUI.cs (312 lines) — StorehouseUI : UIBase

### TitleUI.cs (94 lines) — TitleUI : UIBase

### TopBarUI.cs (1813 lines) — TopBarUI : UIBase (顶部状态栏)

### TutorialSpotlightUI.cs (2986 lines) — TutorialSpotlightUI (教程聚焦 UI)
- **静态方法**: `ClearCompletedSpotlightTutorials()`

### TutorialUI.cs (302 lines) — TutorialUI : UIBase

### WarehouseItem.cs (400 lines) — WarehouseItem : Item

### WarehouseUI.cs (750 lines) — WarehouseUI : UIBase
- **静态方法**: `ResetCount()`

---

## 总结

共 **119 个 Window UI 文件**，已全部遍历。

**UI 层级关系:**
- `UIBase` — 所有 UI 的基类 (FadeIn/Close/DataUpdate/RegisterEvent)
- `Item` — 物品基类 (可拖拽)
- `ItemNonDrag : Item` — 不可拖拽物品
- `ShopUI : UIBase` — 商店基类

**发现的重要 EventTrigger:**
- `FightUI` → EndRound, ICreateCardItem, CreateCardItem, EndCreateCardItem
- `DeckUI` → SelectCardEnd
- `BreaksUI` → BreaksUIOpen
- `HouseUI/HouseManager` → HouseUIOpen, FirstTalk
- `OutDeckUI` → OutDeckUITutorial
- `BuffBarUI` → buffIdOnLevelChange (动态)

**全局/UI 事件补充:**
- `StartTutorial` — `GameApp` 触发，开始教程
- `PerWin` — 每场战斗胜利
- `RelicAdd` — `RoleTable` 遗物添加时触发
- `ResolutionChanged` — 分辨率变化，带参数
- `HouseDialoguePendingNewStateChanged` — 宿舍对话状态更新
- `OutDeckTutorial` / `OutDeckUITutorial` — 牌组教程相关
- `LanguageChange` — 多个 UI 监听后刷新本地化文本

**动态事件命名:**
- `UIOpen-<name>` — UIManager 打开具体 UI 时触发，`<name>` 来自 `gameObject.name`
- `UIClose-<name>` — UI 关闭时触发
- `UIHelp-<name>` — UI 帮助相关事件
- `<buffId>OnLevelChange<instanceId>` — Buff 层数变化事件，例如 BuffBarUI 按 `buffConfig.BuffId + "OnLevelChange" + status.InstanceId` 触发
- `Winlevel_<id>` — 特定关卡胜利事件

**Mod 开发直接相关:**
- `CardEditorUI` — 大图书馆卡牌编辑器
- `ModManagerUI` — Mod 管理器 UI
- `ShopUI/OutsiderShopUI` — 商店系统
- `SafeBoxUI` — 保险箱
- `SelectHardUI` — 难度词缀选择
