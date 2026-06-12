---@meta

---@class Witch.UI.Automation.RuntimeUiContext : System.Object
---@field UIManager Witch.UI.UIManager
---@field MainCanvas UnityEngine.Canvas
---@field UpperCanvas UnityEngine.Canvas
---@field EventSystem UnityEngine.EventSystems.EventSystem
Witch.UI.Automation.RuntimeUiContext = {}
---@alias CS.Witch.UI.Automation.RuntimeUiContext Witch.UI.Automation.RuntimeUiContext
CS.Witch.UI.Automation.RuntimeUiContext = Witch.UI.Automation.RuntimeUiContext

---@param uiManager Witch.UI.UIManager
---@param mainCanvas UnityEngine.Canvas
---@param upperCanvas UnityEngine.Canvas
---@param eventSystem UnityEngine.EventSystems.EventSystem
---@return Witch.UI.Automation.RuntimeUiContext
function Witch.UI.Automation.RuntimeUiContext.New(uiManager, mainCanvas, upperCanvas, eventSystem) end

---@class Witch.UI.Window.DisplayCard : CardItem
---@field CurrentScale number
---@field NormalScale number
---@field isSelect boolean
---@field onClick UnityEngine.Events.UnityEvent
Witch.UI.Window.DisplayCard = {}
---@alias CS.Witch.UI.Window.DisplayCard Witch.UI.Window.DisplayCard
CS.Witch.UI.Window.DisplayCard = Witch.UI.Window.DisplayCard

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnPointerEnter(eventData) end
---@param dataConfig DataConfig
function Witch.UI.Window.DisplayCard:Init(dataConfig) end
function Witch.UI.Window.DisplayCard:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnPointerExit(eventData) end
function Witch.UI.Window.DisplayCard:OnHover() end
function Witch.UI.Window.DisplayCard:OnExit() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DisplayCard:OnPointerClick(eventData) end
function Witch.UI.Window.DisplayCard:OnSelect() end
function Witch.UI.Window.DisplayCard:OnUnSelect() end

---@class Witch.UI.Window.BattleRewardsUI : Witch.UI.UIBase
---@field itemList UnityEngine.Transform
---@field RelicRewardList System.Collections.Generic.List
---@field cardIcon UnityEngine.Sprite
---@field moneyIcon UnityEngine.Sprite
---@field blessIcon UnityEngine.Sprite
---@field relicIcon UnityEngine.Sprite
---@field CardCount number
---@field item1 UnityEngine.GameObject
Witch.UI.Window.BattleRewardsUI = {}
---@alias CS.Witch.UI.Window.BattleRewardsUI Witch.UI.Window.BattleRewardsUI
CS.Witch.UI.Window.BattleRewardsUI = Witch.UI.Window.BattleRewardsUI

function Witch.UI.Window.BattleRewardsUI:DataUpdate() end
function Witch.UI.Window.BattleRewardsUI:ModeSetReward() end
---@param count number
function Witch.UI.Window.BattleRewardsUI:SetMoney(count) end
function Witch.UI.Window.BattleRewardsUI:OnDestroy() end
---@param lists System.Collections.Generic.List
function Witch.UI.Window.BattleRewardsUI:RandomSetRelic(lists) end
function Witch.UI.Window.BattleRewardsUI:RandomSetCard() end
function Witch.UI.Window.BattleRewardsUI:RandomAddBless() end
function Witch.UI.Window.BattleRewardsUI:GenerBlessing() end
---@param obj UnityEngine.GameObject
function Witch.UI.Window.BattleRewardsUI:AnimationPlay(obj) end

---@class Witch.UI.Window.HouseButton : UnityEngine.MonoBehaviour
---@field BaseStr string
Witch.UI.Window.HouseButton = {}
---@alias CS.Witch.UI.Window.HouseButton Witch.UI.Window.HouseButton
CS.Witch.UI.Window.HouseButton = Witch.UI.Window.HouseButton


---@class Witch.UI.Window.HouseManager : UnityEngine.MonoBehaviour
---@field _progressRect UnityEngine.RectTransform
---@field levelText TMPro.TMP_Text
---@field coinText TMPro.TMP_Text
---@field TimeText TMPro.TMP_Text
---@field TruthText TMPro.TMP_Text
---@field PlayerIcon UnityEngine.UI.Image
---@field WindowButtonParent UnityEngine.Transform
---@field WindowManagerItem Michsky.MUIP.WindowManager
---@field WindowItemParent UnityEngine.Transform
---@field storehouseUI Witch.UI.Window.StorehouseUI
Witch.UI.Window.HouseManager = {}
---@alias CS.Witch.UI.Window.HouseManager Witch.UI.Window.HouseManager
CS.Witch.UI.Window.HouseManager = Witch.UI.Window.HouseManager

function Witch.UI.Window.HouseManager:ChangeNight() end
function Witch.UI.Window.HouseManager:ChangeUIShow() end
function Witch.UI.Window.HouseManager:Openwindow() end
function Witch.UI.Window.HouseManager:OpenLibrary() end
function Witch.UI.Window.HouseManager:OpenTower() end
function Witch.UI.Window.HouseManager:OpenExhibition() end
function Witch.UI.Window.HouseManager:OpenStore() end
function Witch.UI.Window.HouseManager:OpenAdministration() end
function Witch.UI.Window.HouseManager:OpenSpring() end
function Witch.UI.Window.HouseManager:OpenWitchHouse() end
function Witch.UI.Window.HouseManager:CloseBook() end
function Witch.UI.Window.HouseManager:DataUpdate() end
function Witch.UI.Window.HouseManager:ShadowChat() end
function Witch.UI.Window.HouseManager:StartShop() end
function Witch.UI.Window.HouseManager:OnClickCardEditor() end
function Witch.UI.Window.HouseManager:OpenStorehouse() end
function Witch.UI.Window.HouseManager:OpenDictionary() end
function Witch.UI.Window.HouseManager:OnClickMod() end
function Witch.UI.Window.HouseManager:StartGame() end
---@overload fun(self: Witch.UI.Window.HouseManager, houseItemType: HouseItem.HouseItemType)
---@param houseItemType Witch.UI.Window.SceneItem.SceneItemType
function Witch.UI.Window.HouseManager:ClickItem(houseItemType) end
function Witch.UI.Window.HouseManager:ReturnMain() end
function Witch.UI.Window.HouseManager:ShowTask() end
function Witch.UI.Window.HouseManager:OpenSetting() end
function Witch.UI.Window.HouseManager:OpenAnnouncement() end

---@class Witch.UI.Window.SceneItem : UnityEngine.MonoBehaviour
---@field houseManager Witch.UI.Window.HouseManager
---@field houseItemType Witch.UI.Window.SceneItem.SceneItemType
---@field NormalIcon UnityEngine.Sprite
---@field TextItem TMPro.TMP_Text
---@field HlightIcon UnityEngine.Sprite
Witch.UI.Window.SceneItem = {}
---@alias CS.Witch.UI.Window.SceneItem Witch.UI.Window.SceneItem
CS.Witch.UI.Window.SceneItem = Witch.UI.Window.SceneItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SceneItem:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SceneItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SceneItem:OnPointerEnter(eventData) end
function Witch.UI.Window.SceneItem:RegisterEvent() end

---@class Witch.UI.Window.SceneItem.SceneItemType
---@field OpenLibrary Witch.UI.Window.SceneItem.SceneItemType
---@field OpenTower Witch.UI.Window.SceneItem.SceneItemType
---@field OpenExhibition Witch.UI.Window.SceneItem.SceneItemType
---@field OpenStore Witch.UI.Window.SceneItem.SceneItemType
---@field OpenAdministration Witch.UI.Window.SceneItem.SceneItemType
---@field OpenSpring Witch.UI.Window.SceneItem.SceneItemType
---@field OpenWitchHouse Witch.UI.Window.SceneItem.SceneItemType
---@field StartGame Witch.UI.Window.SceneItem.SceneItemType
Witch.UI.Window.SceneItem.SceneItemType = {}
---@alias CS.Witch.UI.Window.SceneItem.SceneItemType Witch.UI.Window.SceneItem.SceneItemType
CS.Witch.UI.Window.SceneItem.SceneItemType = Witch.UI.Window.SceneItem.SceneItemType


---@class Witch.UI.Window.RelicData : System.ValueType
---@field Id string
---@field relicList System.Collections.Generic.ICollection
Witch.UI.Window.RelicData = {}
---@alias CS.Witch.UI.Window.RelicData Witch.UI.Window.RelicData
CS.Witch.UI.Window.RelicData = Witch.UI.Window.RelicData

---@param roleTable RoleTable
---@return Witch.UI.Window.RelicData
function Witch.UI.Window.RelicData.New(roleTable) end

---@class Witch.UI.Window.LanguageUseUI : Witch.UI.UIBase
---@field ItemPratnt UnityEngine.Transform
Witch.UI.Window.LanguageUseUI = {}
---@alias CS.Witch.UI.Window.LanguageUseUI Witch.UI.Window.LanguageUseUI
CS.Witch.UI.Window.LanguageUseUI = Witch.UI.Window.LanguageUseUI

function Witch.UI.Window.LanguageUseUI:ReturnMain() end
function Witch.UI.Window.LanguageUseUI:ChangeChinese() end
function Witch.UI.Window.LanguageUseUI:ChangeJa() end
function Witch.UI.Window.LanguageUseUI:ChangeEn() end

---@class Witch.UI.Window.AchievementBase : System.Object
---@field info Witch.UI.Window.AchievementBase.AchievementInfo
Witch.UI.Window.AchievementBase = {}
---@alias CS.Witch.UI.Window.AchievementBase Witch.UI.Window.AchievementBase
CS.Witch.UI.Window.AchievementBase = Witch.UI.Window.AchievementBase

---@overload fun() : Witch.UI.Window.AchievementBase
---@param info Witch.UI.Window.AchievementBase.AchievementInfo
---@return Witch.UI.Window.AchievementBase
function Witch.UI.Window.AchievementBase.New(info) end
---@param status string
function Witch.UI.Window.AchievementBase:SetStatus(status) end

---@class Witch.UI.Window.AchievementBase.AchievementInfo : System.ValueType
---@field id string
---@field name string
---@field description string
---@field tip string
---@field level string
---@field reward string
---@field status string
Witch.UI.Window.AchievementBase.AchievementInfo = {}
---@alias CS.Witch.UI.Window.AchievementBase.AchievementInfo Witch.UI.Window.AchievementBase.AchievementInfo
CS.Witch.UI.Window.AchievementBase.AchievementInfo = Witch.UI.Window.AchievementBase.AchievementInfo

---@param id string
---@param name string
---@param description string
---@param tip string
---@param level string
---@param reward string
---@param status string
---@return Witch.UI.Window.AchievementBase.AchievementInfo
function Witch.UI.Window.AchievementBase.AchievementInfo.New(id, name, description, tip, level, reward, status) end

---@class Witch.UI.Window.AchievementCatalog : System.Object
---@field CategoryStory string
---@field CategoryBattle string
---@field CategoryExplore string
---@field CategoryBoss string
---@field CategoryUnlock string
---@field LevelTutorial string
---@field LevelEasy string
---@field LevelHard string
---@field LevelChallenge string
---@field LevelUnlock string
---@field LevelHidden string
---@field LevelNormal string
---@field RewardTruth string
---@field RewardRelic string
---@field RewardCard string
---@field RewardNone string
Witch.UI.Window.AchievementCatalog = {}
---@alias CS.Witch.UI.Window.AchievementCatalog Witch.UI.Window.AchievementCatalog
CS.Witch.UI.Window.AchievementCatalog = Witch.UI.Window.AchievementCatalog

---@param id string
---@return Witch.UI.Window.AchievementCatalog.Definition
function Witch.UI.Window.AchievementCatalog.Get(id) end
---@param rawId string
---@return string
function Witch.UI.Window.AchievementCatalog.NormalizeId(rawId) end

---@class Witch.UI.Window.AchievementCatalog.Definition : System.Object
---@field Id string
---@field Category string
---@field Level string
---@field Reward string
---@field Target number
Witch.UI.Window.AchievementCatalog.Definition = {}
---@alias CS.Witch.UI.Window.AchievementCatalog.Definition Witch.UI.Window.AchievementCatalog.Definition
CS.Witch.UI.Window.AchievementCatalog.Definition = Witch.UI.Window.AchievementCatalog.Definition

---@return Witch.UI.Window.AchievementCatalog.Definition
function Witch.UI.Window.AchievementCatalog.Definition.New() end

---@class Witch.UI.Window.AchievementRuntimeService : System.Object
---@field Instance Witch.UI.Window.AchievementRuntimeService
Witch.UI.Window.AchievementRuntimeService = {}
---@alias CS.Witch.UI.Window.AchievementRuntimeService Witch.UI.Window.AchievementRuntimeService
CS.Witch.UI.Window.AchievementRuntimeService = Witch.UI.Window.AchievementRuntimeService

function Witch.UI.Window.AchievementRuntimeService:Initialize() end
function Witch.UI.Window.AchievementRuntimeService:RefreshProgressRecords() end
function Witch.UI.Window.AchievementRuntimeService:RecordNormalRunCleared() end
function Witch.UI.Window.AchievementRuntimeService:RecordAbyssClearFromCurrentSave() end
function Witch.UI.Window.AchievementRuntimeService:RecordTutorialAmeliyaCompleted() end
function Witch.UI.Window.AchievementRuntimeService:RecordPrebattleSetup() end
function Witch.UI.Window.AchievementRuntimeService:RecordCardRewardSkipped() end
function Witch.UI.Window.AchievementRuntimeService:RecordBranchChosen() end
function Witch.UI.Window.AchievementRuntimeService:RecordSlotRunCleared() end
function Witch.UI.Window.AchievementRuntimeService:RecordPlayerResurrected() end
---@param status StatusManager
---@param fromDataId string
function Witch.UI.Window.AchievementRuntimeService:RecordPlayerDamaged(status, fromDataId) end
---@param id string
function Witch.UI.Window.AchievementRuntimeService:CompleteAchievement(id) end
---@param id string
---@param progress number
function Witch.UI.Window.AchievementRuntimeService:UpdateProgress(id, progress) end

---@class Witch.UI.Window.AchievementUI : Witch.UI.UIBase
---@field ItemParent UnityEngine.Transform
---@field ItemPre UnityEngine.GameObject
Witch.UI.Window.AchievementUI = {}
---@alias CS.Witch.UI.Window.AchievementUI Witch.UI.Window.AchievementUI
CS.Witch.UI.Window.AchievementUI = Witch.UI.Window.AchievementUI

function Witch.UI.Window.AchievementUI:OnEnable() end
function Witch.UI.Window.AchievementUI:DataUpdate() end

---@class Witch.UI.Window.AchItem : Witch.UI.Window.ItemNonDrag
---@field achievementUI Witch.UI.Window.AchievementUI
---@field TopCount number
---@field CurrentCount number
---@field RewardType string
Witch.UI.Window.AchItem = {}
---@alias CS.Witch.UI.Window.AchItem Witch.UI.Window.AchItem
CS.Witch.UI.Window.AchItem = Witch.UI.Window.AchItem

---@param data DataConfig
function Witch.UI.Window.AchItem:Init(data) end
function Witch.UI.Window.AchItem:GetReward() end
function Witch.UI.Window.AchItem:DataUpdate() end

---@class Witch.UI.Window.AchievementTable : System.Object
---@field table System.Collections.Generic.Dictionary
---@field ItemDic System.Collections.Generic.Dictionary
---@field count System.Collections.Generic.Dictionary
Witch.UI.Window.AchievementTable = {}
---@alias CS.Witch.UI.Window.AchievementTable Witch.UI.Window.AchievementTable
CS.Witch.UI.Window.AchievementTable = Witch.UI.Window.AchievementTable

---@return Witch.UI.Window.AchievementTable
function Witch.UI.Window.AchievementTable.New() end
---@param line System.Collections.Generic.IReadOnlyDictionary
---@return boolean
function Witch.UI.Window.AchievementTable.IsAchievementRow(line) end
function Witch.UI.Window.AchievementTable:Init() end
---@param id string
---@return Witch.UI.Window.AchievementBase
function Witch.UI.Window.AchievementTable:GetAchievement(id) end
---@param id string
---@param status string
---@return Witch.UI.Window.AchievementTable
function Witch.UI.Window.AchievementTable:SetAchievementStatus(id, status) end
---@param type string
---@return Witch.UI.Window.AchievementTable
function Witch.UI.Window.AchievementTable:SortByStatus(type) end
---@return Witch.UI.Window.AchievementTable
function Witch.UI.Window.AchievementTable:CountCalculate() end

---@class Witch.UI.Window.AcknowledgmentsUI : Witch.UI.UIBase
---@field BigItem UnityEngine.Transform
---@field NormalItem UnityEngine.Transform
---@field SmallItem UnityEngine.Transform
---@field bigGroups Witch.UI.Window.AcknowledgmentsUI.CrowdGroup[]
---@field normalGroups Witch.UI.Window.AcknowledgmentsUI.CrowdGroup[]
---@field smallGroups Witch.UI.Window.AcknowledgmentsUI.CrowdGroup[]
---@field scrollRect UnityEngine.UI.ScrollRect
---@field crowdListFile UnityEngine.TextAsset
---@field crowdListPath string
---@field autoScrollSpeed number
---@field manualScrollPauseSeconds number
---@field extraBufferRows number
---@field iconPreloadCountPerFrame number
Witch.UI.Window.AcknowledgmentsUI = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI Witch.UI.Window.AcknowledgmentsUI
CS.Witch.UI.Window.AcknowledgmentsUI = Witch.UI.Window.AcknowledgmentsUI

function Witch.UI.Window.AcknowledgmentsUI:FadeIn() end
function Witch.UI.Window.AcknowledgmentsUI:OnEnable() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI:OnScroll(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI:OnPointerClick(eventData) end
function Witch.UI.Window.AcknowledgmentsUI:Close() end

---@class Witch.UI.Window.AcknowledgmentsUI.InputForwarder : UnityEngine.MonoBehaviour
---@field Owner Witch.UI.Window.AcknowledgmentsUI
Witch.UI.Window.AcknowledgmentsUI.InputForwarder = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.InputForwarder Witch.UI.Window.AcknowledgmentsUI.InputForwarder
CS.Witch.UI.Window.AcknowledgmentsUI.InputForwarder = Witch.UI.Window.AcknowledgmentsUI.InputForwarder

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI.InputForwarder:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI.InputForwarder:OnScroll(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI.InputForwarder:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI.InputForwarder:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.AcknowledgmentsUI.InputForwarder:OnEndDrag(eventData) end

---@class Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
---@field None Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
---@field Big Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
---@field Normal Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
---@field Small Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
Witch.UI.Window.AcknowledgmentsUI.CrowdLevel = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.CrowdLevel Witch.UI.Window.AcknowledgmentsUI.CrowdLevel
CS.Witch.UI.Window.AcknowledgmentsUI.CrowdLevel = Witch.UI.Window.AcknowledgmentsUI.CrowdLevel


---@class Witch.UI.Window.AcknowledgmentsUI.VirtualSection : System.Object
---@field Key string
---@field Template UnityEngine.Transform
---@field Root UnityEngine.RectTransform
---@field Container UnityEngine.RectTransform
---@field Back UnityEngine.RectTransform
---@field Grid UnityEngine.UI.GridLayoutGroup
---@field Vertical UnityEngine.UI.VerticalLayoutGroup
---@field Fitter UnityEngine.UI.ContentSizeFitter
---@field RootLayout UnityEngine.UI.VerticalLayoutGroup
---@field RootFitter UnityEngine.UI.ContentSizeFitter
---@field ContainerLayoutElement UnityEngine.UI.LayoutElement
---@field RootLayoutElement UnityEngine.UI.LayoutElement
---@field Entries System.Collections.Generic.List
---@field Pool System.Collections.Generic.List
---@field Columns number
---@field RowHeight number
---@field FirstVisibleRow number
---@field LastVisibleRow number
---@field LastHeight number
---@field RootFixedHeight number
---@field IsPoolHidden boolean
Witch.UI.Window.AcknowledgmentsUI.VirtualSection = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.VirtualSection Witch.UI.Window.AcknowledgmentsUI.VirtualSection
CS.Witch.UI.Window.AcknowledgmentsUI.VirtualSection = Witch.UI.Window.AcknowledgmentsUI.VirtualSection

---@return Witch.UI.Window.AcknowledgmentsUI.VirtualSection
function Witch.UI.Window.AcknowledgmentsUI.VirtualSection.New() end

---@class Witch.UI.Window.AcknowledgmentsUI.PooledItem : System.Object
---@field GameObject UnityEngine.GameObject
---@field RectTransform UnityEngine.RectTransform
Witch.UI.Window.AcknowledgmentsUI.PooledItem = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.PooledItem Witch.UI.Window.AcknowledgmentsUI.PooledItem
CS.Witch.UI.Window.AcknowledgmentsUI.PooledItem = Witch.UI.Window.AcknowledgmentsUI.PooledItem

---@param gameObject UnityEngine.GameObject
---@return Witch.UI.Window.AcknowledgmentsUI.PooledItem
function Witch.UI.Window.AcknowledgmentsUI.PooledItem.New(gameObject) end
---@param entry Witch.UI.Window.AcknowledgmentsUI.CrowdEntry
---@param iconCache System.Collections.Generic.Dictionary
function Witch.UI.Window.AcknowledgmentsUI.PooledItem:SetEntry(entry, iconCache) end

---@class Witch.UI.Window.AcknowledgmentsUI.CrowdGroup : System.Object
---@field template UnityEngine.Transform
Witch.UI.Window.AcknowledgmentsUI.CrowdGroup = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.CrowdGroup Witch.UI.Window.AcknowledgmentsUI.CrowdGroup
CS.Witch.UI.Window.AcknowledgmentsUI.CrowdGroup = Witch.UI.Window.AcknowledgmentsUI.CrowdGroup

---@return Witch.UI.Window.AcknowledgmentsUI.CrowdGroup
function Witch.UI.Window.AcknowledgmentsUI.CrowdGroup.New() end

---@class Witch.UI.Window.AcknowledgmentsUI.CrowdEntry : System.ValueType
---@field Name string
---@field Description string
---@field IconPath string
Witch.UI.Window.AcknowledgmentsUI.CrowdEntry = {}
---@alias CS.Witch.UI.Window.AcknowledgmentsUI.CrowdEntry Witch.UI.Window.AcknowledgmentsUI.CrowdEntry
CS.Witch.UI.Window.AcknowledgmentsUI.CrowdEntry = Witch.UI.Window.AcknowledgmentsUI.CrowdEntry

---@param name string
---@param description string
---@param iconPath string
---@return Witch.UI.Window.AcknowledgmentsUI.CrowdEntry
function Witch.UI.Window.AcknowledgmentsUI.CrowdEntry.New(name, description, iconPath) end

---@class Witch.UI.Window.AffectionUI : Witch.UI.UIBase
---@field firstShow boolean
Witch.UI.Window.AffectionUI = {}
---@alias CS.Witch.UI.Window.AffectionUI Witch.UI.Window.AffectionUI
CS.Witch.UI.Window.AffectionUI = Witch.UI.Window.AffectionUI

function Witch.UI.Window.AffectionUI:OnEnable() end
---@param dataConfig DataConfig
function Witch.UI.Window.AffectionUI:AddReward(dataConfig) end
function Witch.UI.Window.AffectionUI:ShowNowLevel() end

---@class Witch.UI.Window.AnnouncementUI : Witch.UI.UIBase
---@field ItemPrefab UnityEngine.GameObject
Witch.UI.Window.AnnouncementUI = {}
---@alias CS.Witch.UI.Window.AnnouncementUI Witch.UI.Window.AnnouncementUI
CS.Witch.UI.Window.AnnouncementUI = Witch.UI.Window.AnnouncementUI

function Witch.UI.Window.AnnouncementUI:Awake() end
function Witch.UI.Window.AnnouncementUI:ShowAnnouncement() end
---@param tempData System.Collections.Generic.Dictionary
function Witch.UI.Window.AnnouncementUI:ShowWin(tempData) end

---@class Witch.UI.Window.BackpackUI : Witch.UI.UIBase
---@field statusUI Witch.UI.Window.StatusUI
Witch.UI.Window.BackpackUI = {}
---@alias CS.Witch.UI.Window.BackpackUI Witch.UI.Window.BackpackUI
CS.Witch.UI.Window.BackpackUI = Witch.UI.Window.BackpackUI

---@param statusUIData Witch.UI.Window.StatusUIData
function Witch.UI.Window.BackpackUI:ShowStatus(statusUIData) end
function Witch.UI.Window.BackpackUI:DataUpdate() end
function Witch.UI.Window.BackpackUI:Init() end
function Witch.UI.Window.BackpackUI:OnEnable() end
function Witch.UI.Window.BackpackUI:OnDestroy() end

---@class Witch.UI.Window.OutDeckUIData : System.ValueType
---@field Id string
---@field cardList System.Collections.Generic.ICollection
---@field UnCardList System.Collections.Generic.ICollection
---@field CardBottomCount number
---@field CardTopCount number
---@field MaxAlCardCount number
Witch.UI.Window.OutDeckUIData = {}
---@alias CS.Witch.UI.Window.OutDeckUIData Witch.UI.Window.OutDeckUIData
CS.Witch.UI.Window.OutDeckUIData = Witch.UI.Window.OutDeckUIData

---@param roleTable RoleTable
---@return Witch.UI.Window.OutDeckUIData
function Witch.UI.Window.OutDeckUIData.New(roleTable) end

---@class Witch.UI.Window.OutDeckUI : Witch.UI.UIBase
---@field OutDeckUIData Witch.UI.Window.OutDeckUIData
---@field equipCardTransform UnityEngine.Transform
---@field unequipCardTransform UnityEngine.Transform
---@field shouldButton UnityEngine.GameObject
Witch.UI.Window.OutDeckUI = {}
---@alias CS.Witch.UI.Window.OutDeckUI Witch.UI.Window.OutDeckUI
CS.Witch.UI.Window.OutDeckUI = Witch.UI.Window.OutDeckUI

function Witch.UI.Window.OutDeckUI:OnEnable() end
---@param data Witch.UI.Window.OutDeckUIData
function Witch.UI.Window.OutDeckUI:SetRole(data) end
function Witch.UI.Window.OutDeckUI:DataUpdate() end
function Witch.UI.Window.OutDeckUI:ShowMsg() end
function Witch.UI.Window.OutDeckUI:ChangeCardShow() end
---@param cardData DataConfig
---@param ifequipped boolean
function Witch.UI.Window.OutDeckUI:CreateItem(cardData, ifequipped) end
function Witch.UI.Window.OutDeckUI:OnDisable() end

---@class Witch.UI.Window.StatusUIData : System.ValueType
---@field instanceId string
---@field VarsMap System.Collections.Generic.Dictionary
---@field blessingConfigs System.Collections.Generic.List
---@field relics System.Collections.Generic.List
---@field career DataConfig
---@field San number
---@field MaxSan number
---@field Money number
---@field ChooseVars System.Collections.Generic.List
Witch.UI.Window.StatusUIData = {}
---@alias CS.Witch.UI.Window.StatusUIData Witch.UI.Window.StatusUIData
CS.Witch.UI.Window.StatusUIData = Witch.UI.Window.StatusUIData

---@param roleTable RoleTable
---@return Witch.UI.Window.StatusUIData
function Witch.UI.Window.StatusUIData.New(roleTable) end

---@class Witch.UI.Window.StatusUI : UnityEngine.MonoBehaviour
---@field BlessParent UnityEngine.Transform
---@field RelicParent UnityEngine.Transform
---@field statusUIData Witch.UI.Window.StatusUIData
Witch.UI.Window.StatusUI = {}
---@alias CS.Witch.UI.Window.StatusUI Witch.UI.Window.StatusUI
CS.Witch.UI.Window.StatusUI = Witch.UI.Window.StatusUI

---@param backpackUI Witch.UI.Window.BackpackUI
function Witch.UI.Window.StatusUI:Init(backpackUI) end
function Witch.UI.Window.StatusUI:DataUpdate() end
---@param statusUIData Witch.UI.Window.StatusUIData
function Witch.UI.Window.StatusUI:ShowMsg(statusUIData) end
function Witch.UI.Window.StatusUI:ShowSan() end
---@param sender System.Object
---@param args System.ComponentModel.PropertyChangedEventArgs
function Witch.UI.Window.StatusUI:OnRoleTableChanged(sender, args) end
function Witch.UI.Window.StatusUI:ShowMoney() end
function Witch.UI.Window.StatusUI:ShowVar() end
function Witch.UI.Window.StatusUI:ShowBuff() end
function Witch.UI.Window.StatusUI:ReleaseBuff() end
function Witch.UI.Window.StatusUI:ShowBless() end
function Witch.UI.Window.StatusUI:UpdateRelics() end
function Witch.UI.Window.StatusUI:ShowRoleMsg() end
---@return System.Collections.Generic.List
function Witch.UI.Window.StatusUI:GenerateThreeOptions() end
---@param blessings System.Collections.Generic.List
function Witch.UI.Window.StatusUI:RewardGenerator(blessings) end
---@return System.Collections.Generic.List
function Witch.UI.Window.StatusUI:GenerateHighOptions() end
---@param parent UnityEngine.Transform
---@param onBlessUiClosed System.Action | function
function Witch.UI.Window.StatusUI:CreateBlessUI(parent, onBlessUiClosed) end

---@class Witch.UI.Window.BuffShowItem : Witch.UI.Window.ItemNonDrag
Witch.UI.Window.BuffShowItem = {}
---@alias CS.Witch.UI.Window.BuffShowItem Witch.UI.Window.BuffShowItem
CS.Witch.UI.Window.BuffShowItem = Witch.UI.Window.BuffShowItem

---@param dataConfig DataConfig
function Witch.UI.Window.BuffShowItem:Init(dataConfig) end

---@class Witch.UI.Window.CareerData : System.ValueType
---@field instanceId string
---@field career DataConfig
---@field San number
---@field MaxSan number
Witch.UI.Window.CareerData = {}
---@alias CS.Witch.UI.Window.CareerData Witch.UI.Window.CareerData
CS.Witch.UI.Window.CareerData = Witch.UI.Window.CareerData

---@param roleTable RoleTable
---@return Witch.UI.Window.CareerData
function Witch.UI.Window.CareerData.New(roleTable) end

---@class Witch.UI.Window.TopBarUI : Witch.UI.UIBase
---@field RelicList UnityEngine.Transform
---@field varList UnityEngine.Transform
---@field ConnectMode boolean
---@field statusPrefab UnityEngine.GameObject
---@field mainStatus UnityEngine.GameObject
---@field IdToStatusItem System.Collections.Generic.Dictionary
---@field roleTable RoleTable
Witch.UI.Window.TopBarUI = {}
---@alias CS.Witch.UI.Window.TopBarUI Witch.UI.Window.TopBarUI
CS.Witch.UI.Window.TopBarUI = Witch.UI.Window.TopBarUI

---@param players System.Collections.Generic.List
function Witch.UI.Window.TopBarUI:CreateConnectPlayerStatus(players) end
function Witch.UI.Window.TopBarUI:ChangeCareerAvator() end
function Witch.UI.Window.TopBarUI:OnDestroy() end
function Witch.UI.Window.TopBarUI:FadeIn() end
function Witch.UI.Window.TopBarUI:FightHide() end
function Witch.UI.Window.TopBarUI:HideLeftUp() end
function Witch.UI.Window.TopBarUI:ShowLeftUp() end
---@param sender System.Object
---@param args System.ComponentModel.PropertyChangedEventArgs
function Witch.UI.Window.TopBarUI:OnGameRuntimeDataChanged(sender, args) end
---@param sender System.Object
---@param args System.ComponentModel.PropertyChangedEventArgs
function Witch.UI.Window.TopBarUI:OnRoleTableChanged(sender, args) end
function Witch.UI.Window.TopBarUI:ChangeVar() end
function Witch.UI.Window.TopBarUI:ShowSetting() end
function Witch.UI.Window.TopBarUI:ShowDict() end
---@param value string
---@param fromId string
---@param type string
function Witch.UI.Window.TopBarUI:OtherChangeShow(value, fromId, type) end
function Witch.UI.Window.TopBarUI:TryReturn() end
function Witch.UI.Window.TopBarUI:ReturnToMenu() end
function Witch.UI.Window.TopBarUI:OpenBackpack() end
function Witch.UI.Window.TopBarUI:ChangeCareer() end
---@param roleid string
function Witch.UI.Window.TopBarUI:ChangeSan(roleid) end
---@param Defend string
function Witch.UI.Window.TopBarUI:UpdateDefend(Defend) end
function Witch.UI.Window.TopBarUI:HideDefend() end
function Witch.UI.Window.TopBarUI:ChangeMoney() end
function Witch.UI.Window.TopBarUI:ChangeTrue() end
function Witch.UI.Window.TopBarUI:UpdateRelics() end
function Witch.UI.Window.TopBarUI:SetRelicGlowEvent() end
function Witch.UI.Window.TopBarUI:UpdateRelicCountShow() end
function Witch.UI.Window.TopBarUI:ListenVars() end

---@class Witch.UI.Window.CardChoiceUI : Witch.UI.UIBase
Witch.UI.Window.CardChoiceUI = {}
---@alias CS.Witch.UI.Window.CardChoiceUI Witch.UI.Window.CardChoiceUI
CS.Witch.UI.Window.CardChoiceUI = Witch.UI.Window.CardChoiceUI

function Witch.UI.Window.CardChoiceUI:DataUpdate() end
---@param obj UnityEngine.GameObject
---@param dataConfig DataConfig
function Witch.UI.Window.CardChoiceUI:Select(obj, dataConfig) end
function Witch.UI.Window.CardChoiceUI:Close() end

---@class Witch.UI.Window.BreaksUI : UnityEngine.MonoBehaviour
---@field startTime number
Witch.UI.Window.BreaksUI = {}
---@alias CS.Witch.UI.Window.BreaksUI Witch.UI.Window.BreaksUI
CS.Witch.UI.Window.BreaksUI = Witch.UI.Window.BreaksUI

---@param roleList System.ValueTuple
function Witch.UI.Window.BreaksUI:CreateRole(roleList) end
function Witch.UI.Window.BreaksUI:Close() end
function Witch.UI.Window.BreaksUI:ShowWarehouse() end
function Witch.UI.Window.BreaksUI:RelicBackPoint() end
function Witch.UI.Window.BreaksUI:ReturnHome() end
function Witch.UI.Window.BreaksUI:CreateFoodItem() end

---@class Witch.UI.Window.CaptionStyle
---@field Bottom Witch.UI.Window.CaptionStyle
---@field Top Witch.UI.Window.CaptionStyle
---@field Center Witch.UI.Window.CaptionStyle
---@field Narror Witch.UI.Window.CaptionStyle
Witch.UI.Window.CaptionStyle = {}
---@alias CS.Witch.UI.Window.CaptionStyle Witch.UI.Window.CaptionStyle
CS.Witch.UI.Window.CaptionStyle = Witch.UI.Window.CaptionStyle


---@class Witch.UI.Window.CaptionUI : Witch.UI.UIBase
Witch.UI.Window.CaptionUI = {}
---@alias CS.Witch.UI.Window.CaptionUI Witch.UI.Window.CaptionUI
CS.Witch.UI.Window.CaptionUI = Witch.UI.Window.CaptionUI

---@param text string
---@param style Witch.UI.Window.CaptionStyle
---@param animationTime number
---@param delay number
---@param animatonType number
function Witch.UI.Window.CaptionUI:ShowCaption(text, style, animationTime, delay, animatonType) end

---@class Witch.UI.Window.CardEditorUI : Witch.UI.UIBase
---@field IndexSprite System.Collections.Generic.Dictionary
---@field MethodCount System.Collections.Generic.Dictionary
---@field onEdited System.Action | function
---@field onepageCount number
---@field thisRatity number
---@field collection System.Collections.Generic.List
---@field itemPrefab1 UnityEngine.GameObject
---@field buttons System.Collections.Generic.List
---@field cost number
---@field total number
Witch.UI.Window.CardEditorUI = {}
---@alias CS.Witch.UI.Window.CardEditorUI Witch.UI.Window.CardEditorUI
CS.Witch.UI.Window.CardEditorUI = Witch.UI.Window.CardEditorUI

function Witch.UI.Window.CardEditorUI:UpdateTotal() end
function Witch.UI.Window.CardEditorUI:DataUpdate() end
function Witch.UI.Window.CardEditorUI:UpdateSprite() end
function Witch.UI.Window.CardEditorUI:OnEnable() end
function Witch.UI.Window.CardEditorUI:UpdateBuff() end
function Witch.UI.Window.CardEditorUI:InitTime() end
function Witch.UI.Window.CardEditorUI:InitTimeAgain() end
---@param InitTime string
function Witch.UI.Window.CardEditorUI:CreateTimeItem(InitTime) end
function Witch.UI.Window.CardEditorUI:OnDestroy() end

---@class Witch.UI.Window.ChangeFloatWindow : UnityEngine.MonoBehaviour
Witch.UI.Window.ChangeFloatWindow = {}
---@alias CS.Witch.UI.Window.ChangeFloatWindow Witch.UI.Window.ChangeFloatWindow
CS.Witch.UI.Window.ChangeFloatWindow = Witch.UI.Window.ChangeFloatWindow

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ChangeFloatWindow:OnPointerClick(eventData) end

---@class Witch.UI.Window.CardEffectBuff : UnityEngine.MonoBehaviour
---@field NowItem Witch.UI.Window.CardEffectItem
---@field data System.Collections.Generic.Dictionary
---@field buffdata DataEditor.CardEditor.BuffData
Witch.UI.Window.CardEffectBuff = {}
---@alias CS.Witch.UI.Window.CardEffectBuff Witch.UI.Window.CardEffectBuff
CS.Witch.UI.Window.CardEffectBuff = Witch.UI.Window.CardEffectBuff

function Witch.UI.Window.CardEffectBuff:SetData() end

---@class Witch.UI.Window.CardEffectItem : UnityEngine.MonoBehaviour
---@field effectName string
---@field effectDes string
---@field isBuff boolean
---@field followEffectName string
---@field sourceName string
---@field methodName string
---@field effectCost number
---@field costMultiplier number
---@field cardEditorUI Witch.UI.Window.CardEditorUI
---@field vars System.Collections.Generic.Dictionary
---@field desValIndex number
---@field isMarkedForDestruction boolean
Witch.UI.Window.CardEffectItem = {}
---@alias CS.Witch.UI.Window.CardEffectItem Witch.UI.Window.CardEffectItem
CS.Witch.UI.Window.CardEffectItem = Witch.UI.Window.CardEffectItem

---@param editorUI Witch.UI.Window.CardEditorUI
function Witch.UI.Window.CardEffectItem.RefreshEditorDescriptions(editorUI) end
function Witch.UI.Window.CardEffectItem:IsBuff() end
function Witch.UI.Window.CardEffectItem:CalculateCost() end
function Witch.UI.Window.CardEffectItem:CreateDescription() end
function Witch.UI.Window.CardEffectItem:CreateTimeDes() end
---@return System.ValueTuple
function Witch.UI.Window.CardEffectItem:RunMethod() end
function Witch.UI.Window.CardEffectItem:UpdateAll() end
function Witch.UI.Window.CardEffectItem:ShowChangeBuff() end
function Witch.UI.Window.CardEffectItem:HideBuffList() end
---@param buffName string
function Witch.UI.Window.CardEffectItem:ChangeBuff(buffName) end

---@class Witch.UI.Window.ShowCareer : Witch.UI.Window.ItemNonDrag
---@field belong string
---@field gameEntryUI Witch.UI.Window.GameEntryUI
Witch.UI.Window.ShowCareer = {}
---@alias CS.Witch.UI.Window.ShowCareer Witch.UI.Window.ShowCareer
CS.Witch.UI.Window.ShowCareer = Witch.UI.Window.ShowCareer

---@param item DataConfig
function Witch.UI.Window.ShowCareer:Init(item) end
function Witch.UI.Window.ShowCareer:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCareer:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCareer:OnPointerEnter(eventData) end

---@class Witch.UI.Window.ChatUI : Witch.UI.UIBase
---@field Instance Witch.UI.Window.ChatUI
---@field isOpen boolean
Witch.UI.Window.ChatUI = {}
---@alias CS.Witch.UI.Window.ChatUI Witch.UI.Window.ChatUI
CS.Witch.UI.Window.ChatUI = Witch.UI.Window.ChatUI

---@param text string
function Witch.UI.Window.ChatUI:SendChatMessage(text) end
---@param text string
function Witch.UI.Window.ChatUI:AddMessage(text) end

---@class Witch.UI.Window.DeckUI : Witch.UI.UIBase
Witch.UI.Window.DeckUI = {}
---@alias CS.Witch.UI.Window.DeckUI Witch.UI.Window.DeckUI
CS.Witch.UI.Window.DeckUI = Witch.UI.Window.DeckUI

function Witch.UI.Window.DeckUI:OnEnable() end
function Witch.UI.Window.DeckUI:CreateDeckMenu() end
function Witch.UI.Window.DeckUI:CreateUsedDeckMenu() end
---@param count number
---@param DataConfigList System.Collections.Generic.List
---@param SourceList System.Collections.Generic.List
function Witch.UI.Window.DeckUI:CreateDeckMenuForSelect(count, DataConfigList, SourceList) end
function Witch.UI.Window.DeckUI:OnDisable() end

---@class Witch.UI.Window.DesItem : Witch.UI.Window.ItemNonDrag
---@field Claimed boolean
Witch.UI.Window.DesItem = {}
---@alias CS.Witch.UI.Window.DesItem Witch.UI.Window.DesItem
CS.Witch.UI.Window.DesItem = Witch.UI.Window.DesItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DesItem:OnPointerClick(eventData) end

---@class Witch.UI.Window.DestinyTreeUI : Witch.UI.Window.ShopUI
---@field InitCost number
---@field Cost number
Witch.UI.Window.DestinyTreeUI = {}
---@alias CS.Witch.UI.Window.DestinyTreeUI Witch.UI.Window.DestinyTreeUI
CS.Witch.UI.Window.DestinyTreeUI = Witch.UI.Window.DestinyTreeUI

function Witch.UI.Window.DestinyTreeUI:DataUpdate() end
function Witch.UI.Window.DestinyTreeUI:Divination() end
function Witch.UI.Window.DestinyTreeUI:GenerateBless() end
function Witch.UI.Window.DestinyTreeUI:SetShopItems() end

---@class Witch.UI.Window.DialogueVisualResolver : System.Object
---@field DefaultRoleScale number
Witch.UI.Window.DialogueVisualResolver = {}
---@alias CS.Witch.UI.Window.DialogueVisualResolver Witch.UI.Window.DialogueVisualResolver
CS.Witch.UI.Window.DialogueVisualResolver = Witch.UI.Window.DialogueVisualResolver

---@param roleData System.Collections.Generic.IDictionary
---@param overrideValue string
---@return string
function Witch.UI.Window.DialogueVisualResolver.ResolveRoleImagePath(roleData, overrideValue) end
---@param roleData System.Collections.Generic.IDictionary
---@return number
function Witch.UI.Window.DialogueVisualResolver.GetDefaultY(roleData) end
---@param roleData System.Collections.Generic.IDictionary
---@return number
function Witch.UI.Window.DialogueVisualResolver.GetDefaultScale(roleData) end
---@param value string
---@param fallback number
---@return number
function Witch.UI.Window.DialogueVisualResolver.ParseFloat(value, fallback) end

---@class Witch.UI.Window.DialogueUI : Witch.UI.UIBase
---@field waitTime number
Witch.UI.Window.DialogueUI = {}
---@alias CS.Witch.UI.Window.DialogueUI Witch.UI.Window.DialogueUI
CS.Witch.UI.Window.DialogueUI = Witch.UI.Window.DialogueUI

function Witch.UI.Window.DialogueUI:Awake() end
---@param config DataConfig
function Witch.UI.Window.DialogueUI:ShowDialogue(config) end
---@param visible boolean
function Witch.UI.Window.DialogueUI:SetDialogueBoxVisible(visible) end
---@param index number
---@param x number
---@param time number
---@param delay number
function Witch.UI.Window.DialogueUI:DoMoveX(index, x, time, delay) end
---@param index number
---@param y number
---@param time number
---@param delay number
function Witch.UI.Window.DialogueUI:DoMoveY(index, y, time, delay) end
---@param index number
---@param scale number
---@param time number
---@param delay number
function Witch.UI.Window.DialogueUI:DoScale(index, scale, time, delay) end
---@param index number
---@param time number
function Witch.UI.Window.DialogueUI:DoFadeIn(index, time) end
---@param index number
---@param time number
function Witch.UI.Window.DialogueUI:DoFadeOut(index, time) end
function Witch.UI.Window.DialogueUI:ShowChoice() end
---@param thisData DataConfig
---@return string
function Witch.UI.Window.DialogueUI:GetText(thisData) end
function Witch.UI.Window.DialogueUI:EndDialogue() end
---@return System.Collections.IEnumerator
function Witch.UI.Window.DialogueUI:StartDia() end
---@return System.Collections.IEnumerator
function Witch.UI.Window.DialogueUI:Skip() end
function Witch.UI.Window.DialogueUI:ShowHistory() end
function Witch.UI.Window.DialogueUI:OnDestroy() end

---@class Witch.UI.Window.DialogueUI.RoleSlot : System.Object
---@field Root UnityEngine.GameObject
---@field Rect UnityEngine.RectTransform
---@field Image UnityEngine.UI.Image
---@field CanvasGroup UnityEngine.CanvasGroup
---@field RoleData System.Collections.Generic.Dictionary
---@field RoleId string
---@field IsSpeaker boolean
---@field BaseAnchoredPosition UnityEngine.Vector2
---@field DefaultY number
---@field DefaultScale number
Witch.UI.Window.DialogueUI.RoleSlot = {}
---@alias CS.Witch.UI.Window.DialogueUI.RoleSlot Witch.UI.Window.DialogueUI.RoleSlot
CS.Witch.UI.Window.DialogueUI.RoleSlot = Witch.UI.Window.DialogueUI.RoleSlot

---@return Witch.UI.Window.DialogueUI.RoleSlot
function Witch.UI.Window.DialogueUI.RoleSlot.New() end

---@class Witch.UI.Window.OptionsUI : Witch.UI.UIBase
Witch.UI.Window.OptionsUI = {}
---@alias CS.Witch.UI.Window.OptionsUI Witch.UI.Window.OptionsUI
CS.Witch.UI.Window.OptionsUI = Witch.UI.Window.OptionsUI

function Witch.UI.Window.OptionsUI:FadeIn() end
---@param text string
---@param action System.Action | function
function Witch.UI.Window.OptionsUI:AddOption(text, action) end
function Witch.UI.Window.OptionsUI:Close() end

---@class Witch.UI.Window.ButtonUse : UnityEngine.MonoBehaviour
---@field dictionaryUI Witch.UI.Window.DictionaryUI
---@field ItemType string
---@field Add string
---@field belongs string
Witch.UI.Window.ButtonUse = {}
---@alias CS.Witch.UI.Window.ButtonUse Witch.UI.Window.ButtonUse
CS.Witch.UI.Window.ButtonUse = Witch.UI.Window.ButtonUse

function Witch.UI.Window.ButtonUse:Awake() end
function Witch.UI.Window.ButtonUse:ButtonUseSc() end
function Witch.UI.Window.ButtonUse:DataUpdate() end

---@class Witch.UI.Window.DictionaryUI : Witch.UI.UIBase
---@field BlessList UnityEngine.Transform
---@field RelicList UnityEngine.Transform
---@field CardList UnityEngine.Transform
---@field EnemyList UnityEngine.Transform
---@field BuffList UnityEngine.Transform
---@field EnchList UnityEngine.Transform
---@field nowIndex number
---@field page number
---@field ChooseTags System.Collections.Generic.Dictionary
---@field CardItems System.Collections.Generic.List
---@field ChooseCardItems System.Collections.Generic.List
---@field BlessItems System.Collections.Generic.List
---@field RelicItems System.Collections.Generic.List
---@field EnemyItems System.Collections.Generic.List
---@field BuffItems System.Collections.Generic.List
---@field EnchItems System.Collections.Generic.List
---@field TypeNowRarity System.Collections.Generic.Dictionary
---@field buffType string
Witch.UI.Window.DictionaryUI = {}
---@alias CS.Witch.UI.Window.DictionaryUI Witch.UI.Window.DictionaryUI
CS.Witch.UI.Window.DictionaryUI = Witch.UI.Window.DictionaryUI

function Witch.UI.Window.DictionaryUI:DataUpdate() end
function Witch.UI.Window.DictionaryUI:RegisterEvent() end
function Witch.UI.Window.DictionaryUI:Retrieve() end
function Witch.UI.Window.DictionaryUI:ReturnList() end
---@return string
function Witch.UI.Window.DictionaryUI:LastCommand() end
---@return string
function Witch.UI.Window.DictionaryUI:NextCommand() end
function Witch.UI.Window.DictionaryUI:Selected() end
---@param formList UnityEngine.Transform
function Witch.UI.Window.DictionaryUI:ReleaseCardItem(formList) end
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Window.DictionaryUI:PreLoad() end
---@param datas System.Collections.Generic.List
function Witch.UI.Window.DictionaryUI:ResetPage(datas) end
function Witch.UI.Window.DictionaryUI:Init() end
function Witch.UI.Window.DictionaryUI:OnEnable() end
function Witch.UI.Window.DictionaryUI:Hide() end
function Witch.UI.Window.DictionaryUI:Close() end
function Witch.UI.Window.DictionaryUI:ReleaseItem() end
function Witch.UI.Window.DictionaryUI:SortingBydefault() end
---@param type string
function Witch.UI.Window.DictionaryUI:SortingByType(type) end
function Witch.UI.Window.DictionaryUI:SelectCardByPage() end
function Witch.UI.Window.DictionaryUI:RefreshPageDisplay() end
function Witch.UI.Window.DictionaryUI:TotalCreateItem() end
---@param dictionaryItem Witch.UI.Window.DictionaryItem
function Witch.UI.Window.DictionaryUI:ShowInfo(dictionaryItem) end
function Witch.UI.Window.DictionaryUI:CloseInfo() end
---@param datas System.Collections.Generic.List
---@param temp UnityEngine.Transform
function Witch.UI.Window.DictionaryUI:MoveItem(datas, temp) end
---@param item Witch.UI.Window.BlessItem
---@param type string
function Witch.UI.Window.DictionaryUI:SetRelicDes(item, type) end
function Witch.UI.Window.DictionaryUI:CreateCardTag() end
function Witch.UI.Window.DictionaryUI:ResetTag() end
function Witch.UI.Window.DictionaryUI:OnDisable() end

---@class Witch.UI.Window.EnchCardItem : Witch.UI.Window.ItemNonDrag
---@field CardEnchUI Witch.UI.Window.CardEnchUI
Witch.UI.Window.EnchCardItem = {}
---@alias CS.Witch.UI.Window.EnchCardItem Witch.UI.Window.EnchCardItem
CS.Witch.UI.Window.EnchCardItem = Witch.UI.Window.EnchCardItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.EnchCardItem:OnPointerClick(eventData) end
function Witch.UI.Window.EnchCardItem:ShowFloatingWindow() end
---@param dataConfig DataConfig
function Witch.UI.Window.EnchCardItem:Init(dataConfig) end
function Witch.UI.Window.EnchCardItem:Unload() end

---@class Witch.UI.Window.EventUI : Witch.UI.UIBase
---@field ClickClip UnityEngine.AudioClip
---@field ShowClip UnityEngine.AudioClip
Witch.UI.Window.EventUI = {}
---@alias CS.Witch.UI.Window.EventUI Witch.UI.Window.EventUI
CS.Witch.UI.Window.EventUI = Witch.UI.Window.EventUI

function Witch.UI.Window.EventUI:FadeIn() end
---@param id string
function Witch.UI.Window.EventUI:Init(id) end
---@param id string
function Witch.UI.Window.EventUI:ContinueEvent(id) end
function Witch.UI.Window.EventUI:Entry() end
function Witch.UI.Window.EventUI:TryChangeMap() end
function Witch.UI.Window.EventUI:AnnounceEventDone() end
---@param index string
function Witch.UI.Window.EventUI:LockChoice(index) end
function Witch.UI.Window.EventUI:EndEvent() end
---@param subtip string
function Witch.UI.Window.EventUI:ChangeSubtip(subtip) end
function Witch.UI.Window.EventUI:DataUpdate() end
function Witch.UI.Window.EventUI:RegisterEvent() end
function Witch.UI.Window.EventUI:ClearEvent() end
function Witch.UI.Window.EventUI:OnDestroy() end

---@class Witch.UI.Window.BuffBarUI : Witch.UI.UIBase
---@field content UnityEngine.Transform
---@field status StatusManager
---@field BuffDic System.Collections.Generic.Dictionary
---@field isDirty boolean
---@field isDisplay boolean
Witch.UI.Window.BuffBarUI = {}
---@alias CS.Witch.UI.Window.BuffBarUI Witch.UI.Window.BuffBarUI
CS.Witch.UI.Window.BuffBarUI = Witch.UI.Window.BuffBarUI

---@param buffId string
---@param level number
function Witch.UI.Window.BuffBarUI:CreateNewBuff(buffId, level) end
---@param buffId string
---@return Witch.UI.Window.BuffBarUI
function Witch.UI.Window.BuffBarUI:RemoveBuff(buffId) end
---@overload fun(self: Witch.UI.Window.BuffBarUI, buffId: string, level: number) : Witch.UI.Window.BuffBarUI
---@param buffConfig IBuffItemConfig
---@return Witch.UI.Window.BuffBarUI
function Witch.UI.Window.BuffBarUI:AddBuff(buffConfig) end
---@param buffId string
---@return BuffItem
function Witch.UI.Window.BuffBarUI:GetBuff(buffId) end
---@return BuffItem[]
function Witch.UI.Window.BuffBarUI:GetBuffs() end
---@param way string
---@return Witch.UI.Window.BuffBarUI
function Witch.UI.Window.BuffBarUI:CheckAllBuff(way) end
function Witch.UI.Window.BuffBarUI:UpdateAllBuff() end
function Witch.UI.Window.BuffBarUI:PureAllBuff() end
function Witch.UI.Window.BuffBarUI:ClearAllBuff() end

---@class Witch.UI.Window.FightUI : Witch.UI.UIBase
---@field LastCard DataConfig
---@field cardItemList System.Collections.Generic.List
---@field SelectedCard System.Collections.Generic.List
---@field WaitCard System.Collections.Generic.List
---@field IsReset boolean
---@field SpecialCount number
---@field InIEn boolean
---@field SelectType string
---@field CanBeforeEnd boolean
---@field Card_y_position number
---@field started boolean
---@field chest UnityEngine.GameObject
---@field ShouldCard number
---@field cardContainer CardContainer
---@field selectCardContainer CardContainer
---@field StatusList System.Collections.Generic.List
---@field totalDamageText System.Collections.Generic.Dictionary
---@field autoCard boolean
---@field ConfirmButton UnityEngine.Transform
---@field endfight UnityEngine.Transform
---@field FightAgain UnityEngine.Transform
---@field UsedCardList UnityEngine.Transform
---@field turnButton Michsky.MUIP.ButtonManager
---@field NeedUpdateCardMsg boolean
---@field instance UnityEngine.GameObject
---@field animationQueue System.Collections.Generic.Queue
---@field blurReturn boolean
---@field NowAnimation boolean
---@field ItemSum System.Collections.Generic.Dictionary
---@field CardTopCount number
Witch.UI.Window.FightUI = {}
---@alias CS.Witch.UI.Window.FightUI Witch.UI.Window.FightUI
CS.Witch.UI.Window.FightUI = Witch.UI.Window.FightUI

function Witch.UI.Window.FightUI:OnDestroy() end
function Witch.UI.Window.FightUI:Close() end
---@param text string
---@param position UnityEngine.Vector3
---@param popUpType1 string
---@param status StatusManager
---@param to StatusManager
---@param realDamage string
function Witch.UI.Window.FightUI:EnqueueDamageText(text, position, popUpType1, status, to, realDamage) end
---@param obj FightObject
---@param index number
---@param count number
function Witch.UI.Window.FightUI:SetTurn(obj, index, count) end
function Witch.UI.Window.FightUI:ShowChest() end
function Witch.UI.Window.FightUI:AutoUseCard() end
function Witch.UI.Window.FightUI:ShowTitle() end
function Witch.UI.Window.FightUI:Init() end
function Witch.UI.Window.FightUI:InitSkill() end
---@param tempItem UnityEngine.Transform
---@param index number
function Witch.UI.Window.FightUI:CreateSkillItem(tempItem, index) end
function Witch.UI.Window.FightUI:UpdateSkill() end
function Witch.UI.Window.FightUI:CreateDeckMenu() end
function Witch.UI.Window.FightUI:CreateUsedCardList() end
function Witch.UI.Window.FightUI:UpdatePower() end
function Witch.UI.Window.FightUI:FightAgainBtn() end
function Witch.UI.Window.FightUI:ResetButtonCheck() end
function Witch.UI.Window.FightUI:Reset() end
function Witch.UI.Window.FightUI:onChangeTurnBtn() end
---@overload fun(self: Witch.UI.Window.FightUI, Count: number)
---@param dataConfig DataConfig
function Witch.UI.Window.FightUI:CreateCardItem(dataConfig) end
---@param OnComplete DG.Tweening.TweenCallback
---@param from CardContainer
function Witch.UI.Window.FightUI:UpdateCardItemPos(OnComplete, from) end
function Witch.UI.Window.FightUI:ShuffleCardItems() end
function Witch.UI.Window.FightUI:UpdateCardMsg() end
function Witch.UI.Window.FightUI:UpdateCardsShow() end
function Witch.UI.Window.FightUI:RemoveAllCards() end
---@param val string
---@param Type string
function Witch.UI.Window.FightUI:ThrowCardScript(val, Type) end
---@param val string
---@param Type string
function Witch.UI.Window.FightUI:Burning(val, Type) end
---@param val string
---@param onCardSelected System.Action | function
---@param Type string
function Witch.UI.Window.FightUI:SelectCardToAction(val, onCardSelected, Type) end
---@return number
function Witch.UI.Window.FightUI:BurnAndThrowCheck() end
---@param cardItem CardItem
function Witch.UI.Window.FightUI:BurnCard(cardItem) end
---@param uitype string
function Witch.UI.Window.FightUI:SelectInit(uitype) end
function Witch.UI.Window.FightUI:ShowBattleReward() end
function Witch.UI.Window.FightUI:CanWin() end
function Witch.UI.Window.FightUI:EndInstance() end
function Witch.UI.Window.FightUI:Yes() end
---@return boolean
function Witch.UI.Window.FightUI:AllCannotUse() end
---@param scriptExecutor IScriptExecutor
function Witch.UI.Window.FightUI:CallActionAnimation(scriptExecutor) end
function Witch.UI.Window.FightUI:DOActionAnimation() end
---@param cardUseData Fight.ActionCommand.UseCard.CardUseData
---@param toThrow boolean
---@param needInit boolean
function Witch.UI.Window.FightUI:DoCardUseAnimation(cardUseData, toThrow, needInit) end

---@class Witch.UI.Window.FightUI.DamageTextInfo : System.Object
---@field text string
---@field position UnityEngine.Vector2
---@field popUpType string
---@field status StatusManager
---@field to StatusManager
---@field realDamage string
Witch.UI.Window.FightUI.DamageTextInfo = {}
---@alias CS.Witch.UI.Window.FightUI.DamageTextInfo Witch.UI.Window.FightUI.DamageTextInfo
CS.Witch.UI.Window.FightUI.DamageTextInfo = Witch.UI.Window.FightUI.DamageTextInfo

---@return Witch.UI.Window.FightUI.DamageTextInfo
function Witch.UI.Window.FightUI.DamageTextInfo.New() end

---@class Witch.UI.Window.FightUI.AnimationData : System.ValueType
---@field status StatusManager[]
---@field animationState IStatusManager.AnimatedState[]
---@field effectName string
Witch.UI.Window.FightUI.AnimationData = {}
---@alias CS.Witch.UI.Window.FightUI.AnimationData Witch.UI.Window.FightUI.AnimationData
CS.Witch.UI.Window.FightUI.AnimationData = Witch.UI.Window.FightUI.AnimationData

---@param data Fight.ActionCommand.ActionAnimation.AnimationData
---@return Witch.UI.Window.FightUI.AnimationData
function Witch.UI.Window.FightUI.AnimationData.New(data) end

---@class Witch.UI.Window.LineUI : Witch.UI.UIBase
---@field arcLengthSamples number
Witch.UI.Window.LineUI = {}
---@alias CS.Witch.UI.Window.LineUI Witch.UI.Window.LineUI
CS.Witch.UI.Window.LineUI = Witch.UI.Window.LineUI

---@param pos UnityEngine.Vector3
function Witch.UI.Window.LineUI:SetStartPos(pos) end
---@param pos System.Nullable
function Witch.UI.Window.LineUI:SetEndPos(pos) end
---@param start UnityEngine.Vector3
---@param mid UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function Witch.UI.Window.LineUI:GetBezier(start, mid, _end, t) end
function Witch.UI.Window.LineUI:FadeIn() end
---@param callback System.Action | function
function Witch.UI.Window.LineUI:FadeOut(callback) end
function Witch.UI.Window.LineUI:OnDestroy() end

---@class Witch.UI.Window.PopUpTextUI : UnityEngine.MonoBehaviour
---@field x_position_curve UnityEngine.AnimationCurve
---@field y_position_curve UnityEngine.AnimationCurve
---@field fontsize_curve UnityEngine.AnimationCurve
---@field colors UnityEngine.Gradient
---@field val string
---@field isDestroy boolean
---@field TotalTime number
---@field maxHeight number
---@field maxLength number
---@field maxFontSize number
---@field nowPos UnityEngine.Vector2
---@field start_position UnityEngine.Vector2
---@field time number
---@field existTime number
---@field target string
---@field pause boolean
Witch.UI.Window.PopUpTextUI = {}
---@alias CS.Witch.UI.Window.PopUpTextUI Witch.UI.Window.PopUpTextUI
CS.Witch.UI.Window.PopUpTextUI = Witch.UI.Window.PopUpTextUI

---@param value number
function Witch.UI.Window.PopUpTextUI:SetDisplayInt(value) end
---@return number
function Witch.UI.Window.PopUpTextUI:GetDisplayInt() end
function Witch.UI.Window.PopUpTextUI:InitChange() end
---@param val number
function Witch.UI.Window.PopUpTextUI:SetTextFont(val) end
function Witch.UI.Window.PopUpTextUI:Update() end

---@class Witch.UI.Window.StatusBarUI : UnityEngine.MonoBehaviour
---@field Status StatusManager
---@field hpItemObj UnityEngine.GameObject
---@field buffBarObj UnityEngine.GameObject
---@field hpTxt TMPro.TMP_Text
---@field hpRedImg UnityEngine.SpriteRenderer
---@field hpImg UnityEngine.SpriteRenderer
---@field defendImg UnityEngine.SpriteRenderer
---@field nameObj UnityEngine.GameObject
---@field DefendObj UnityEngine.GameObject
---@field backgroundObj UnityEngine.GameObject
Witch.UI.Window.StatusBarUI = {}
---@alias CS.Witch.UI.Window.StatusBarUI Witch.UI.Window.StatusBarUI
CS.Witch.UI.Window.StatusBarUI = Witch.UI.Window.StatusBarUI

---@param status StatusManager
function Witch.UI.Window.StatusBarUI:Init(status) end
---@param Defend number
---@param CurHp number
---@param MaxHp number
---@param NeedEffect boolean
function Witch.UI.Window.StatusBarUI:UpdateHealthBar(Defend, CurHp, MaxHp, NeedEffect) end
function Witch.UI.Window.StatusBarUI:OnSelected() end
function Witch.UI.Window.StatusBarUI:OnUnSelected() end

---@class Witch.UI.Window.CardPackItem : UnityEngine.MonoBehaviour
---@field cardPackUI Witch.UI.Window.CardPackUI
---@field dataConfig DataConfig
---@field itemIcon UnityEngine.Sprite
---@field BasicChick boolean
Witch.UI.Window.CardPackItem = {}
---@alias CS.Witch.UI.Window.CardPackItem Witch.UI.Window.CardPackItem
CS.Witch.UI.Window.CardPackItem = Witch.UI.Window.CardPackItem

---@param data DataConfig
function Witch.UI.Window.CardPackItem:Init(data) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.CardPackItem:OnPointerClick(eventData) end
function Witch.UI.Window.CardPackItem:PackCheck() end

---@class Witch.UI.Window.CardPackUI : Witch.UI.UIBase
---@field UseCardPack System.Collections.Generic.HashSet
---@field TotalCardPack System.Collections.Generic.List
---@field CardCount number
---@field RelicCount number
---@field BlessCount number
---@field EnchCount number
---@field ItemPrefab UnityEngine.GameObject
---@field BasicItemPrefab UnityEngine.GameObject
---@field RelicBack UnityEngine.Sprite
---@field ExitButton UnityEngine.GameObject
Witch.UI.Window.CardPackUI = {}
---@alias CS.Witch.UI.Window.CardPackUI Witch.UI.Window.CardPackUI
CS.Witch.UI.Window.CardPackUI = Witch.UI.Window.CardPackUI

function Witch.UI.Window.CardPackUI:DataUpdate() end
function Witch.UI.Window.CardPackUI:Init() end
---@param id string
---@param isEnabled boolean
---@return boolean
function Witch.UI.Window.CardPackUI:SetPackEnabled(id, isEnabled) end
---@param cardPackItem Witch.UI.Window.CardPackItem
function Witch.UI.Window.CardPackUI:ShowInfo(cardPackItem) end
function Witch.UI.Window.CardPackUI:OnDisable() end
function Witch.UI.Window.CardPackUI:OnDestroy() end

---@class Witch.UI.Window.GameEntryUI : Witch.UI.UIBase
---@field selectedSave Data.Save.SaveInfo
---@field playerCount number
---@field partner DataConfig
---@field MainParent UnityEngine.Transform
---@field SecondParent UnityEngine.Transform
---@field selectHardUI Witch.UI.Window.SelectHardUI
---@field cardPackUI Witch.UI.Window.CardPackUI
---@field careerChoiceParent UnityEngine.Transform
---@field partnerChoiceParent UnityEngine.Transform
---@field statueAnim UnityEngine.Animator
---@field SelfInit boolean
---@field waitCount number
---@field showCareers System.Collections.Generic.List
---@field showPartners System.Collections.Generic.List
---@field lastcareer DataConfig
---@field CareerItem System.Collections.Generic.Dictionary
---@field career DataConfig
---@field isHost boolean
Witch.UI.Window.GameEntryUI = {}
---@alias CS.Witch.UI.Window.GameEntryUI Witch.UI.Window.GameEntryUI
CS.Witch.UI.Window.GameEntryUI = Witch.UI.Window.GameEntryUI

function Witch.UI.Window.GameEntryUI:Init() end
function Witch.UI.Window.GameEntryUI:CloseAllWindows() end
function Witch.UI.Window.GameEntryUI:DataUpdate() end
function Witch.UI.Window.GameEntryUI:Outlobby() end
function Witch.UI.Window.GameEntryUI:ReturnHouse() end
function Witch.UI.Window.GameEntryUI:Close() end
---@param ready boolean
function Witch.UI.Window.GameEntryUI:ChangeReady(ready) end
---@param ready boolean
---@param playerId string
function Witch.UI.Window.GameEntryUI:SetReady(ready, playerId) end
function Witch.UI.Window.GameEntryUI:StartGame() end
function Witch.UI.Window.GameEntryUI:NormalGame() end
function Witch.UI.Window.GameEntryUI:OpenChoice() end
function Witch.UI.Window.GameEntryUI:OpenWindow() end
function Witch.UI.Window.GameEntryUI:CloseWindow() end
function Witch.UI.Window.GameEntryUI:OpenSelectHard() end
---@param players System.Collections.Generic.List
function Witch.UI.Window.GameEntryUI:UpdateLobby(players) end
function Witch.UI.Window.GameEntryUI:ShowCareer() end
---@param thiscareer Witch.UI.Window.ShowCareer
---@param way string
function Witch.UI.Window.GameEntryUI:ShowDetail(thiscareer, way) end
---@param thiscareer DataConfig
---@param type string
function Witch.UI.Window.GameEntryUI:ChangeCareerDesShow(thiscareer, type) end
---@param varName string
---@param type string
function Witch.UI.Window.GameEntryUI:SelectVar(varName, type) end
---@param dataConfig DataConfig
---@param fromId string
function Witch.UI.Window.GameEntryUI:ChangeRole(dataConfig, fromId) end

---@class Witch.UI.Window.PackShowItem : Witch.UI.Window.ItemNonDrag
Witch.UI.Window.PackShowItem = {}
---@alias CS.Witch.UI.Window.PackShowItem Witch.UI.Window.PackShowItem
CS.Witch.UI.Window.PackShowItem = Witch.UI.Window.PackShowItem

---@param data DataConfig
function Witch.UI.Window.PackShowItem:Init(data) end
function Witch.UI.Window.PackShowItem:DataUpdate() end

---@class Witch.UI.Window.GameExitUI : Witch.UI.UIBase
---@field loss boolean
---@field BlackMask UnityEngine.UI.Image
---@field MainContent UnityEngine.Transform
---@field sr UnityEngine.SpriteRenderer
---@field ExpLevel TMPro.TMP_Text
---@field BaseTran UnityEngine.Transform
---@field MulTran UnityEngine.Transform
---@field TrueCount number
---@field gameRuntimeData GameRuntimeData
Witch.UI.Window.GameExitUI = {}
---@alias CS.Witch.UI.Window.GameExitUI Witch.UI.Window.GameExitUI
CS.Witch.UI.Window.GameExitUI = Witch.UI.Window.GameExitUI

function Witch.UI.Window.GameExitUI:NextShow() end
function Witch.UI.Window.GameExitUI:OnDestroy() end
function Witch.UI.Window.GameExitUI:ReturnAsync() end

---@class Witch.UI.Window.SlotSettlementUI : Witch.UI.UIBase
---@field PendingTitle string
---@field PendingSummary string
---@field PendingScore number
---@field PendingChipValue number
---@field PendingTruthReward number
---@field PendingExpGain number
---@field PendingBreakdown System.Collections.Generic.Dictionary
---@field PendingOnConfirm System.Action | function
Witch.UI.Window.SlotSettlementUI = {}
---@alias CS.Witch.UI.Window.SlotSettlementUI Witch.UI.Window.SlotSettlementUI
CS.Witch.UI.Window.SlotSettlementUI = Witch.UI.Window.SlotSettlementUI

function Witch.UI.Window.SlotSettlementUI.EndRunAndReturnToMenu() end
function Witch.UI.Window.SlotSettlementUI:ConfirmAndExit() end

---@class Witch.UI.Window.HouseUI : UnityEngine.MonoBehaviour
---@field CanScroll boolean
---@field storehouseUI Witch.UI.Window.StorehouseUI
---@field houseRect UnityEngine.RectTransform
---@field targetCamera UnityEngine.Camera
---@field minScale number
Witch.UI.Window.HouseUI = {}
---@alias CS.Witch.UI.Window.HouseUI Witch.UI.Window.HouseUI
CS.Witch.UI.Window.HouseUI = Witch.UI.Window.HouseUI

function Witch.UI.Window.HouseUI:ShadowChat() end
function Witch.UI.Window.HouseUI:StartShop() end
function Witch.UI.Window.HouseUI:OnClickCardEditor() end
function Witch.UI.Window.HouseUI:OpenStorehouse() end
function Witch.UI.Window.HouseUI:OpenDictionary() end
function Witch.UI.Window.HouseUI:OnClickMod() end
function Witch.UI.Window.HouseUI:ReturnMenu() end
---@param houseItemType HouseItem.HouseItemType
function Witch.UI.Window.HouseUI:ClickItem(houseItemType) end
function Witch.UI.Window.HouseUI:OpenAnnouncement() end
function Witch.UI.Window.HouseUI:OnDestroy() end

---@class Witch.UI.Window.IllustratedBookUI : Witch.UI.UIBase
---@field MsgContent UnityEngine.RectTransform
Witch.UI.Window.IllustratedBookUI = {}
---@alias CS.Witch.UI.Window.IllustratedBookUI Witch.UI.Window.IllustratedBookUI
CS.Witch.UI.Window.IllustratedBookUI = Witch.UI.Window.IllustratedBookUI


---@class Witch.UI.Window.BlessItem : Witch.UI.Window.DictionaryItem
Witch.UI.Window.BlessItem = {}
---@alias CS.Witch.UI.Window.BlessItem Witch.UI.Window.BlessItem
CS.Witch.UI.Window.BlessItem = Witch.UI.Window.BlessItem

---@param dataConfig DataConfig
function Witch.UI.Window.BlessItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.BlessItem:OnPointerClick(eventData) end
---@param itemTran UnityEngine.Transform
function Witch.UI.Window.BlessItem:BindDictionaryDescription(itemTran) end

---@class Witch.UI.Window.CardChoiceItem : UnityEngine.MonoBehaviour
---@field objectGroup ObjectGroup
Witch.UI.Window.CardChoiceItem = {}
---@alias CS.Witch.UI.Window.CardChoiceItem Witch.UI.Window.CardChoiceItem
CS.Witch.UI.Window.CardChoiceItem = Witch.UI.Window.CardChoiceItem

---@param UI Witch.UI.Window.CardChoiceUI
---@param fromId string
function Witch.UI.Window.CardChoiceItem:Initialize(UI, fromId) end
---@param delay number
function Witch.UI.Window.CardChoiceItem:FadeIn(delay) end
function Witch.UI.Window.CardChoiceItem:DataUpdate() end
---@param delay number
function Witch.UI.Window.CardChoiceItem:FadeOut(delay) end
function Witch.UI.Window.CardChoiceItem:MoveToDeck() end

---@class Witch.UI.Window.CardEnchUI : Witch.UI.Window.ShopUI
Witch.UI.Window.CardEnchUI = {}
---@alias CS.Witch.UI.Window.CardEnchUI Witch.UI.Window.CardEnchUI
CS.Witch.UI.Window.CardEnchUI = Witch.UI.Window.CardEnchUI

function Witch.UI.Window.CardEnchUI:SetShopItems() end
function Witch.UI.Window.CardEnchUI:UpdateEnchShow() end
---@param enchItem Witch.UI.Window.ShopItem
function Witch.UI.Window.CardEnchUI:ShowCardToEnch(enchItem) end

---@class Witch.UI.Window.DictBuffItem : Witch.UI.Window.DictionaryItem
Witch.UI.Window.DictBuffItem = {}
---@alias CS.Witch.UI.Window.DictBuffItem Witch.UI.Window.DictBuffItem
CS.Witch.UI.Window.DictBuffItem = Witch.UI.Window.DictBuffItem

function Witch.UI.Window.DictBuffItem:DataUpdate() end
---@param dataConfig DataConfig
function Witch.UI.Window.DictBuffItem:Init(dataConfig) end
function Witch.UI.Window.DictBuffItem:SetName() end

---@class Witch.UI.Window.DictEnchItem : Witch.UI.Window.DictionaryItem
Witch.UI.Window.DictEnchItem = {}
---@alias CS.Witch.UI.Window.DictEnchItem Witch.UI.Window.DictEnchItem
CS.Witch.UI.Window.DictEnchItem = Witch.UI.Window.DictEnchItem

function Witch.UI.Window.DictEnchItem:DataUpdate() end
---@param dataConfig DataConfig
function Witch.UI.Window.DictEnchItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictEnchItem:OnPointerClick(eventData) end
function Witch.UI.Window.DictEnchItem:SetName() end

---@class Witch.UI.Window.DictionaryItem : Witch.UI.Window.ItemNonDrag
---@field dictionaryUI Witch.UI.Window.DictionaryUI
Witch.UI.Window.DictionaryItem = {}
---@alias CS.Witch.UI.Window.DictionaryItem Witch.UI.Window.DictionaryItem
CS.Witch.UI.Window.DictionaryItem = Witch.UI.Window.DictionaryItem

---@param dataConfig DataConfig
function Witch.UI.Window.DictionaryItem:Init(dataConfig) end
function Witch.UI.Window.DictionaryItem:Awake() end
function Witch.UI.Window.DictionaryItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictionaryItem:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictionaryItem:OnPointerEnter(eventData) end

---@class Witch.UI.Window.DictionaryShowItem : Witch.UI.Window.ItemNonDrag
---@field dictionaryUI Witch.UI.Window.DictionaryUI
---@field defaultCount number
Witch.UI.Window.DictionaryShowItem = {}
---@alias CS.Witch.UI.Window.DictionaryShowItem Witch.UI.Window.DictionaryShowItem
CS.Witch.UI.Window.DictionaryShowItem = Witch.UI.Window.DictionaryShowItem

---@param dataConfig DataConfig
function Witch.UI.Window.DictionaryShowItem:InitEnch(dataConfig) end
---@param dataConfig DataConfig
function Witch.UI.Window.DictionaryShowItem:Init(dataConfig) end
function Witch.UI.Window.DictionaryShowItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictionaryShowItem:OnPointerEnter(eventData) end
function Witch.UI.Window.DictionaryShowItem:ShowFloatingWindow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictionaryShowItem:OnPointerClick(eventData) end

---@class Witch.UI.Window.DictItem : Witch.UI.Window.DictionaryItem
Witch.UI.Window.DictItem = {}
---@alias CS.Witch.UI.Window.DictItem Witch.UI.Window.DictItem
CS.Witch.UI.Window.DictItem = Witch.UI.Window.DictItem

---@param dataConfig DataConfig
function Witch.UI.Window.DictItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictItem:OnPointerEnter(eventData) end
---@param newTransform UnityEngine.Transform
function Witch.UI.Window.DictItem:SetCardMsg(newTransform) end
function Witch.UI.Window.DictItem:DataUpdate() end

---@class Witch.UI.Window.DictTagItem : UnityEngine.MonoBehaviour
---@field TagType string
---@field tagName string
Witch.UI.Window.DictTagItem = {}
---@alias CS.Witch.UI.Window.DictTagItem Witch.UI.Window.DictTagItem
CS.Witch.UI.Window.DictTagItem = Witch.UI.Window.DictTagItem

---@overload fun(self: Witch.UI.Window.DictTagItem, name: string, dictionaryUI: Witch.UI.Window.DictionaryUI)
---@param dictionaryUI Witch.UI.Window.DictionaryUI
function Witch.UI.Window.DictTagItem:Init(dictionaryUI) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.DictTagItem:OnPointerClick(eventData) end
function Witch.UI.Window.DictTagItem:ReturnNormal() end
function Witch.UI.Window.DictTagItem:RegisterEvent() end
function Witch.UI.Window.DictTagItem:DataUpdate() end
function Witch.UI.Window.DictTagItem:ClearEvent() end

---@class Witch.UI.Window.EnemyItem : Witch.UI.Window.DictionaryItem
---@field MapName System.Collections.Generic.Dictionary
Witch.UI.Window.EnemyItem = {}
---@alias CS.Witch.UI.Window.EnemyItem Witch.UI.Window.EnemyItem
CS.Witch.UI.Window.EnemyItem = Witch.UI.Window.EnemyItem

function Witch.UI.Window.EnemyItem:DataUpdate() end
---@param dataConfig DataConfig
function Witch.UI.Window.EnemyItem:Init(dataConfig) end
function Witch.UI.Window.EnemyItem:SetName() end

---@class Witch.UI.Window.Item : UnityEngine.MonoBehaviour
---@field rareLevel string
---@field itemId string
---@field Rarity string
---@field ifEquipped boolean
---@field color string
---@field keywords System.Collections.Generic.List
---@field dataConfig DataConfig
---@field ItemType string
---@field itemIcon UnityEngine.Sprite
---@field itemPrice number
---@field lastPos UnityEngine.Vector2
---@field canClick boolean
---@field lastParent UnityEngine.Transform
---@field isHover boolean
---@field isDrag boolean
---@field keywordDisplay Witch.UI.KeywordDisplay
---@field floatingWindow FloatingWindow
---@field itemName string
---@field itemDescription string
---@field itemTip string
Witch.UI.Window.Item = {}
---@alias CS.Witch.UI.Window.Item Witch.UI.Window.Item
CS.Witch.UI.Window.Item = Witch.UI.Window.Item

function Witch.UI.Window.Item:Awake() end
---@param dataConfig DataConfig
function Witch.UI.Window.Item:Init(dataConfig) end
function Witch.UI.Window.Item:DataUpdate() end
function Witch.UI.Window.Item:RegisterEvent() end
function Witch.UI.Window.Item:ClearEvent() end
---@return string
function Witch.UI.Window.Item:CreateTooltipText() end
function Witch.UI.Window.Item:ShowFloatingWindow() end
function Witch.UI.Window.Item:HideFloatingWindow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnEndDrag(eventData) end
---@param item SwapContentIdentity
function Witch.UI.Window.Item:AddToList(item) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.Item:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
---@return UnityEngine.Vector2
function Witch.UI.Window.Item:GetMousePos(eventData) end
function Witch.UI.Window.Item:OnDestroy() end
function Witch.UI.Window.Item:OnTransformParentChanged() end
function Witch.UI.Window.Item:RemoveFromParent() end
function Witch.UI.Window.Item:AddToParent() end

---@class Witch.UI.Window.ItemNonDrag : Witch.UI.Window.Item
Witch.UI.Window.ItemNonDrag = {}
---@alias CS.Witch.UI.Window.ItemNonDrag Witch.UI.Window.ItemNonDrag
CS.Witch.UI.Window.ItemNonDrag = Witch.UI.Window.ItemNonDrag

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ItemNonDrag:OnInitializePotentialDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ItemNonDrag:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ItemNonDrag:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ItemNonDrag:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ItemNonDrag:OnPointerClick(eventData) end
function Witch.UI.Window.ItemNonDrag:OnDestroy() end

---@class Witch.UI.Window.PageItem : UnityEngine.MonoBehaviour
---@field dictionaryUI Witch.UI.Window.DictionaryUI
---@field PageIndex number
---@field Clickable boolean
Witch.UI.Window.PageItem = {}
---@alias CS.Witch.UI.Window.PageItem Witch.UI.Window.PageItem
CS.Witch.UI.Window.PageItem = Witch.UI.Window.PageItem

---@param pointerEvent UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.PageItem:OnPointerClick(pointerEvent) end

---@class Witch.UI.Window.RelicItemConfig : Witch.UI.Window.Item
---@field glowMaterial UnityEngine.Material
Witch.UI.Window.RelicItemConfig = {}
---@alias CS.Witch.UI.Window.RelicItemConfig Witch.UI.Window.RelicItemConfig
CS.Witch.UI.Window.RelicItemConfig = Witch.UI.Window.RelicItemConfig

function Witch.UI.Window.RelicItemConfig:ShowFloatingWindow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.RelicItemConfig:OnBeginDrag(eventData) end
---@param dataConfig DataConfig
function Witch.UI.Window.RelicItemConfig:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.RelicItemConfig:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.RelicItemConfig:OnEndDrag(eventData) end
function Witch.UI.Window.RelicItemConfig:OnTransformParentChanged() end
---@param enable boolean
function Witch.UI.Window.RelicItemConfig:SetGlowEvent(enable) end
function Witch.UI.Window.RelicItemConfig:EffectAnimation() end

---@class Witch.UI.Window.ResultItem : Witch.UI.Window.ItemNonDrag
---@field canright boolean
---@field outside boolean
Witch.UI.Window.ResultItem = {}
---@alias CS.Witch.UI.Window.ResultItem Witch.UI.Window.ResultItem
CS.Witch.UI.Window.ResultItem = Witch.UI.Window.ResultItem

---@param dataConfig DataConfig
function Witch.UI.Window.ResultItem:Init(dataConfig) end
function Witch.UI.Window.ResultItem:KeyworsDis() end
function Witch.UI.Window.ResultItem:HideFloatingWindow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ResultItem:OnPointerClick(eventData) end
---@return string
function Witch.UI.Window.ResultItem:CreateTooltipText() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ResultItem:OnBeginDrag(eventData) end

---@class Witch.UI.Window.ShowCard : Witch.UI.Window.Item
---@field cardShowUI Witch.UI.Window.OutDeckUI
---@field DestroyCost number
Witch.UI.Window.ShowCard = {}
---@alias CS.Witch.UI.Window.ShowCard Witch.UI.Window.ShowCard
CS.Witch.UI.Window.ShowCard = Witch.UI.Window.ShowCard

---@param dataConfig DataConfig
---@param ifequipped boolean
---@param fromSelf boolean
function Witch.UI.Window.ShowCard:Init(dataConfig, ifequipped, fromSelf) end
function Witch.UI.Window.ShowCard:DataUpdate() end
function Witch.UI.Window.ShowCard:MoveItem() end
function Witch.UI.Window.ShowCard:ShowFloatingWindow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnPointerClick(eventData) end
function Witch.UI.Window.ShowCard:DecomposeItem() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnDrag(eventData) end
function Witch.UI.Window.ShowCard:ItemCheck() end
function Witch.UI.Window.ShowCard:SellItem() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnEndDrag(eventData) end
---@param content SwapContentIdentity
function Witch.UI.Window.ShowCard:AddToList(content) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowCard:OnPointerExit(eventData) end

---@class Witch.UI.Window.ShowVarItem : UnityEngine.MonoBehaviour
---@field text string
Witch.UI.Window.ShowVarItem = {}
---@alias CS.Witch.UI.Window.ShowVarItem Witch.UI.Window.ShowVarItem
CS.Witch.UI.Window.ShowVarItem = Witch.UI.Window.ShowVarItem

function Witch.UI.Window.ShowVarItem:Start() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowVarItem:OnPointerClick(eventData) end
function Witch.UI.Window.ShowVarItem:Show() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShowVarItem:OnPointerExit(eventData) end

---@class Witch.UI.Window.StorehouseItem : Witch.UI.Window.ItemNonDrag
---@field storehouseUI Witch.UI.Window.StorehouseUI
Witch.UI.Window.StorehouseItem = {}
---@alias CS.Witch.UI.Window.StorehouseItem Witch.UI.Window.StorehouseItem
CS.Witch.UI.Window.StorehouseItem = Witch.UI.Window.StorehouseItem

function Witch.UI.Window.StorehouseItem:Start() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.StorehouseItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.StorehouseItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.StorehouseItem:OnPointerClick(eventData) end

---@class Witch.UI.Window.MainMenuUI : Witch.UI.UIBase
Witch.UI.Window.MainMenuUI = {}
---@alias CS.Witch.UI.Window.MainMenuUI Witch.UI.Window.MainMenuUI
CS.Witch.UI.Window.MainMenuUI = Witch.UI.Window.MainMenuUI

function Witch.UI.Window.MainMenuUI:DataUpdate() end
function Witch.UI.Window.MainMenuUI:StartGame() end
function Witch.UI.Window.MainMenuUI:CloseTheGame() end
function Witch.UI.Window.MainMenuUI:ShowAck() end
---@param url string
function Witch.UI.Window.MainMenuUI:OpenWebsite(url) end
function Witch.UI.Window.MainMenuUI:OpenSettings() end
function Witch.UI.Window.MainMenuUI:OnClickMod() end
function Witch.UI.Window.MainMenuUI:OnDisable() end

---@class Witch.UI.Window.MapDrawInputLayer : UnityEngine.MonoBehaviour
---@field Owner Witch.UI.Window.MapSelectUI
Witch.UI.Window.MapDrawInputLayer = {}
---@alias CS.Witch.UI.Window.MapDrawInputLayer Witch.UI.Window.MapDrawInputLayer
CS.Witch.UI.Window.MapDrawInputLayer = Witch.UI.Window.MapDrawInputLayer

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.MapDrawInputLayer:OnPointerDown(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.MapDrawInputLayer:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.MapDrawInputLayer:OnPointerUp(eventData) end

---@class Witch.UI.Window.MapSelectUI : Witch.UI.UIBase
---@field cardContainer CardContainer
---@field ground_y number
---@field groundPos UnityEngine.Transform
---@field EreaseBtn Michsky.MUIP.ButtonManager
---@field QuillBtn Michsky.MUIP.ButtonManager
---@field GarbageBtn Michsky.MUIP.ButtonManager
---@field IsAnimating boolean
Witch.UI.Window.MapSelectUI = {}
---@alias CS.Witch.UI.Window.MapSelectUI Witch.UI.Window.MapSelectUI
CS.Witch.UI.Window.MapSelectUI = Witch.UI.Window.MapSelectUI

function Witch.UI.Window.MapSelectUI.ClearPersistedDrawLayer() end
function Witch.UI.Window.MapSelectUI:FadeIn() end
function Witch.UI.Window.MapSelectUI:DataUpdate() end
function Witch.UI.Window.MapSelectUI:ResetBackCard() end
function Witch.UI.Window.MapSelectUI:TryContinue() end
function Witch.UI.Window.MapSelectUI:UpdateCardItemPos() end
function Witch.UI.Window.MapSelectUI:ReadyToSelect() end
---@param nodes System.Collections.Generic.List
function Witch.UI.Window.MapSelectUI:CreateMapItem(nodes) end
function Witch.UI.Window.MapSelectUI:MapAnimation() end
function Witch.UI.Window.MapSelectUI:SendNode() end
function Witch.UI.Window.MapSelectUI:ShowMap() end
function Witch.UI.Window.MapSelectUI:SpecialShow() end
---@param count number
function Witch.UI.Window.MapSelectUI:CreateNodes(count) end
---@return MapTree.Node[]
function Witch.UI.Window.MapSelectUI:GetNodes() end
function Witch.UI.Window.MapSelectUI:SetNodes() end
function Witch.UI.Window.MapSelectUI:OnDestroy() end
---@param localPoint UnityEngine.Vector2
function Witch.UI.Window.MapSelectUI:HandleDrawPointerDown(localPoint) end
---@param localPoint UnityEngine.Vector2
function Witch.UI.Window.MapSelectUI:HandleDrawPointerDrag(localPoint) end
---@param localPoint UnityEngine.Vector2
function Witch.UI.Window.MapSelectUI:HandleDrawPointerUp(localPoint) end
---@param strokeId string
---@param authorId string
---@param localPoint UnityEngine.Vector2
function Witch.UI.Window.MapSelectUI:ReceiveNetworkDrawBegin(strokeId, authorId, localPoint) end
---@param strokeId string
---@param authorId string
---@param localPoint UnityEngine.Vector2
function Witch.UI.Window.MapSelectUI:ReceiveNetworkDrawPoint(strokeId, authorId, localPoint) end
---@param strokeId string
---@param authorId string
function Witch.UI.Window.MapSelectUI:ReceiveNetworkDrawEnd(strokeId, authorId) end
---@param authorId string
---@param localPoint UnityEngine.Vector2
---@param radius number
function Witch.UI.Window.MapSelectUI:ReceiveNetworkErase(authorId, localPoint, radius) end
---@param authorId string
function Witch.UI.Window.MapSelectUI:ReceiveNetworkClearAll(authorId) end

---@class Witch.UI.Window.MapSelectUI.DrawToolMode
---@field None Witch.UI.Window.MapSelectUI.DrawToolMode
---@field Quill Witch.UI.Window.MapSelectUI.DrawToolMode
---@field Eraser Witch.UI.Window.MapSelectUI.DrawToolMode
Witch.UI.Window.MapSelectUI.DrawToolMode = {}
---@alias CS.Witch.UI.Window.MapSelectUI.DrawToolMode Witch.UI.Window.MapSelectUI.DrawToolMode
CS.Witch.UI.Window.MapSelectUI.DrawToolMode = Witch.UI.Window.MapSelectUI.DrawToolMode


---@class Witch.UI.Window.MapSelectUI.MapDrawStroke : System.Object
---@field StrokeId string
---@field AuthorId string
---@field Root UnityEngine.RectTransform
---@field Points System.Collections.Generic.List
---@field Segments System.Collections.Generic.List
Witch.UI.Window.MapSelectUI.MapDrawStroke = {}
---@alias CS.Witch.UI.Window.MapSelectUI.MapDrawStroke Witch.UI.Window.MapSelectUI.MapDrawStroke
CS.Witch.UI.Window.MapSelectUI.MapDrawStroke = Witch.UI.Window.MapSelectUI.MapDrawStroke

---@return Witch.UI.Window.MapSelectUI.MapDrawStroke
function Witch.UI.Window.MapSelectUI.MapDrawStroke.New() end

---@class Witch.UI.Window.MapSelectUI.MapDrawSegment : System.Object
---@field RectTransform UnityEngine.RectTransform
---@field Start UnityEngine.Vector2
---@field End UnityEngine.Vector2
Witch.UI.Window.MapSelectUI.MapDrawSegment = {}
---@alias CS.Witch.UI.Window.MapSelectUI.MapDrawSegment Witch.UI.Window.MapSelectUI.MapDrawSegment
CS.Witch.UI.Window.MapSelectUI.MapDrawSegment = Witch.UI.Window.MapSelectUI.MapDrawSegment

---@return Witch.UI.Window.MapSelectUI.MapDrawSegment
function Witch.UI.Window.MapSelectUI.MapDrawSegment.New() end

---@class Witch.UI.Window.SlotMachHandLayer
---@field Front Witch.UI.Window.SlotMachHandLayer
---@field A Witch.UI.Window.SlotMachHandLayer
---@field Behind Witch.UI.Window.SlotMachHandLayer
---@field B Witch.UI.Window.SlotMachHandLayer
Witch.UI.Window.SlotMachHandLayer = {}
---@alias CS.Witch.UI.Window.SlotMachHandLayer Witch.UI.Window.SlotMachHandLayer
CS.Witch.UI.Window.SlotMachHandLayer = Witch.UI.Window.SlotMachHandLayer


---@class Witch.UI.Window.SlotMachHandAnimation
---@field Wait1 Witch.UI.Window.SlotMachHandAnimation
---@field Wait2 Witch.UI.Window.SlotMachHandAnimation
---@field Pick1 Witch.UI.Window.SlotMachHandAnimation
---@field Pick2 Witch.UI.Window.SlotMachHandAnimation
---@field Pick3 Witch.UI.Window.SlotMachHandAnimation
Witch.UI.Window.SlotMachHandAnimation = {}
---@alias CS.Witch.UI.Window.SlotMachHandAnimation Witch.UI.Window.SlotMachHandAnimation
CS.Witch.UI.Window.SlotMachHandAnimation = Witch.UI.Window.SlotMachHandAnimation


---@class Witch.UI.Window.SlotMachHandAnimationSeries
---@field Pick Witch.UI.Window.SlotMachHandAnimationSeries
---@field Collect Witch.UI.Window.SlotMachHandAnimationSeries
Witch.UI.Window.SlotMachHandAnimationSeries = {}
---@alias CS.Witch.UI.Window.SlotMachHandAnimationSeries Witch.UI.Window.SlotMachHandAnimationSeries
CS.Witch.UI.Window.SlotMachHandAnimationSeries = Witch.UI.Window.SlotMachHandAnimationSeries


---@class Witch.UI.Window.SlotMachHand : UnityEngine.MonoBehaviour
Witch.UI.Window.SlotMachHand = {}
---@alias CS.Witch.UI.Window.SlotMachHand Witch.UI.Window.SlotMachHand
CS.Witch.UI.Window.SlotMachHand = Witch.UI.Window.SlotMachHand

---@param slot Witch.SlotMachSlotItem
---@param targetParent UnityEngine.RectTransform
---@param targetAnchoredPosition System.Nullable
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand:BeginTransfer(slot, targetParent, targetAnchoredPosition) end
---@param layer Witch.UI.Window.SlotMachHandLayer
---@param animation Witch.UI.Window.SlotMachHandAnimation
---@param loop boolean
---@param onComplete System.Action | function
function Witch.UI.Window.SlotMachHand:PlayAnimation(layer, animation, loop, onComplete) end
---@param layer Witch.UI.Window.SlotMachHandLayer
---@param visible boolean
function Witch.UI.Window.SlotMachHand:SetLayerVisible(layer, visible) end
---@param layer Witch.UI.Window.SlotMachHandLayer
---@param clearSprite boolean
function Witch.UI.Window.SlotMachHand:StopAnimation(layer, clearSprite) end
---@param clearSprite boolean
function Witch.UI.Window.SlotMachHand:StopAllAnimations(clearSprite) end

---@class Witch.UI.Window.SlotMachHand.TransferRequest : System.Object
---@field slot Witch.SlotMachSlotItem
---@field targetParent UnityEngine.RectTransform
---@field targetAnchoredPosition UnityEngine.Vector2
---@field skipPlayback boolean
---@field doPick boolean
---@field doMoveToTarget boolean
---@field doDrop boolean
---@field doReturnHome boolean
---@field animationSeries Witch.UI.Window.SlotMachHandAnimationSeries
---@field onComplete System.Action | function
Witch.UI.Window.SlotMachHand.TransferRequest = {}
---@alias CS.Witch.UI.Window.SlotMachHand.TransferRequest Witch.UI.Window.SlotMachHand.TransferRequest
CS.Witch.UI.Window.SlotMachHand.TransferRequest = Witch.UI.Window.SlotMachHand.TransferRequest

---@return Witch.UI.Window.SlotMachHand.TransferRequest
function Witch.UI.Window.SlotMachHand.TransferRequest.New() end

---@class Witch.UI.Window.SlotMachHand.TransferBuilder : System.Object
Witch.UI.Window.SlotMachHand.TransferBuilder = {}
---@alias CS.Witch.UI.Window.SlotMachHand.TransferBuilder Witch.UI.Window.SlotMachHand.TransferBuilder
CS.Witch.UI.Window.SlotMachHand.TransferBuilder = Witch.UI.Window.SlotMachHand.TransferBuilder

---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:Skip() end
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:Pick() end
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:MoveToTarget() end
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:Drop() end
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:ReturnHome() end
---@param callback System.Action | function
---@return Witch.UI.Window.SlotMachHand.TransferBuilder
function Witch.UI.Window.SlotMachHand.TransferBuilder:OnComplete(callback) end

---@class Witch.UI.Window.SlotMachUI : Witch.UI.Window.MapSelectUI
---@field DayBack UnityEngine.GameObject
---@field NightBack UnityEngine.GameObject
---@field DayCount Michsky.MUIP.ButtonManager
---@field ChoiceCount number
---@field GoodBack UnityEngine.Sprite
---@field BadBack UnityEngine.Sprite
Witch.UI.Window.SlotMachUI = {}
---@alias CS.Witch.UI.Window.SlotMachUI Witch.UI.Window.SlotMachUI
CS.Witch.UI.Window.SlotMachUI = Witch.UI.Window.SlotMachUI

function Witch.UI.Window.SlotMachUI:FadeIn() end
function Witch.UI.Window.SlotMachUI:OnDestroy() end
function Witch.UI.Window.SlotMachUI:OnDisable() end
function Witch.UI.Window.SlotMachUI:DataUpdate() end
function Witch.UI.Window.SlotMachUI:TryChoiceCard() end
function Witch.UI.Window.SlotMachUI:TryChangeMap() end
function Witch.UI.Window.SlotMachUI:TryOutsiderStake() end
function Witch.UI.Window.SlotMachUI:RefreshDayNightUI() end
---@param slot Witch.SlotMachSlotItem
function Witch.UI.Window.SlotMachUI:OnEmbeddedSlotClicked(slot) end
function Witch.UI.Window.SlotMachUI:EmbeddedRandomAgain() end
---@param tokenType string
---@param multiplierFactor number
---@return boolean
function Witch.UI.Window.SlotMachUI:TryUseCoinToken(tokenType, multiplierFactor) end
function Witch.UI.Window.SlotMachUI:UpdateCardItemPos() end
---@param factor number
function Witch.UI.Window.SlotMachUI:EmbeddedUseMultiplierToken(factor) end
function Witch.UI.Window.SlotMachUI:EmbeddedUseMultiplierToken2() end
function Witch.UI.Window.SlotMachUI:EmbeddedUseMultiplierToken5() end
function Witch.UI.Window.SlotMachUI:EmbeddedUseMultiplierToken10() end
function Witch.UI.Window.SlotMachUI:EmbeddedUseMultiplierToken20() end
function Witch.UI.Window.SlotMachUI:EmbeddedUseBonusRewardToken() end
function Witch.UI.Window.SlotMachUI:AddBoss() end
function Witch.UI.Window.SlotMachUI:ReadyToSelect() end
---@param nodes System.Collections.Generic.List
function Witch.UI.Window.SlotMachUI:CreateMapItem(nodes) end
function Witch.UI.Window.SlotMachUI:GenerateCoinItem() end
function Witch.UI.Window.SlotMachUI:SaveMap() end

---@class Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem : System.Object
---@field Id string
---@field Type DataType
---@field Hazard boolean
---@field NodeId string
Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem = {}
---@alias CS.Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem
CS.Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem = Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem

---@return Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem
function Witch.UI.Window.SlotMachUI.AccumulatedSelectionSaveItem.New() end

---@class Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem : System.Object
---@field Key string
---@field NowDiceCursor number
---@field HasNodeDice boolean
---@field NodeDiceCursor number
Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem = {}
---@alias CS.Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem
CS.Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem = Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem

---@return Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem
function Witch.UI.Window.SlotMachUI.PendingDraftDiceSnapshotSaveItem.New() end

---@class Witch.UI.Window.SlotMachUI.ChipVisual : System.Object
---@field gameObject UnityEngine.GameObject
---@field rectTransform UnityEngine.RectTransform
---@field image UnityEngine.UI.Image
---@field denomination number
Witch.UI.Window.SlotMachUI.ChipVisual = {}
---@alias CS.Witch.UI.Window.SlotMachUI.ChipVisual Witch.UI.Window.SlotMachUI.ChipVisual
CS.Witch.UI.Window.SlotMachUI.ChipVisual = Witch.UI.Window.SlotMachUI.ChipVisual

---@return Witch.UI.Window.SlotMachUI.ChipVisual
function Witch.UI.Window.SlotMachUI.ChipVisual.New() end

---@class Witch.UI.Window.SlotRod : UnityEngine.MonoBehaviour
---@field slotMachUI Witch.UI.Window.SlotMachUI
Witch.UI.Window.SlotRod = {}
---@alias CS.Witch.UI.Window.SlotRod Witch.UI.Window.SlotRod
CS.Witch.UI.Window.SlotRod = Witch.UI.Window.SlotRod

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SlotRod:OnPointerClick(eventData) end

---@class Witch.UI.Window.ItemShowUI : Witch.UI.UIBase
Witch.UI.Window.ItemShowUI = {}
---@alias CS.Witch.UI.Window.ItemShowUI Witch.UI.Window.ItemShowUI
CS.Witch.UI.Window.ItemShowUI = Witch.UI.Window.ItemShowUI

---@overload fun(self: Witch.UI.Window.ItemShowUI, dataConfig: DataConfig)
---@param icon UnityEngine.Sprite
---@param title string
---@param description string
---@param tips string
function Witch.UI.Window.ItemShowUI:ShowItem(icon, title, description, tips) end

---@class Witch.UI.Window.TitleUI : Witch.UI.UIBase
Witch.UI.Window.TitleUI = {}
---@alias CS.Witch.UI.Window.TitleUI Witch.UI.Window.TitleUI
CS.Witch.UI.Window.TitleUI = Witch.UI.Window.TitleUI

---@param main string
---@param sub string
---@param type string
function Witch.UI.Window.TitleUI:ShowTitle(main, sub, type) end

---@class Witch.UI.Window.TutorialUI : Witch.UI.UIBase
---@field ItemPrefab UnityEngine.GameObject
---@field SelectSprite UnityEngine.Sprite
---@field UnselectSprite UnityEngine.Sprite
Witch.UI.Window.TutorialUI = {}
---@alias CS.Witch.UI.Window.TutorialUI Witch.UI.Window.TutorialUI
CS.Witch.UI.Window.TutorialUI = Witch.UI.Window.TutorialUI

function Witch.UI.Window.TutorialUI:Awake() end
---@param id string
function Witch.UI.Window.TutorialUI:ShowTutorial(id) end

---@class Witch.UI.Window.ModeChoiceUI : Witch.UI.UIBase
---@field beforeSave System.Collections.Generic.Dictionary
---@field gameEntryUI Witch.UI.Window.GameEntryUI
---@field canClick boolean
Witch.UI.Window.ModeChoiceUI = {}
---@alias CS.Witch.UI.Window.ModeChoiceUI Witch.UI.Window.ModeChoiceUI
CS.Witch.UI.Window.ModeChoiceUI = Witch.UI.Window.ModeChoiceUI

---@param saveInfo Data.Save.SaveInfo
---@return boolean
function Witch.UI.Window.ModeChoiceUI.CheckSave(saveInfo) end
function Witch.UI.Window.ModeChoiceUI:DataUpdate() end
function Witch.UI.Window.ModeChoiceUI:Init() end
---@param modeType string
function Witch.UI.Window.ModeChoiceUI:CreateNewSave(modeType) end
function Witch.UI.Window.ModeChoiceUI:TeachMode() end
function Witch.UI.Window.ModeChoiceUI:NormalMode() end
function Witch.UI.Window.ModeChoiceUI:SlotMode() end
function Witch.UI.Window.ModeChoiceUI:SublimationMode() end
function Witch.UI.Window.ModeChoiceUI:ShowUnDone() end
---@param modeType string
function Witch.UI.Window.ModeChoiceUI:ReturnGame(modeType) end
function Witch.UI.Window.ModeChoiceUI:Close() end
function Witch.UI.Window.ModeChoiceUI:OnDisable() end

---@class Witch.UI.Window.ModManagerUI : Witch.UI.UIBase
---@field UgcModContent UnityEngine.Transform
---@field LocalModContent UnityEngine.Transform
---@field SearchInput TMPro.TMP_InputField
---@field LocalSearchInput TMPro.TMP_InputField
---@field HasChangeMod boolean
---@field TotalModList System.Collections.Generic.List
---@field LocalModList System.Collections.Generic.List
---@field ShopModDesContent UnityEngine.Transform
---@field LocalModDesContent UnityEngine.Transform
Witch.UI.Window.ModManagerUI = {}
---@alias CS.Witch.UI.Window.ModManagerUI Witch.UI.Window.ModManagerUI
CS.Witch.UI.Window.ModManagerUI = Witch.UI.Window.ModManagerUI

function Witch.UI.Window.ModManagerUI:DataUpdate() end
function Witch.UI.Window.ModManagerUI:OnEnable() end
function Witch.UI.Window.ModManagerUI:OnDestroy() end
function Witch.UI.Window.ModManagerUI:RefreshFromUI() end
---@param info Witch.UI.Window.SteamWorkshopModInfo
---@param targetEnabled System.Nullable
---@param refreshList boolean
function Witch.UI.Window.ModManagerUI:ToggleLocalMod(info, targetEnabled, refreshList) end
function Witch.UI.Window.ModManagerUI:RefreshLocalModList() end
function Witch.UI.Window.ModManagerUI:MarkRequiresRestart() end
---@param item Witch.ModItem
function Witch.UI.Window.ModManagerUI:InitDes(item) end
---@param item Witch.ModItem
function Witch.UI.Window.ModManagerUI:TryRefreshDescriptionImage(item) end
function Witch.UI.Window.ModManagerUI:Close() end

---@class Witch.UI.Window.SteamWorkshopBrowser : System.Object
Witch.UI.Window.SteamWorkshopBrowser = {}
---@alias CS.Witch.UI.Window.SteamWorkshopBrowser Witch.UI.Window.SteamWorkshopBrowser
CS.Witch.UI.Window.SteamWorkshopBrowser = Witch.UI.Window.SteamWorkshopBrowser

---@return Witch.UI.Window.SteamWorkshopBrowser
function Witch.UI.Window.SteamWorkshopBrowser.New() end
---@param searchText string
---@param cancellationToken System.Threading.CancellationToken
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Window.SteamWorkshopBrowser:QueryAllModsAsync(searchText, cancellationToken) end

---@class Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall : System.Object
Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall = {}
---@alias CS.Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall
CS.Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall = Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall

---@param handle Steamworks.UGCQueryHandle_t
---@return Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall
function Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall.New(handle) end
---@param cancellationToken System.Threading.CancellationToken
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Window.SteamWorkshopBrowser.WorkshopQueryCall:SendAsync(cancellationToken) end

---@class Witch.UI.Window.SteamWorkshopQueryResult : System.Object
---@field Items System.Collections.Generic.List
---@field TotalMatchingResults number
---@field ErrorMessage string
Witch.UI.Window.SteamWorkshopQueryResult = {}
---@alias CS.Witch.UI.Window.SteamWorkshopQueryResult Witch.UI.Window.SteamWorkshopQueryResult
CS.Witch.UI.Window.SteamWorkshopQueryResult = Witch.UI.Window.SteamWorkshopQueryResult

---@return Witch.UI.Window.SteamWorkshopQueryResult
function Witch.UI.Window.SteamWorkshopQueryResult.New() end

---@class Witch.UI.Window.SteamWorkshopQueryPage : System.Object
---@field Items System.Collections.Generic.List
---@field TotalMatchingResults number
---@field ErrorMessage string
Witch.UI.Window.SteamWorkshopQueryPage = {}
---@alias CS.Witch.UI.Window.SteamWorkshopQueryPage Witch.UI.Window.SteamWorkshopQueryPage
CS.Witch.UI.Window.SteamWorkshopQueryPage = Witch.UI.Window.SteamWorkshopQueryPage

---@return Witch.UI.Window.SteamWorkshopQueryPage
function Witch.UI.Window.SteamWorkshopQueryPage.New() end

---@class Witch.UI.Window.SteamWorkshopModInfo : System.Object
---@field PublishedFileId number
---@field Title string
---@field Description string
---@field CoverImageUrl string
---@field PreviewUrl string
---@field AdditionalPreviewUrls System.Collections.Generic.List
---@field Metadata string
---@field Tags string
---@field OwnerId number
---@field OwnerName string
---@field VotesUp number
---@field VotesDown number
---@field Score number
---@field UpdatedAt System.DateTime
---@field IsSubscribed boolean
---@field IsInstalled boolean
---@field IsDownloadPending boolean
---@field IsDownloading boolean
---@field IsLoadedInGame boolean
---@field InstallDirectory string
---@field IsDownloadedToModsPath boolean
---@field ModsInstallDirectory string
---@field IsLocalMod boolean
---@field LocalEnabled boolean
---@field LocalDirectory string
---@field LocalIconPath string
---@field WorkshopUrl string
---@field PrimaryImageUrl string
---@field StatusText string
---@field SummaryText string
Witch.UI.Window.SteamWorkshopModInfo = {}
---@alias CS.Witch.UI.Window.SteamWorkshopModInfo Witch.UI.Window.SteamWorkshopModInfo
CS.Witch.UI.Window.SteamWorkshopModInfo = Witch.UI.Window.SteamWorkshopModInfo

---@return Witch.UI.Window.SteamWorkshopModInfo
function Witch.UI.Window.SteamWorkshopModInfo.New() end

---@class Witch.UI.Window.SteamWorkshopDownloadService : System.Object
---@field Instance Witch.UI.Window.SteamWorkshopDownloadService
Witch.UI.Window.SteamWorkshopDownloadService = {}
---@alias CS.Witch.UI.Window.SteamWorkshopDownloadService Witch.UI.Window.SteamWorkshopDownloadService
CS.Witch.UI.Window.SteamWorkshopDownloadService = Witch.UI.Window.SteamWorkshopDownloadService

---@return Witch.UI.Window.SteamWorkshopDownloadService
function Witch.UI.Window.SteamWorkshopDownloadService.New() end
---@param publishedFileId number
---@return boolean
function Witch.UI.Window.SteamWorkshopDownloadService:IsDownloading(publishedFileId) end
---@param info Witch.UI.Window.SteamWorkshopModInfo
---@return boolean
function Witch.UI.Window.SteamWorkshopDownloadService:IsDownloadedToMods(info) end
---@overload fun(self: Witch.UI.Window.SteamWorkshopDownloadService, info: Witch.UI.Window.SteamWorkshopModInfo) : string
---@param publishedFileId number
---@return string
function Witch.UI.Window.SteamWorkshopDownloadService:GetModsTargetDirectory(publishedFileId) end
---@param publishedFileId number
function Witch.UI.Window.SteamWorkshopDownloadService:CancelDownload(publishedFileId) end
---@param info Witch.UI.Window.SteamWorkshopModInfo
---@param onProgress System.Action | function
---@param cancellationToken System.Threading.CancellationToken
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Window.SteamWorkshopDownloadService:ToggleDownloadAsync(info, onProgress, cancellationToken) end
---@return Witch.UI.Window.SteamWorkshopAutoSyncResult
function Witch.UI.Window.SteamWorkshopDownloadService:SyncInstalledWorkshopModsToLocal() end

---@class Witch.UI.Window.SteamWorkshopDownloadState
---@field Preparing Witch.UI.Window.SteamWorkshopDownloadState
---@field Downloading Witch.UI.Window.SteamWorkshopDownloadState
---@field Stopping Witch.UI.Window.SteamWorkshopDownloadState
---@field Stopped Witch.UI.Window.SteamWorkshopDownloadState
---@field Completed Witch.UI.Window.SteamWorkshopDownloadState
---@field Error Witch.UI.Window.SteamWorkshopDownloadState
Witch.UI.Window.SteamWorkshopDownloadState = {}
---@alias CS.Witch.UI.Window.SteamWorkshopDownloadState Witch.UI.Window.SteamWorkshopDownloadState
CS.Witch.UI.Window.SteamWorkshopDownloadState = Witch.UI.Window.SteamWorkshopDownloadState


---@class Witch.UI.Window.SteamWorkshopDownloadProgress : System.Object
---@field State Witch.UI.Window.SteamWorkshopDownloadState
---@field Progress number
---@field Message string
---@field TargetDirectory string
Witch.UI.Window.SteamWorkshopDownloadProgress = {}
---@alias CS.Witch.UI.Window.SteamWorkshopDownloadProgress Witch.UI.Window.SteamWorkshopDownloadProgress
CS.Witch.UI.Window.SteamWorkshopDownloadProgress = Witch.UI.Window.SteamWorkshopDownloadProgress

---@return Witch.UI.Window.SteamWorkshopDownloadProgress
function Witch.UI.Window.SteamWorkshopDownloadProgress.New() end

---@class Witch.UI.Window.WorkshopLocalModConfig : System.Object
---@field ModName string
Witch.UI.Window.WorkshopLocalModConfig = {}
---@alias CS.Witch.UI.Window.WorkshopLocalModConfig Witch.UI.Window.WorkshopLocalModConfig
CS.Witch.UI.Window.WorkshopLocalModConfig = Witch.UI.Window.WorkshopLocalModConfig

---@return Witch.UI.Window.WorkshopLocalModConfig
function Witch.UI.Window.WorkshopLocalModConfig.New() end

---@class Witch.UI.Window.WorkshopSyncMeta : System.Object
---@field WorkshopId number
---@field InstallTimestamp number
Witch.UI.Window.WorkshopSyncMeta = {}
---@alias CS.Witch.UI.Window.WorkshopSyncMeta Witch.UI.Window.WorkshopSyncMeta
CS.Witch.UI.Window.WorkshopSyncMeta = Witch.UI.Window.WorkshopSyncMeta

---@return Witch.UI.Window.WorkshopSyncMeta
function Witch.UI.Window.WorkshopSyncMeta.New() end

---@class Witch.UI.Window.SteamWorkshopAutoSyncResult : System.Object
---@field Attempted boolean
---@field CheckedCount number
---@field SyncedCount number
---@field SkippedCount number
---@field FailedCount number
---@field Message string
Witch.UI.Window.SteamWorkshopAutoSyncResult = {}
---@alias CS.Witch.UI.Window.SteamWorkshopAutoSyncResult Witch.UI.Window.SteamWorkshopAutoSyncResult
CS.Witch.UI.Window.SteamWorkshopAutoSyncResult = Witch.UI.Window.SteamWorkshopAutoSyncResult

---@return Witch.UI.Window.SteamWorkshopAutoSyncResult
function Witch.UI.Window.SteamWorkshopAutoSyncResult.New() end
---@param message string
---@return Witch.UI.Window.SteamWorkshopAutoSyncResult
function Witch.UI.Window.SteamWorkshopAutoSyncResult.NotAttempted(message) end
---@param checkedCount number
---@param syncedCount number
---@param skippedCount number
---@param failedCount number
---@param message string
---@return Witch.UI.Window.SteamWorkshopAutoSyncResult
function Witch.UI.Window.SteamWorkshopAutoSyncResult.CreateAttempted(checkedCount, syncedCount, skippedCount, failedCount, message) end

---@class Witch.UI.Window.OutSideItem : Witch.UI.Window.ItemNonDrag
---@field isgoods boolean
---@field outsiderShopUI Witch.UI.Window.OutsiderShopUI
Witch.UI.Window.OutSideItem = {}
---@alias CS.Witch.UI.Window.OutSideItem Witch.UI.Window.OutSideItem
CS.Witch.UI.Window.OutSideItem = Witch.UI.Window.OutSideItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.OutSideItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.OutSideItem:OnPointerExit(eventData) end

---@class Witch.UI.Window.OutsiderShopUI : Witch.UI.Window.ShopUI
---@field thiscurrentItem Witch.UI.Window.OutsideShopItem
---@field fadeTransforms System.Collections.Generic.List
---@field transitionTime number
---@field TruthItem UnityEngine.Transform
---@field TimeItem UnityEngine.Transform
---@field TypeMap System.Collections.Generic.Dictionary
---@field LockIcon UnityEngine.Sprite
---@field UnlockIcon UnityEngine.Sprite
---@field ShopItems System.Collections.Generic.List
---@field ItemParent UnityEngine.Transform
---@field itemPrefab UnityEngine.GameObject
Witch.UI.Window.OutsiderShopUI = {}
---@alias CS.Witch.UI.Window.OutsiderShopUI Witch.UI.Window.OutsiderShopUI
CS.Witch.UI.Window.OutsiderShopUI = Witch.UI.Window.OutsiderShopUI

function Witch.UI.Window.OutsiderShopUI:Awake() end
function Witch.UI.Window.OutsiderShopUI:DataUpdate() end
function Witch.UI.Window.OutsiderShopUI:Init() end
function Witch.UI.Window.OutsiderShopUI:Hide() end
---@param Type string
function Witch.UI.Window.OutsiderShopUI:InitType(Type) end
---@param item Witch.UI.Window.OutsideShopItem
function Witch.UI.Window.OutsiderShopUI:SetCurrentItem(item) end
function Witch.UI.Window.OutsiderShopUI:ChangeStarShow() end
function Witch.UI.Window.OutsiderShopUI:ChangeCostShow() end
function Witch.UI.Window.OutsiderShopUI:SetShopItems() end
function Witch.UI.Window.OutsiderShopUI:OnEnable() end
function Witch.UI.Window.OutsiderShopUI:TryBuy() end
function Witch.UI.Window.OutsiderShopUI:ChangeTrue() end
function Witch.UI.Window.OutsiderShopUI:ChangeTime() end
function Witch.UI.Window.OutsiderShopUI:UpdateAllItems() end
function Witch.UI.Window.OutsiderShopUI:UpdateItemDes() end
function Witch.UI.Window.OutsiderShopUI:TriggerCalled() end
function Witch.UI.Window.OutsiderShopUI:OnDisable() end

---@class Witch.UI.Window.ResultUI : Witch.UI.UIBase
---@field GetItemList UnityEngine.Transform
Witch.UI.Window.ResultUI = {}
---@alias CS.Witch.UI.Window.ResultUI Witch.UI.Window.ResultUI
CS.Witch.UI.Window.ResultUI = Witch.UI.Window.ResultUI

---@param datas System.Collections.Generic.List
function Witch.UI.Window.ResultUI:CreateResultItem(datas) end

---@class Witch.UI.Window.SafeBoxItem : Witch.UI.Window.Item
---@field safeBoxUI Witch.UI.Window.SafeBoxUI
---@field InBackPack boolean
---@field hasInBack boolean
---@field tooltip Tooltip
---@field normalCanvasGroup UnityEngine.CanvasGroup
---@field highlightCanvasGroup UnityEngine.CanvasGroup
Witch.UI.Window.SafeBoxItem = {}
---@alias CS.Witch.UI.Window.SafeBoxItem Witch.UI.Window.SafeBoxItem
CS.Witch.UI.Window.SafeBoxItem = Witch.UI.Window.SafeBoxItem

---@param dataConfig DataConfig
function Witch.UI.Window.SafeBoxItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SafeBoxItem:OnPointerEnter(eventData) end
function Witch.UI.Window.SafeBoxItem:DataUpdate() end
---@return string
function Witch.UI.Window.SafeBoxItem:CreateTooltipText() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SafeBoxItem:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SafeBoxItem:OnPointerClick(eventData) end
function Witch.UI.Window.SafeBoxItem:OnDestroy() end
---@param item SwapContentIdentity
function Witch.UI.Window.SafeBoxItem:AddToList(item) end
function Witch.UI.Window.SafeBoxItem:OnTransformParentChanged() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SafeBoxItem:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SafeBoxItem:OnPointerExit(eventData) end

---@class Witch.UI.Window.SafeBoxUI : Witch.UI.UIBase
---@field cardBack UnityEngine.Transform
---@field cardBox UnityEngine.Transform
---@field relicBox UnityEngine.Transform
---@field TopRelicPrefab UnityEngine.GameObject
---@field BottomRelicPrefab UnityEngine.GameObject
---@field tooltip Tooltip
---@field floatingWindow FloatingWindow
Witch.UI.Window.SafeBoxUI = {}
---@alias CS.Witch.UI.Window.SafeBoxUI Witch.UI.Window.SafeBoxUI
CS.Witch.UI.Window.SafeBoxUI = Witch.UI.Window.SafeBoxUI

function Witch.UI.Window.SafeBoxUI.SafeboxSave() end
function Witch.UI.Window.SafeBoxUI.ClearList() end
function Witch.UI.Window.SafeBoxUI.ResetCount() end
function Witch.UI.Window.SafeBoxUI:DataUpdate() end
function Witch.UI.Window.SafeBoxUI:UpdateCardShow() end
function Witch.UI.Window.SafeBoxUI:RetainMoney() end
function Witch.UI.Window.SafeBoxUI:ChangeMoney() end
function Witch.UI.Window.SafeBoxUI:ChangeMoneyShow() end
function Witch.UI.Window.SafeBoxUI:ChangeCountShow() end
function Witch.UI.Window.SafeBoxUI:ShowBackItem() end
function Witch.UI.Window.SafeBoxUI:UpdateBackCard() end
---@param cardData DataConfig
---@param InBackPack boolean
---@param hasInBack boolean
function Witch.UI.Window.SafeBoxUI:CreateItem(cardData, InBackPack, hasInBack) end
function Witch.UI.Window.SafeBoxUI:UpdateBackRelic() end
function Witch.UI.Window.SafeBoxUI:ShowHadItems() end
---@param item Witch.UI.Window.SafeBoxItem
function Witch.UI.Window.SafeBoxUI:LoseItem(item) end
---@param obj UnityEngine.GameObject
function Witch.UI.Window.SafeBoxUI:PutIntoStore(obj) end
function Witch.UI.Window.SafeBoxUI:HideTooltip() end
---@param item Witch.UI.Window.SafeBoxItem
function Witch.UI.Window.SafeBoxUI:ShowFloatingWindow(item) end
---@param obj UnityEngine.GameObject
function Witch.UI.Window.SafeBoxUI:PutItBack(obj) end

---@class Witch.UI.Window.CurtainTurnUI : Witch.UI.UIBase
---@field CloseAnimation UIAnimation
---@field OpenAnimation UIAnimation
Witch.UI.Window.CurtainTurnUI = {}
---@alias CS.Witch.UI.Window.CurtainTurnUI Witch.UI.Window.CurtainTurnUI
CS.Witch.UI.Window.CurtainTurnUI = Witch.UI.Window.CurtainTurnUI

---@param action System.Action | function
function Witch.UI.Window.CurtainTurnUI:Play(action) end
function Witch.UI.Window.CurtainTurnUI:OnDestroy() end

---@class Witch.UI.Window.InkTurnUI : Witch.UI.UIBase
---@field SceneTurnMaterial UnityEngine.Material
---@field textures System.Collections.Generic.List
Witch.UI.Window.InkTurnUI = {}
---@alias CS.Witch.UI.Window.InkTurnUI Witch.UI.Window.InkTurnUI
CS.Witch.UI.Window.InkTurnUI = Witch.UI.Window.InkTurnUI

---@overload fun()
---@param firstUI System.Action | function
---@param secondUI System.Action | function
function Witch.UI.Window.InkTurnUI:Play(firstUI, secondUI) end
---@param firstUI System.Action | function
---@param secondUI System.Action | function
function Witch.UI.Window.InkTurnUI:FastPlay(firstUI, secondUI) end
function Witch.UI.Window.InkTurnUI:OnDestroy() end

---@class Witch.UI.Window.LoadingUI : Witch.UI.UIBase
Witch.UI.Window.LoadingUI = {}
---@alias CS.Witch.UI.Window.LoadingUI Witch.UI.Window.LoadingUI
CS.Witch.UI.Window.LoadingUI = Witch.UI.Window.LoadingUI

function Witch.UI.Window.LoadingUI:OnEnable() end
function Witch.UI.Window.LoadingUI:Close() end

---@class Witch.UI.Window.SceneTurnUI : Witch.UI.UIBase
Witch.UI.Window.SceneTurnUI = {}
---@alias CS.Witch.UI.Window.SceneTurnUI Witch.UI.Window.SceneTurnUI
CS.Witch.UI.Window.SceneTurnUI = Witch.UI.Window.SceneTurnUI

function Witch.UI.Window.SceneTurnUI:FadeIn() end
function Witch.UI.Window.SceneTurnUI:Close() end

---@class Witch.UI.Window.HardItem : UnityEngine.MonoBehaviour
---@field selectHardUI Witch.UI.Window.SelectHardUI
---@field Data System.Collections.Generic.Dictionary
Witch.UI.Window.HardItem = {}
---@alias CS.Witch.UI.Window.HardItem Witch.UI.Window.HardItem
CS.Witch.UI.Window.HardItem = Witch.UI.Window.HardItem

---@param hardData System.Collections.Generic.Dictionary
function Witch.UI.Window.HardItem:Init(hardData) end
function Witch.UI.Window.HardItem:AddSc() end
function Witch.UI.Window.HardItem:RemoveSc() end
function Witch.UI.Window.HardItem:ChangeShow() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.HardItem:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.HardItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.HardItem:OnPointerExit(eventData) end

---@class Witch.UI.Window.SelectHardUI : Witch.UI.UIBase
---@field UseSc System.Collections.Generic.List
---@field AddReward number
---@field NormalLevelItem UnityEngine.GameObject
---@field TestLevelItem UnityEngine.GameObject
---@field DesItem UnityEngine.GameObject
---@field TotalDiff number
---@field PreList UnityEngine.Transform
---@field NowItem UnityEngine.Transform
Witch.UI.Window.SelectHardUI = {}
---@alias CS.Witch.UI.Window.SelectHardUI Witch.UI.Window.SelectHardUI
CS.Witch.UI.Window.SelectHardUI = Witch.UI.Window.SelectHardUI

function Witch.UI.Window.SelectHardUI:DataUpdate() end
function Witch.UI.Window.SelectHardUI:Init() end
function Witch.UI.Window.SelectHardUI:UpdataReward() end
function Witch.UI.Window.SelectHardUI:Hide() end
function Witch.UI.Window.SelectHardUI:OnDisable() end
function Witch.UI.Window.SelectHardUI:OnEnable() end
---@param needUp boolean
function Witch.UI.Window.SelectHardUI:CalCulateReward(needUp) end
---@param hardItem Witch.UI.Window.HardItem
function Witch.UI.Window.SelectHardUI:AddSc(hardItem) end
---@param hardItem Witch.UI.Window.HardItem
function Witch.UI.Window.SelectHardUI:DeleteSc(hardItem) end
---@param data System.Collections.Generic.Dictionary
function Witch.UI.Window.SelectHardUI:ChangeDesShow(data) end
function Witch.UI.Window.SelectHardUI:CloseDes() end
function Witch.UI.Window.SelectHardUI:ReSetHard() end
function Witch.UI.Window.SelectHardUI:CreateItem() end

---@class Witch.UI.Window.SettingUI : Witch.UI.UIBase
---@field feelBack TMPro.TMP_InputField
---@field ExitButton Michsky.MUIP.ButtonManager
---@field ReturnButton Michsky.MUIP.ButtonManager
---@field FeedBackButton Michsky.MUIP.ButtonManager
---@field LanguageHor Michsky.MUIP.HorizontalSelector
---@field Active boolean
Witch.UI.Window.SettingUI = {}
---@alias CS.Witch.UI.Window.SettingUI Witch.UI.Window.SettingUI
CS.Witch.UI.Window.SettingUI = Witch.UI.Window.SettingUI

function Witch.UI.Window.SettingUI:Close() end
function Witch.UI.Window.SettingUI:DataUpdate() end
function Witch.UI.Window.SettingUI:Hide() end
function Witch.UI.Window.SettingUI:OnEnable() end
function Witch.UI.Window.SettingUI:CloseTheGame() end
function Witch.UI.Window.SettingUI:ReturnMain() end
function Witch.UI.Window.SettingUI:SendFeelBack() end
function Witch.UI.Window.SettingUI:SendFeedBack() end
function Witch.UI.Window.SettingUI:Save() end
function Witch.UI.Window.SettingUI:Apply() end

---@class Witch.UI.Window.SettingUI.FeedbackSelection : Supabase.Postgrest.Models.BaseModel
---@field text string
Witch.UI.Window.SettingUI.FeedbackSelection = {}
---@alias CS.Witch.UI.Window.SettingUI.FeedbackSelection Witch.UI.Window.SettingUI.FeedbackSelection
CS.Witch.UI.Window.SettingUI.FeedbackSelection = Witch.UI.Window.SettingUI.FeedbackSelection

---@return Witch.UI.Window.SettingUI.FeedbackSelection
function Witch.UI.Window.SettingUI.FeedbackSelection.New() end

---@class Witch.UI.Window.OutsideShopItem : Witch.UI.Window.ItemNonDrag
---@field theData System.Collections.Generic.Dictionary
---@field selfType string
---@field outsiderShopUI Witch.UI.Window.OutsiderShopUI
---@field HighItemIcon UnityEngine.Sprite
Witch.UI.Window.OutsideShopItem = {}
---@alias CS.Witch.UI.Window.OutsideShopItem Witch.UI.Window.OutsideShopItem
CS.Witch.UI.Window.OutsideShopItem = Witch.UI.Window.OutsideShopItem

function Witch.UI.Window.OutsideShopItem:ShowTypeChange() end
function Witch.UI.Window.OutsideShopItem:DataUpdate() end
function Witch.UI.Window.OutsideShopItem:Init() end
function Witch.UI.Window.OutsideShopItem:BuyCheck() end
function Witch.UI.Window.OutsideShopItem:UseCheck() end
function Witch.UI.Window.OutsideShopItem:TryBuy() end
function Witch.UI.Window.OutsideShopItem:UpdateItem() end

---@class Witch.UI.Window.SellItem : Witch.UI.Window.Item
---@field shop Witch.UI.Window.ShopUI
Witch.UI.Window.SellItem = {}
---@alias CS.Witch.UI.Window.SellItem Witch.UI.Window.SellItem
CS.Witch.UI.Window.SellItem = Witch.UI.Window.SellItem

---@param equipped boolean
---@param dataConfig DataConfig
function Witch.UI.Window.SellItem:Init(equipped, dataConfig) end
function Witch.UI.Window.SellItem:CheckEnch() end
---@return boolean
function Witch.UI.Window.SellItem:CanSell() end
function Witch.UI.Window.SellItem:TrySell() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.SellItem:OnPointerClick(eventData) end
function Witch.UI.Window.SellItem:ShowFloatingWindow() end
function Witch.UI.Window.SellItem:DataUpdate() end

---@class Witch.UI.Window.ShopItem : Witch.UI.Window.ItemNonDrag
---@field shop Witch.UI.Window.ShopUI
---@field dice Dice
Witch.UI.Window.ShopItem = {}
---@alias CS.Witch.UI.Window.ShopItem Witch.UI.Window.ShopItem
CS.Witch.UI.Window.ShopItem = Witch.UI.Window.ShopItem

---@overload fun(self: Witch.UI.Window.ShopItem, dataConfig: DataConfig)
function Witch.UI.Window.ShopItem:Init() end
function Witch.UI.Window.ShopItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.ShopItem:OnEndDrag(eventData) end
function Witch.UI.Window.ShopItem:TryBuy() end
function Witch.UI.Window.ShopItem:EnchTryBuy() end
function Witch.UI.Window.ShopItem:UpdateItem() end

---@class Witch.UI.Window.ShopUI : Witch.UI.UIBase
---@field currentItem Witch.UI.Window.ShopItem
---@field SellCardPrefab UnityEngine.GameObject
---@field TopRelicPrefab UnityEngine.GameObject
---@field flushedCount number
---@field maxFlushedCount number
---@field ShopTran UnityEngine.Transform
---@field flushmoneychange number
---@field ItemPrefab UnityEngine.GameObject
Witch.UI.Window.ShopUI = {}
---@alias CS.Witch.UI.Window.ShopUI Witch.UI.Window.ShopUI
CS.Witch.UI.Window.ShopUI = Witch.UI.Window.ShopUI

function Witch.UI.Window.ShopUI:DataUpdate() end
function Witch.UI.Window.ShopUI:CreateSellCard() end
function Witch.UI.Window.ShopUI:UpdateSellRelic() end
function Witch.UI.Window.ShopUI:Flushed() end
function Witch.UI.Window.ShopUI:ChangeFlushShow() end
function Witch.UI.Window.ShopUI:SetShopItems() end
---@param sender System.Object
---@param args System.ComponentModel.PropertyChangedEventArgs
function Witch.UI.Window.ShopUI:OnRoleTableChanged(sender, args) end
function Witch.UI.Window.ShopUI:UpdateSellCard() end
---@param obj UnityEngine.GameObject
function Witch.UI.Window.ShopUI:AnimationPlay(obj) end
function Witch.UI.Window.ShopUI:OnDestroy() end
function Witch.UI.Window.ShopUI:UpdateAllItems() end

---@class Witch.UI.Window.StorehouseUI : Witch.UI.UIBase
---@field TempItem UnityEngine.GameObject
---@field ListTransform UnityEngine.Transform
---@field thiscurrentItem Witch.UI.Window.StorehouseItem
---@field TypeMap System.Collections.Generic.Dictionary
Witch.UI.Window.StorehouseUI = {}
---@alias CS.Witch.UI.Window.StorehouseUI Witch.UI.Window.StorehouseUI
CS.Witch.UI.Window.StorehouseUI = Witch.UI.Window.StorehouseUI

function Witch.UI.Window.StorehouseUI:OnEnable() end
function Witch.UI.Window.StorehouseUI:CreateCardList() end
---@param Data DataConfig
---@param isCard boolean
function Witch.UI.Window.StorehouseUI:CreateItem(Data, isCard) end
---@param item Witch.UI.Window.StorehouseItem
function Witch.UI.Window.StorehouseUI:SetCurrentItem(item) end
function Witch.UI.Window.StorehouseUI:ExitCureentItem() end
function Witch.UI.Window.StorehouseUI:SetDescription() end
function Witch.UI.Window.StorehouseUI:HideDescription() end

---@class Witch.UI.Window.WarehouseItem : Witch.UI.Window.Item
---@field Inwarehouse boolean
---@field warehouseUI Witch.UI.Window.WarehouseUI
Witch.UI.Window.WarehouseItem = {}
---@alias CS.Witch.UI.Window.WarehouseItem Witch.UI.Window.WarehouseItem
CS.Witch.UI.Window.WarehouseItem = Witch.UI.Window.WarehouseItem

---@param isware boolean
---@param equipped boolean
---@param dataConfig DataConfig
function Witch.UI.Window.WarehouseItem:Init(isware, equipped, dataConfig) end
function Witch.UI.Window.WarehouseItem:DataUpdate() end
function Witch.UI.Window.WarehouseItem:TryMove() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.Window.WarehouseItem:OnPointerClick(eventData) end

---@class Witch.UI.Window.WarehouseUI : Witch.UI.UIBase
---@field withCardParent UnityEngine.Transform
---@field warehouseParent UnityEngine.Transform
---@field withRelicParent UnityEngine.Transform
Witch.UI.Window.WarehouseUI = {}
---@alias CS.Witch.UI.Window.WarehouseUI Witch.UI.Window.WarehouseUI
CS.Witch.UI.Window.WarehouseUI = Witch.UI.Window.WarehouseUI

function Witch.UI.Window.WarehouseUI.ResetCount() end
function Witch.UI.Window.WarehouseUI:OnEnable() end
function Witch.UI.Window.WarehouseUI:OnDisable() end
---@param itemType string
---@param instanceId string
function Witch.UI.Window.WarehouseUI:RefreshWhenSharedItemAdded(itemType, instanceId) end
---@param itemType string
---@param instanceId string
function Witch.UI.Window.WarehouseUI:RefreshWhenSharedItemRemoved(itemType, instanceId) end
function Witch.UI.Window.WarehouseUI:RefreshWhenShareListChanges() end
function Witch.UI.Window.WarehouseUI:ShowCard() end
---@param itemType string
---@param isGet boolean
---@return boolean
function Witch.UI.Window.WarehouseUI:MoveCheck(itemType, isGet) end
function Witch.UI.Window.WarehouseUI:ShowRelic() end

---@class Witch.UI.Window.EmojiPanelUI : Witch.UI.UIBase
---@field EmojiPrefab UnityEngine.Transform
Witch.UI.Window.EmojiPanelUI = {}
---@alias CS.Witch.UI.Window.EmojiPanelUI Witch.UI.Window.EmojiPanelUI
CS.Witch.UI.Window.EmojiPanelUI = Witch.UI.Window.EmojiPanelUI

function Witch.UI.Window.EmojiPanelUI:CreateEmoji() end
function Witch.UI.Window.EmojiPanelUI:Start() end
---@overload fun(self: Witch.UI.Window.EmojiPanelUI, gifAsset: GifAsset)
---@param uiAnimation UIAnimation
function Witch.UI.Window.EmojiPanelUI:ShowEmoji(uiAnimation) end

---@class BugReporter.BugReporter : System.Object
BugReporter.BugReporter = {}
---@alias CS.BugReporter.BugReporter BugReporter.BugReporter
CS.BugReporter.BugReporter = BugReporter.BugReporter

---@param error System.Exception
function BugReporter.BugReporter.ShowError(error) end

---@class BugReporter.BugReporter.ErrorMessage : System.Object
---@field playerid string
---@field message string
---@field stackTrace string
---@field isSolved boolean
---@field note string
BugReporter.BugReporter.ErrorMessage = {}
---@alias CS.BugReporter.BugReporter.ErrorMessage BugReporter.BugReporter.ErrorMessage
CS.BugReporter.BugReporter.ErrorMessage = BugReporter.BugReporter.ErrorMessage

---@overload fun(error: System.Exception) : BugReporter.BugReporter.ErrorMessage
---@return BugReporter.BugReporter.ErrorMessage
function BugReporter.BugReporter.ErrorMessage.New() end

---@class BugReporter.BugReporter.ErrorSelection : Supabase.Postgrest.Models.BaseModel
---@field data string
BugReporter.BugReporter.ErrorSelection = {}
---@alias CS.BugReporter.BugReporter.ErrorSelection BugReporter.BugReporter.ErrorSelection
CS.BugReporter.BugReporter.ErrorSelection = BugReporter.BugReporter.ErrorSelection

---@return BugReporter.BugReporter.ErrorSelection
function BugReporter.BugReporter.ErrorSelection.New() end

---@class Witch_ProcessedByFody : System.Object
Witch_ProcessedByFody = {}
---@alias CS.Witch_ProcessedByFody Witch_ProcessedByFody
CS.Witch_ProcessedByFody = Witch_ProcessedByFody



