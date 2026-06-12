---@meta

---@meta CSharp

---@class NotExportType @表明该类型未导出

---@class NotExportEnum @表明该枚举未导出

---@class CS
CS = {}

---@param obj any
---@return System.Type
function typeof(obj) end

---@class BugReporter
BugReporter = {}
---@alias CS.BugReporter BugReporter
CS.BugReporter = {}

---@class Component.UI.Animation
Component.UI.Animation = {}
---@alias CS.Component.UI.Animation Component.UI.Animation
CS.Component.UI.Animation = {}

---@class Data.Save
Data.Save = {}
---@alias CS.Data.Save Data.Save
CS.Data.Save = {}

---@class DataEditor.CardEditor
DataEditor.CardEditor = {}
---@alias CS.DataEditor.CardEditor DataEditor.CardEditor
CS.DataEditor.CardEditor = {}

---@class Fight.ActionCommand
Fight.ActionCommand = {}
---@alias CS.Fight.ActionCommand Fight.ActionCommand
CS.Fight.ActionCommand = {}

---@class Fight.ObjTarget
Fight.ObjTarget = {}
---@alias CS.Fight.ObjTarget Fight.ObjTarget
CS.Fight.ObjTarget = {}

---@class Fight.StatusCommand
Fight.StatusCommand = {}
---@alias CS.Fight.StatusCommand Fight.StatusCommand
CS.Fight.StatusCommand = {}

---@class Microsoft.CodeAnalysis
Microsoft.CodeAnalysis = {}
---@alias CS.Microsoft.CodeAnalysis Microsoft.CodeAnalysis
CS.Microsoft.CodeAnalysis = {}

---@class Microsoft.CodeAnalysis.Scripting
Microsoft.CodeAnalysis.Scripting = {}
---@alias CS.Microsoft.CodeAnalysis.Scripting Microsoft.CodeAnalysis.Scripting
CS.Microsoft.CodeAnalysis.Scripting = {}

---@class Network.Command
Network.Command = {}
---@alias CS.Network.Command Network.Command
CS.Network.Command = {}

---@class Network.Query
Network.Query = {}
---@alias CS.Network.Query Network.Query
CS.Network.Query = {}

---@class Network.SupabaseUpload
Network.SupabaseUpload = {}
---@alias CS.Network.SupabaseUpload Network.SupabaseUpload
CS.Network.SupabaseUpload = {}

---@class System.Runtime.CompilerServices
System.Runtime.CompilerServices = {}
---@alias CS.System.Runtime.CompilerServices System.Runtime.CompilerServices
CS.System.Runtime.CompilerServices = {}

---@class Tutorial
Tutorial = {}
---@alias CS.Tutorial Tutorial
CS.Tutorial = {}

---@class UI.ScreenEffect
UI.ScreenEffect = {}
---@alias CS.UI.ScreenEffect UI.ScreenEffect
CS.UI.ScreenEffect = {}

---@class UnityEngine.UI
UnityEngine.UI = {}
---@alias CS.UnityEngine.UI UnityEngine.UI
CS.UnityEngine.UI = {}

---@class Witch
Witch = {}
---@alias CS.Witch Witch
CS.Witch = {}

---@class Witch.Mod
Witch.Mod = {}
---@alias CS.Witch.Mod Witch.Mod
CS.Witch.Mod = {}

---@class Witch.UI
Witch.UI = {}
---@alias CS.Witch.UI Witch.UI
CS.Witch.UI = {}

---@class Witch.UI.Automation
Witch.UI.Automation = {}
---@alias CS.Witch.UI.Automation Witch.UI.Automation
CS.Witch.UI.Automation = {}

---@class Witch.UI.Component
Witch.UI.Component = {}
---@alias CS.Witch.UI.Component Witch.UI.Component
CS.Witch.UI.Component = {}

---@class Witch.UI.Window
Witch.UI.Window = {}
---@alias CS.Witch.UI.Window Witch.UI.Window
CS.Witch.UI.Window = {}

---@class Microsoft.CodeAnalysis.EmbeddedAttribute : System.Attribute
Microsoft.CodeAnalysis.EmbeddedAttribute = {}
---@alias CS.Microsoft.CodeAnalysis.EmbeddedAttribute Microsoft.CodeAnalysis.EmbeddedAttribute
CS.Microsoft.CodeAnalysis.EmbeddedAttribute = Microsoft.CodeAnalysis.EmbeddedAttribute

---@return Microsoft.CodeAnalysis.EmbeddedAttribute
function Microsoft.CodeAnalysis.EmbeddedAttribute.New() end

---@class System.Runtime.CompilerServices.NullableAttribute : System.Attribute
---@field NullableFlags System.Byte[]
System.Runtime.CompilerServices.NullableAttribute = {}
---@alias CS.System.Runtime.CompilerServices.NullableAttribute System.Runtime.CompilerServices.NullableAttribute
CS.System.Runtime.CompilerServices.NullableAttribute = System.Runtime.CompilerServices.NullableAttribute

---@overload fun(: number) : System.Runtime.CompilerServices.NullableAttribute
---@param  System.Byte[]
---@return System.Runtime.CompilerServices.NullableAttribute
function System.Runtime.CompilerServices.NullableAttribute.New() end

---@class System.Runtime.CompilerServices.NullableContextAttribute : System.Attribute
---@field Flag number
System.Runtime.CompilerServices.NullableContextAttribute = {}
---@alias CS.System.Runtime.CompilerServices.NullableContextAttribute System.Runtime.CompilerServices.NullableContextAttribute
CS.System.Runtime.CompilerServices.NullableContextAttribute = System.Runtime.CompilerServices.NullableContextAttribute

---@param  number
---@return System.Runtime.CompilerServices.NullableContextAttribute
function System.Runtime.CompilerServices.NullableContextAttribute.New() end

---@class ConditionalShowAttribute : UnityEngine.PropertyAttribute
---@field conditionalSourceField string
---@field compareValue System.Object
ConditionalShowAttribute = {}
---@alias CS.ConditionalShowAttribute ConditionalShowAttribute
CS.ConditionalShowAttribute = ConditionalShowAttribute

---@param conditionalSourceField string
---@param compareValue System.Object
---@return ConditionalShowAttribute
function ConditionalShowAttribute.New(conditionalSourceField, compareValue) end

---@class UnityInjectAttribute : UnityEngine.PropertyAttribute
---@field AutoCreate boolean
UnityInjectAttribute = {}
---@alias CS.UnityInjectAttribute UnityInjectAttribute
CS.UnityInjectAttribute = UnityInjectAttribute

---@param autoCreate boolean
---@return UnityInjectAttribute
function UnityInjectAttribute.New(autoCreate) end

---@class BuffItemConfig : System.Object
---@field Icon string
---@field level number
---@field CanZero boolean
---@field buffBarUI Witch.UI.Window.BuffBarUI
---@field Level number
---@field UpperBound number
---@field ReducePerTurn number
---@field ReducePerUse number
---@field ReducePerAttacked number
---@field buffItem IBuffItem
---@field status IStatusManager
---@field BuffId string
---@field BuffName string
---@field Description string
---@field Type string
---@field dataConfig IDataConfig
BuffItemConfig = {}
---@alias CS.BuffItemConfig BuffItemConfig
CS.BuffItemConfig = BuffItemConfig

---@overload fun() : BuffItemConfig
---@param dataConfig DataConfig
---@param Status StatusManager
---@param buffBarUI Witch.UI.Window.BuffBarUI
---@return BuffItemConfig
function BuffItemConfig.New(dataConfig, Status, buffBarUI) end
---@param way string
---@return boolean
function BuffItemConfig:DurationCheck(way) end

---@class AttackCardItem : CommonCardItem
---@field isLine boolean
AttackCardItem = {}
---@alias CS.AttackCardItem AttackCardItem
CS.AttackCardItem = AttackCardItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function AttackCardItem:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function AttackCardItem:OnDrag(eventData) end
---@param dataConfig DataConfig
function AttackCardItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function AttackCardItem:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function AttackCardItem:OnPointerDown(eventData) end
---@param requireClickable boolean
---@return boolean
function AttackCardItem:BeginLineMode(requireClickable) end
function AttackCardItem:CancelLineMode() end
function AttackCardItem:CommitOrCancelFromKeyboard() end
function AttackCardItem:DrawEffect() end
function AttackCardItem:TrueUse() end

---@class CardAnimationController : System.Object
---@field maxAngle number
---@field moveTween DG.Tweening.Tween
---@field scaleTween DG.Tweening.Tween
---@field card ICard
---@field isSelect boolean
CardAnimationController = {}
---@alias CS.CardAnimationController CardAnimationController
CS.CardAnimationController = CardAnimationController

---@return CardAnimationController
function CardAnimationController.New() end
---@param trans UnityEngine.Transform
---@param component ICard
function CardAnimationController:Initialize(trans, component) end
---@param newPosition UnityEngine.Vector2
---@param scale number
function CardAnimationController:PlayEnterAnimation(newPosition, scale) end
---@param initPosition UnityEngine.Vector2
---@param scale number
---@return DG.Tweening.Tween
function CardAnimationController:PlayExitAnimation(initPosition, scale) end
---@return Cysharp.Threading.Tasks.UniTaskVoid
function CardAnimationController:RotateWithMouse() end
---@return UnityEngine.Vector2
function CardAnimationController:GetMousePos() end
function CardAnimationController:StartRandomRotation() end
function CardAnimationController:enddrag() end
function CardAnimationController:StopRotation() end
function CardAnimationController:StopMove() end

---@class CardContainer : UnityEngine.MonoBehaviour
---@field AFKAnimation boolean
---@field anim UnityEngine.AnimationCurve
---@field cardTweenDict System.Collections.Generic.Dictionary
CardContainer = {}
---@alias CS.CardContainer CardContainer
CS.CardContainer = CardContainer

function CardContainer:ResetTimer() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardContainer:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardContainer:OnPointerExit(eventData) end

---@class CardItem : UnityEngine.MonoBehaviour
---@field canUse boolean
---@field UseCount number
---@field cardcontainer CardContainer
---@field hasUse boolean
---@field selectContainer CardContainer
---@field dataConfig DataConfig
---@field data System.Collections.Generic.IDictionary
---@field Vars System.Collections.Generic.IDictionary
---@field status StatusManager
---@field hasDone boolean
---@field _mainThreadContext System.Threading.SynchronizationContext
---@field enchScriptExecutor IScriptExecutor
---@field animationController CardAnimationController
---@field uiElement UnityEngine.RectTransform
---@field initAngle UnityEngine.Vector3
---@field initPosition UnityEngine.Vector2
---@field draging boolean
---@field ignore boolean
---@field initScale number
---@field selectScale number
---@field isReverse boolean
---@field scriptExecutor IScriptExecutor
---@field Tags System.Collections.Generic.HashSet
---@field index number
CardItem = {}
---@alias CS.CardItem CardItem
CS.CardItem = CardItem

---@param ScriptName string
function CardItem:RunScript(ScriptName) end
---@param dataConfig DataConfig
function CardItem:Init(dataConfig) end
---@param Index number
function CardItem:SetIndex(Index) end
function CardItem:DrawEffect() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnPointerExit(eventData) end
function CardItem:Awake() end
function CardItem:Start() end
function CardItem:ClearEvent() end
function CardItem:RegisterEvent() end
---@param nextDataConfig DataConfig
---@return CardItem
function CardItem:TransformToConfiguredType(nextDataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnRightClick(eventData) end
function CardItem:RefreshTag() end
function CardItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
---@return UnityEngine.Vector2
function CardItem:GetMousePos(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CardItem:OnEndDrag(eventData) end
---@param animationDelay number
function CardItem:Burning(animationDelay) end
---@param animationDelay number
function CardItem:InternalBurning(animationDelay) end
function CardItem:Reverse() end
function CardItem:EffectOfBurnCard() end
function CardItem:ThrowCard() end
---@param needUp boolean
function CardItem:InternalThrow(needUp) end
---@param targetPath string
---@param needUp boolean
function CardItem:EffectOfThrowCard(targetPath, needUp) end

---@class CommonCardItem : CardItem
---@field UseChecker System.Collections.Generic.List
---@field ExUseCount number
---@field UseCallback System.Collections.Generic.List
---@field lasttime number
CommonCardItem = {}
---@alias CS.CommonCardItem CommonCardItem
CS.CommonCardItem = CommonCardItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function CommonCardItem:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CommonCardItem:OnBeginDrag(eventData) end
function CommonCardItem:TrueUse() end
function CommonCardItem:UseCardDirectly() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function CommonCardItem:OnPointerDown(eventData) end
function CommonCardItem:DrawEffect() end

---@class ICard
---@field index number
---@field initPosition UnityEngine.Vector2
---@field initAngle UnityEngine.Vector3
---@field draging boolean
---@field initScale number
---@field selectScale number
---@field isReverse boolean
---@field ignore boolean
ICard = {}
---@alias CS.ICard ICard
CS.ICard = ICard

---@param transform UnityEngine.Transform
---@param dataConfig DataConfig
function ICard.SetCardStyle(transform, dataConfig) end
---@param transform UnityEngine.Transform
---@param dataConfig DataConfig
---@param status StatusManager
function ICard.SetCardMsg(transform, dataConfig, status) end
---@param transform UnityEngine.Transform
---@param dataConfig DataConfig
function ICard.SetPureMsg(transform, dataConfig) end
---@param index number
function ICard:SetIndex(index) end

---@class TriggerFixed : UnityEngine.MonoBehaviour
TriggerFixed = {}
---@alias CS.TriggerFixed TriggerFixed
CS.TriggerFixed = TriggerFixed


---@class EffectSound : UnityEngine.MonoBehaviour
---@field delay number
---@field clip UnityEngine.AudioClip
EffectSound = {}
---@alias CS.EffectSound EffectSound
CS.EffectSound = EffectSound


---@class MusicEffect : UnityEngine.MonoBehaviour
---@field delay number
MusicEffect = {}
---@alias CS.MusicEffect MusicEffect
CS.MusicEffect = MusicEffect


---@class OuterGlowController : UnityEngine.MonoBehaviour
---@field Range UnityEngine.Vector2
---@field LoopTime number
---@field Enabled boolean
OuterGlowController = {}
---@alias CS.OuterGlowController OuterGlowController
CS.OuterGlowController = OuterGlowController


---@class DOTweenCurvedTracker : UnityEngine.MonoBehaviour
---@field TargetPosition UnityEngine.Vector3
---@field SpiralTurns number
---@field OrbitRadius number
---@field MinOrbitRadius number
---@field PathResolution number
---@field RadiusDecayCurve UnityEngine.AnimationCurve
---@field MoveDuration number
---@field MoveEase DG.Tweening.Ease
---@field PathType DG.Tweening.PathType
---@field ShowPath boolean
---@field PathColor UnityEngine.Color
---@field CircleSegments number
DOTweenCurvedTracker = {}
---@alias CS.DOTweenCurvedTracker DOTweenCurvedTracker
CS.DOTweenCurvedTracker = DOTweenCurvedTracker

---@return DOTweenCurvedTracker
function DOTweenCurvedTracker:Play() end
---@param callback System.Action | function
---@return DOTweenCurvedTracker
function DOTweenCurvedTracker:OnCompletePathGeneration(callback) end
function DOTweenCurvedTracker:StartCurvedMovement() end
function DOTweenCurvedTracker:StartPreviewAnimation() end
function DOTweenCurvedTracker:ResetToOriginalPosition() end
function DOTweenCurvedTracker:StopMovement() end
function DOTweenCurvedTracker:RestartMovement() end
function DOTweenCurvedTracker:ForceUpdatePath() end

---@class DOTweenCurvedTrackerEditor : UnityEditor.Editor
DOTweenCurvedTrackerEditor = {}
---@alias CS.DOTweenCurvedTrackerEditor DOTweenCurvedTrackerEditor
CS.DOTweenCurvedTrackerEditor = DOTweenCurvedTrackerEditor

---@return DOTweenCurvedTrackerEditor
function DOTweenCurvedTrackerEditor.New() end
function DOTweenCurvedTrackerEditor:OnInspectorGUI() end

---@class ObjectGroup : UnityEngine.MonoBehaviour
---@field alpha number
---@field blocksRaycasts boolean
ObjectGroup = {}
---@alias CS.ObjectGroup ObjectGroup
CS.ObjectGroup = ObjectGroup

---@param alpha number
function ObjectGroup:SetAlpha(alpha) end
---@param endValue number
---@param duration number
---@return DG.Tweening.Core.TweenerCore
function ObjectGroup:DOFade(endValue, duration) end

---@class SceneInfo : UnityEngine.MonoBehaviour
---@field ground_y number
---@field bgmList BGMList
---@field backgroundPlaneZ number
---@field boundaryX UnityEngine.Vector2
---@field boundaryY UnityEngine.Vector2
SceneInfo = {}
---@alias CS.SceneInfo SceneInfo
CS.SceneInfo = SceneInfo


---@class SceneItem : UnityEngine.MonoBehaviour
---@field parallaxFactor number
---@field initWorldPosition UnityEngine.Vector3
SceneItem = {}
---@alias CS.SceneItem SceneItem
CS.SceneItem = SceneItem


---@class HelpText : System.Attribute
---@field text string
HelpText = {}
---@alias CS.HelpText HelpText
CS.HelpText = HelpText

---@param description string
---@return HelpText
function HelpText.New(description) end

---@class Commands : System.Object
---@field DebugEnemyHpMultiplier number
---@field DebugEnemyAttackMultiplier number
---@field DebugEnemyGrowthMultiplier number
---@field DebugPlayerMaxHpGainMultiplier number
---@field DebugPlayerHealMultiplier number
---@field DebugPlayerDefendGainMultiplier number
---@field DebugClearShieldOnTurnStart boolean
Commands = {}
---@alias CS.Commands Commands
CS.Commands = Commands

---@param arg string
---@return string
function Commands.help(arg) end
---@return string
function Commands.cls() end
---@param arg1 string
---@param arg2 string
---@return string
function Commands.give(arg1, arg2) end
---@param arg1 string
---@param arg2 string
---@return string
function Commands.copy(arg1, arg2) end
---@param arg1 string
---@param arg2 string
---@return string
function Commands.remove(arg1, arg2) end
---@param packId string
---@return string
function Commands.givepack(packId) end
---@param type string
---@param id2 string
---@return string
function Commands.load(type, id2) end
---@param arg1 string
---@param arg2 string
---@return string
function Commands.dialogue(arg1, arg2) end
---@param arg1 string
---@return string
function Commands.setId(arg1) end
---@param arg1 string
---@return string
function Commands.check(arg1) end
---@param arg1 string
function Commands.updateback(arg1) end
---@param arg1 string
---@param arg2 string
function Commands.Log(arg1, arg2) end
function Commands.showack() end
---@param arg1 string
---@param arg2 string
function Commands.LogWarning(arg1, arg2) end
---@param arg1 string
---@param arg2 string
function Commands.LogError(arg1, arg2) end
---@param arg1 string
---@param arg2 string
function Commands.ShowReward(arg1, arg2) end
---@param arg1 string
function Commands.connect(arg1) end
---@param arg1 string
function Commands.lockitem(arg1) end
function Commands.showann() end
---@param arg1 string
function Commands.unlock(arg1) end
---@param arg1 string
function Commands.eventtrigger(arg1) end
---@param arg1 string
function Commands.auto(arg1) end
---@param field string
---@param value string
---@return string
function Commands.enemyall(field, value) end
---@param type string
---@param field string
---@param value string
---@return string
function Commands.enemytype(type, field, value) end
---@param target string
---@param field string
---@param value string
---@return string
function Commands.enemyone(target, field, value) end
---@param value string
---@return string
function Commands.enemygrow(value) end
---@param target string
---@param buff string
---@param level string
---@return string
function Commands.enemybuff(target, buff, level) end
---@param layer string
---@param buff string
---@param level string
---@return string
function Commands.enemylayerbuff(layer, buff, level) end
---@param value string
---@return string
function Commands.debugmoney(value) end
---@param value string
---@return string
function Commands.debugmaxhp(value) end
---@param value string
---@return string
function Commands.debugheal(value) end
---@param value string
---@return string
function Commands.debugdef(value) end
---@param value string
---@return string
function Commands.debugcleardef(value) end
---@return string
function Commands.debugreset() end
---@param type string
---@return number
function Commands.DebugGetEnemyTypeHpMultiplier(type) end
---@param type string
---@return number
function Commands.DebugGetEnemyTypeAttackMultiplier(type) end
---@param enemy Enemy
---@return number
function Commands.DebugGetEnemyHpMultiplier(enemy) end
---@param enemy Enemy
---@return number
function Commands.DebugGetEnemyAttackMultiplier(enemy) end
---@param levelCount number
---@return number
function Commands.DebugAdjustEnemyGrowthLevelCount(levelCount) end
---@param enemy Enemy
function Commands.DebugApplyEnemyBuffs(enemy) end
function Commands.DebugClearAllShields() end

---@class Commands.EnemyDebugOverride : System.Object
---@field HpMultiplier number
---@field AttackMultiplier number
Commands.EnemyDebugOverride = {}
---@alias CS.Commands.EnemyDebugOverride Commands.EnemyDebugOverride
CS.Commands.EnemyDebugOverride = Commands.EnemyDebugOverride

---@return Commands.EnemyDebugOverride
function Commands.EnemyDebugOverride.New() end

---@class Commands.DebugBuffGrant : System.ValueType
---@field BuffId string
---@field Level number
Commands.DebugBuffGrant = {}
---@alias CS.Commands.DebugBuffGrant Commands.DebugBuffGrant
CS.Commands.DebugBuffGrant = Commands.DebugBuffGrant

---@param buffId string
---@param level number
---@return Commands.DebugBuffGrant
function Commands.DebugBuffGrant.New(buffId, level) end

---@class ConsoleLogic : UnityEngine.MonoBehaviour
ConsoleLogic = {}
---@alias CS.ConsoleLogic ConsoleLogic
CS.ConsoleLogic = ConsoleLogic

---@param command string
---@return string
function ConsoleLogic.Input(command) end
---@return string
function ConsoleLogic.LastCommand() end
---@return string
function ConsoleLogic.NextCommand() end

---@class Dice : System.Object
---@field Default Dice
---@field Value Dice
---@field Check Dice
---@field Type string
---@field Range System.ValueTuple
Dice = {}
---@alias CS.Dice Dice
CS.Dice = Dice

---@param type string
---@return Dice
function Dice:WithType(type) end
---@param min number
---@param max number
---@return Dice
function Dice:WithRange(min, max) end
---@return Dice.State
function Dice:Roll() end

---@class Dice.State : System.Object
---@field Value number
---@field Bonus number
Dice.State = {}
---@alias CS.Dice.State Dice.State
CS.Dice.State = Dice.State

---@param value number
---@param bonus number
---@return Dice.State
function Dice.State.New(value, bonus) end
---@param state Dice.State
function Dice.State:CopyTo(state) end

---@class Dice.RandomCursor : System.Object
---@field val number
Dice.RandomCursor = {}
---@alias CS.Dice.RandomCursor Dice.RandomCursor
CS.Dice.RandomCursor = Dice.RandomCursor

---@param val number
---@return Dice.RandomCursor
function Dice.RandomCursor.New(val) end

---@class DataConfig : System.Object
---@field Type DataType
---@field data System.Collections.Generic.IDictionary
---@field Vars System.Collections.Generic.IDictionary
---@field IsNative boolean
---@field InstanceID string
---@field scriptExecutor IScriptExecutor
---@field isCompiling boolean
DataConfig = {}
---@alias CS.DataConfig DataConfig
CS.DataConfig = DataConfig

---@overload fun(id: string, type: DataType) : DataConfig
---@overload fun(data: System.Collections.Generic.IDictionary, Vars: System.Collections.Generic.IDictionary, ifPreCompile: boolean, type: DataType) : DataConfig
---@return DataConfig
function DataConfig.New() end
function DataConfig.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value DataConfig
---@return ,MemoryPack.MemoryPackReader,DataConfig
function DataConfig.Deserialize(ref_reader, ref_value) end
function DataConfig:PreCompileScripts() end
function DataConfig:ReSetVars() end
---@return System.Object
function DataConfig:Clone() end
---@return IScriptExecutor
function DataConfig:CreateExecutor() end

---@class DataConfig.DataConfigFormatter : MemoryPack.MemoryPackFormatter
DataConfig.DataConfigFormatter = {}
---@alias CS.DataConfig.DataConfigFormatter DataConfig.DataConfigFormatter
CS.DataConfig.DataConfigFormatter = DataConfig.DataConfigFormatter

---@return DataConfig.DataConfigFormatter
function DataConfig.DataConfigFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value DataConfig
---@return ,MemoryPack.MemoryPackReader,DataConfig
function DataConfig.DataConfigFormatter:Deserialize(ref_reader, ref_value) end

---@class DataConfigException : System.Exception
DataConfigException = {}
---@alias CS.DataConfigException DataConfigException
CS.DataConfigException = DataConfigException

---@overload fun(message: string) : DataConfigException
---@param message string
---@param innerException System.Exception
---@return DataConfigException
function DataConfigException.New(message, innerException) end

---@class DataConfigIdNotFoundException : DataConfigException
---@field Id string
DataConfigIdNotFoundException = {}
---@alias CS.DataConfigIdNotFoundException DataConfigIdNotFoundException
CS.DataConfigIdNotFoundException = DataConfigIdNotFoundException

---@param id string
---@return DataConfigIdNotFoundException
function DataConfigIdNotFoundException.New(id) end

---@class DataConfigSerializer : System.Object
DataConfigSerializer = {}
---@alias CS.DataConfigSerializer DataConfigSerializer
CS.DataConfigSerializer = DataConfigSerializer

---@param writer Mirror.NetworkWriter
---@param dataConfig DataConfig
function DataConfigSerializer.WriteDataConfig(writer, dataConfig) end
---@param reader Mirror.NetworkReader
---@return DataConfig
function DataConfigSerializer.ReadDataConfig(reader) end

---@class RoleTable : System.Object
---@field cardList System.Collections.ObjectModel.ObservableCollection
---@field UnCardList System.Collections.ObjectModel.ObservableCollection
---@field relicList System.Collections.ObjectModel.ObservableCollection
---@field enchasedDict System.Collections.Generic.Dictionary
---@field GetCardReward System.Collections.Generic.Dictionary
---@field GetCard System.Collections.Generic.Dictionary
---@field MoneyMultiplier number
---@field WithoutArmedRelicList System.Collections.ObjectModel.ObservableCollection
---@field blessingConfigs System.Collections.ObjectModel.ObservableCollection
---@field relicGets System.Collections.Generic.Dictionary
---@field SkillTime System.Collections.Generic.Dictionary
---@field BuyBlessCount number
---@field MaxAlCardCount number
---@field SpecialVarMap System.Collections.Generic.Dictionary
---@field san number
---@field isDead boolean
---@field IsMoveOn boolean
---@field Id string
---@field SafeBoxRelicCount number
---@field SafeBoxCardCount number
---@field SafeBoxGetMoneyCount number
---@field SafeBoxSaveMoneyCount number
---@field GetRelic boolean
---@field GetCardInBack boolean
---@field IsStarted boolean
---@field maxSan number
---@field Career DataConfig
---@field ExtraordinaryBlessings System.Collections.ObjectModel.ObservableCollection
---@field ChooseVars System.Collections.Generic.List
---@field money Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field VarsMap System.Collections.Generic.Dictionary
---@field relicOwnSc System.Collections.Generic.Dictionary
---@field SpecialCount number
---@field Instance RoleTable
---@field InHighTide boolean
---@field Reward number
---@field sumFeat number
---@field CardCount number
---@field CardBottomCount number
---@field CardTopCount number
---@field MainVarUpperBound number
---@field SecondaryVarUpperBound number
---@field OtherVarUpperBound number
---@field San number
---@field MaxSan number
---@field Money Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field MoneyCal number
RoleTable = {}
---@alias CS.RoleTable RoleTable
CS.RoleTable = RoleTable

---@return RoleTable
function RoleTable.New() end
---@param baseMoney number
---@return number
function RoleTable:ReturnMoneyCal(baseMoney) end
function RoleTable:Listen() end
---@param role RoleTable
function RoleTable:ResetFight(role) end
---@param blessid string
function RoleTable:TryAddBless(blessid) end
---@param key string
function RoleTable:VarsCheck(key) end
---@param key string
---@param value number
function RoleTable:UseVarsChanges(key, value) end
function RoleTable:LevelCount() end
function RoleTable:Init() end
function RoleTable:ResetBackCard() end

---@class CustomRoleTableReaderWriter : System.Object
CustomRoleTableReaderWriter = {}
---@alias CS.CustomRoleTableReaderWriter CustomRoleTableReaderWriter
CS.CustomRoleTableReaderWriter = CustomRoleTableReaderWriter

---@param writer Mirror.NetworkWriter
---@param roleTable RoleTable
function CustomRoleTableReaderWriter.WriteRoleTable(writer, roleTable) end
---@param reader Mirror.NetworkReader
---@return RoleTable
function CustomRoleTableReaderWriter.ReadRoleTable(reader) end

---@class SettingTable : System.Object
---@field dic System.Collections.Generic.Dictionary
---@field onValueChanged System.Collections.Generic.Dictionary
SettingTable = {}
---@alias CS.SettingTable SettingTable
CS.SettingTable = SettingTable

---@return SettingTable
function SettingTable.New() end
---@param key string
---@param value string
function SettingTable:SetValue(key, value) end
---@param key string
---@return string
function SettingTable:GetValue(key) end
function SettingTable:Apply() end
---@param language string
function SettingTable:ChangeLanguage(language) end

---@class GameConfigManager : Singleton
---@field DefaultCardPackId string
---@field PlayerId string
---@field PlayerName string
---@field modConfigs System.Collections.Generic.List
---@field OnAppicationQuit System.Action | function
---@field LimitList System.Collections.Generic.List
---@field ifCompileImmidiate boolean
---@field cts System.Threading.CancellationTokenSource
---@field NativeIds System.Collections.Generic.HashSet
---@field LockedIds System.Collections.Generic.HashSet
---@field isFontWarmup boolean
---@field totalCount number
---@field current number
---@field Version string
---@field DataConfigCache System.Collections.Concurrent.ConcurrentDictionary
---@field isLoading boolean
---@field Instance GameConfigManager -- infered from Singleton`1[GameConfigManager]
---@field GetInstance GameConfigManager -- infered from Singleton`1[GameConfigManager]
GameConfigManager = {}
---@alias CS.GameConfigManager GameConfigManager
CS.GameConfigManager = GameConfigManager

---@return GameConfigManager
function GameConfigManager.New() end
---@param type DataType
---@return GameConfigData
function GameConfigManager:GetTable(type) end
function GameConfigManager:Init() end
---@param path string
function GameConfigManager:LoadResource(path) end
---@param cards System.Collections.Generic.List
---@return System.Collections.Generic.List
function GameConfigManager:CardPackCheck(cards) end
function GameConfigManager:AddNativeIds() end
function GameConfigManager:BuySave() end
---@param item System.Collections.Generic.IDictionary
function GameConfigManager:BuySaveByName(item) end
---@param TheList System.Collections.Generic.List
---@return System.Collections.Generic.List
function GameConfigManager:GetByNote(TheList) end
---@overload fun(self: GameConfigManager, prefix: string) : System.Collections.Generic.Dictionary
---@param list System.Collections.Generic.List
---@param prefix string
---@return System.Collections.Generic.Dictionary
function GameConfigManager:GetDataByPrefix(list, prefix) end
---@param item System.Collections.Generic.IDictionary
---@return string
function GameConfigManager:GetPackBelong(item) end
---@param type DataType
---@param packId string
---@return System.Collections.Generic.List
function GameConfigManager:GetItemsByPack(type, packId) end
---@param packId string
---@return System.Collections.Generic.Dictionary
function GameConfigManager:GetPackItems(packId) end
---@overload fun(self: GameConfigManager, type: DataType, id: string) : System.Collections.Generic.Dictionary
---@param data GameConfigData
---@param id string
---@return System.Collections.Generic.Dictionary
function GameConfigManager:GetOne(data, id) end
---@param id string
---@return DataType
function GameConfigManager:GetTypeById(id) end
---@param id string
---@return System.Collections.Generic.Dictionary
function GameConfigManager:GetOneById(id) end
---@overload fun(self: GameConfigManager, modRootDirectory: string, out_data: Witch.Mod.ModConfigurationData) : boolean, Witch.Mod.ModConfigurationData
---@param mod Witch.Mod.ModConfig
---@param out_data Witch.Mod.ModConfigurationData
---@return boolean,Witch.Mod.ModConfigurationData
function GameConfigManager:TryGetModOwnConfiguration(mod, out_data) end

---@class GameConfigManager.FontWarmupWorker : System.Object
GameConfigManager.FontWarmupWorker = {}
---@alias CS.GameConfigManager.FontWarmupWorker GameConfigManager.FontWarmupWorker
CS.GameConfigManager.FontWarmupWorker = GameConfigManager.FontWarmupWorker

---@param snapshot System.Collections.Generic.List
---@return GameConfigManager.FontWarmupWorker
function GameConfigManager.FontWarmupWorker.New(snapshot) end
---@return System.Char[]
function GameConfigManager.FontWarmupWorker:CollectCharacters() end

---@class DataId : System.Object
---@field Id_2Fight_1 string
---@field Id_2Fight_2 string
---@field Id_2Fight_3 string
---@field Id_2Fight_4 string
---@field Id_2Fight_5 string
---@field Id_2Fight_6 string
---@field Id_2Fight_7 string
---@field Id_2Fight_8 string
---@field Id_3Fight_1 string
---@field Id_3Fight_2 string
---@field Id_3Fight_3 string
---@field Id_3Fight_4 string
---@field Id_3Fight_5 string
---@field Id_3Fight_6 string
---@field Id_3Fight_7 string
---@field Id_3Fight_8 string
---@field Id_3Fight_9 string
---@field Id_4Fight_1 string
---@field Id_4Fight_2 string
---@field Id_4Fight_3 string
---@field Id_4Fight_4 string
---@field Id_4Fight_5 string
---@field Id_7Node_1 string
---@field Id_7Node_2 string
---@field Id_7Node_3 string
---@field Administration_1 string
---@field Administration_10 string
---@field Administration_11 string
---@field Administration_12 string
---@field Administration_13 string
---@field Administration_14 string
---@field Administration_15 string
---@field Administration_16 string
---@field Administration_17 string
---@field Administration_18 string
---@field Administration_2 string
---@field Administration_3 string
---@field Administration_4 string
---@field Administration_5 string
---@field Administration_6 string
---@field Administration_7 string
---@field Administration_8 string
---@field Administration_9 string
---@field Amelia_1 string
---@field CrowdFundingRelic_1 string
---@field CrowdFundingRelic_10 string
---@field CrowdFundingRelic_11 string
---@field CrowdFundingRelic_12 string
---@field CrowdFundingRelic_13 string
---@field CrowdFundingRelic_14 string
---@field CrowdFundingRelic_15 string
---@field CrowdFundingRelic_16 string
---@field CrowdFundingRelic_17 string
---@field CrowdFundingRelic_18 string
---@field CrowdFundingRelic_19 string
---@field CrowdFundingRelic_2 string
---@field CrowdFundingRelic_20 string
---@field CrowdFundingRelic_22 string
---@field CrowdFundingRelic_23 string
---@field CrowdFundingRelic_24 string
---@field CrowdFundingRelic_25 string
---@field CrowdFundingRelic_26 string
---@field CrowdFundingRelic_27 string
---@field CrowdFundingRelic_28 string
---@field CrowdFundingRelic_29 string
---@field CrowdFundingRelic_3 string
---@field CrowdFundingRelic_30 string
---@field CrowdFundingRelic_31 string
---@field CrowdFundingRelic_32 string
---@field CrowdFundingRelic_33 string
---@field CrowdFundingRelic_34 string
---@field CrowdFundingRelic_35 string
---@field CrowdFundingRelic_36 string
---@field CrowdFundingRelic_37 string
---@field CrowdFundingRelic_38 string
---@field CrowdFundingRelic_39 string
---@field CrowdFundingRelic_4 string
---@field CrowdFundingRelic_40 string
---@field CrowdFundingRelic_41 string
---@field CrowdFundingRelic_42 string
---@field CrowdFundingRelic_43 string
---@field CrowdFundingRelic_44 string
---@field CrowdFundingRelic_45 string
---@field CrowdFundingRelic_46 string
---@field CrowdFundingRelic_47 string
---@field CrowdFundingRelic_48 string
---@field CrowdFundingRelic_49 string
---@field CrowdFundingRelic_5 string
---@field CrowdFundingRelic_50 string
---@field CrowdFundingRelic_51 string
---@field CrowdFundingRelic_52 string
---@field CrowdFundingRelic_53 string
---@field CrowdFundingRelic_54 string
---@field CrowdFundingRelic_55 string
---@field CrowdFundingRelic_56 string
---@field CrowdFundingRelic_6 string
---@field CrowdFundingRelic_7 string
---@field CrowdFundingRelic_8 string
---@field CrowdFundingRelic_9 string
---@field CrowdfundingBlessing_1 string
---@field CrowdfundingBlessing_10 string
---@field CrowdfundingBlessing_11 string
---@field CrowdfundingBlessing_12 string
---@field CrowdfundingBlessing_13 string
---@field CrowdfundingBlessing_14 string
---@field CrowdfundingBlessing_15 string
---@field CrowdfundingBlessing_16 string
---@field CrowdfundingBlessing_17 string
---@field CrowdfundingBlessing_18 string
---@field CrowdfundingBlessing_19 string
---@field CrowdfundingBlessing_2 string
---@field CrowdfundingBlessing_20 string
---@field CrowdfundingBlessing_21 string
---@field CrowdfundingBlessing_22 string
---@field CrowdfundingBlessing_24 string
---@field CrowdfundingBlessing_26 string
---@field CrowdfundingBlessing_27 string
---@field CrowdfundingBlessing_28 string
---@field CrowdfundingBlessing_29 string
---@field CrowdfundingBlessing_3 string
---@field CrowdfundingBlessing_30 string
---@field CrowdfundingBlessing_4 string
---@field CrowdfundingBlessing_5 string
---@field CrowdfundingBlessing_7 string
---@field CrowdfundingBlessing_8 string
---@field CrowdfundingBlessing_9 string
---@field Crowdfundingcard_1 string
---@field Crowdfundingcard_10 string
---@field Crowdfundingcard_11 string
---@field Crowdfundingcard_13 string
---@field Crowdfundingcard_14 string
---@field Crowdfundingcard_15 string
---@field Crowdfundingcard_16 string
---@field Crowdfundingcard_17 string
---@field Crowdfundingcard_18 string
---@field Crowdfundingcard_2 string
---@field Crowdfundingcard_20 string
---@field Crowdfundingcard_21 string
---@field Crowdfundingcard_22 string
---@field Crowdfundingcard_23 string
---@field Crowdfundingcard_24 string
---@field Crowdfundingcard_25 string
---@field Crowdfundingcard_26 string
---@field Crowdfundingcard_27 string
---@field Crowdfundingcard_28 string
---@field Crowdfundingcard_29 string
---@field Crowdfundingcard_3 string
---@field Crowdfundingcard_30 string
---@field Crowdfundingcard_31 string
---@field Crowdfundingcard_32 string
---@field Crowdfundingcard_33 string
---@field Crowdfundingcard_34 string
---@field Crowdfundingcard_36 string
---@field Crowdfundingcard_4 string
---@field Crowdfundingcard_40 string
---@field Crowdfundingcard_41 string
---@field Crowdfundingcard_42 string
---@field Crowdfundingcard_43 string
---@field Crowdfundingcard_44 string
---@field Crowdfundingcard_45 string
---@field Crowdfundingcard_46 string
---@field Crowdfundingcard_47 string
---@field Crowdfundingcard_48 string
---@field Crowdfundingcard_49 string
---@field Crowdfundingcard_5 string
---@field Crowdfundingcard_6 string
---@field Crowdfundingcard_7 string
---@field Crowdfundingcard_8 string
---@field Crowdfundingcard_9 string
---@field Crowdfundingenchtag_1 string
---@field Crowdfundingenchtag_10 string
---@field Crowdfundingenchtag_11 string
---@field Crowdfundingenchtag_12 string
---@field Crowdfundingenchtag_13 string
---@field Crowdfundingenchtag_14 string
---@field Crowdfundingenchtag_15 string
---@field Crowdfundingenchtag_16 string
---@field Crowdfundingenchtag_17 string
---@field Crowdfundingenchtag_18 string
---@field Crowdfundingenchtag_19 string
---@field Crowdfundingenchtag_2 string
---@field Crowdfundingenchtag_20 string
---@field Crowdfundingenchtag_21 string
---@field Crowdfundingenchtag_22 string
---@field Crowdfundingenchtag_3 string
---@field Crowdfundingenchtag_4 string
---@field Crowdfundingenchtag_5 string
---@field Crowdfundingenchtag_6 string
---@field Crowdfundingenchtag_8 string
---@field Crowdfundingenchtag_9 string
---@field Exhibition_1 string
---@field Exhibition_10 string
---@field Exhibition_11 string
---@field Exhibition_12 string
---@field Exhibition_13 string
---@field Exhibition_14 string
---@field Exhibition_15 string
---@field Exhibition_16 string
---@field Exhibition_17 string
---@field Exhibition_18 string
---@field Exhibition_19 string
---@field Exhibition_2 string
---@field Exhibition_3 string
---@field Exhibition_4 string
---@field Exhibition_5 string
---@field Exhibition_6 string
---@field Exhibition_7 string
---@field Exhibition_8 string
---@field Exhibition_9 string
---@field FirstBless_1 string
---@field FirstBless_2 string
---@field FirstBless_3 string
---@field FirstBless_4 string
---@field FirstFight_1 string
---@field FirstFight_10 string
---@field FirstFight_11 string
---@field FirstFight_12 string
---@field FirstFight_13 string
---@field FirstFight_14 string
---@field FirstFight_2 string
---@field FirstFight_3 string
---@field FirstFight_4 string
---@field FirstFight_5 string
---@field FirstFight_6 string
---@field FirstFight_7 string
---@field FirstFight_8 string
---@field FirstFight_9 string
---@field FirstShop_1 string
---@field FirstShop_2 string
---@field FirstShop_3 string
---@field FirstShop_4 string
---@field FirstShop_5 string
---@field FirstShop_6 string
---@field FirstShop_7 string
---@field FirstShop_8 string
---@field Hard_1 string
---@field Hard_10 string
---@field Hard_11 string
---@field Hard_13 string
---@field Hard_14 string
---@field Hard_15 string
---@field Hard_16 string
---@field Hard_17 string
---@field Hard_18 string
---@field Hard_19 string
---@field Hard_2 string
---@field Hard_20 string
---@field Hard_21 string
---@field Hard_22 string
---@field Hard_3 string
---@field Hard_4 string
---@field Hard_5 string
---@field Hard_6 string
---@field Hard_7 string
---@field Hard_8 string
---@field Hard_9 string
---@field House1_1 string
---@field House1_10 string
---@field House1_11 string
---@field House1_12 string
---@field House1_2 string
---@field House1_3 string
---@field House1_4 string
---@field House1_5 string
---@field House1_6 string
---@field House1_7 string
---@field House1_8 string
---@field House1_9 string
---@field House2_1 string
---@field House2_10 string
---@field House2_11 string
---@field House2_12 string
---@field House2_13 string
---@field House2_14 string
---@field House2_15 string
---@field House2_16 string
---@field House2_17 string
---@field House2_2 string
---@field House2_3 string
---@field House2_4 string
---@field House2_5 string
---@field House2_6 string
---@field House2_7 string
---@field House2_8 string
---@field House2_9 string
---@field House_1 string
---@field House_10 string
---@field House_11 string
---@field House_12 string
---@field House_13 string
---@field House_14 string
---@field House_15 string
---@field House_16 string
---@field House_17 string
---@field House_18 string
---@field House_19 string
---@field House_2 string
---@field House_20 string
---@field House_21 string
---@field House_22 string
---@field House_23 string
---@field House_3 string
---@field House_4 string
---@field House_5 string
---@field House_6 string
---@field House_7 string
---@field House_8 string
---@field House_9 string
---@field Library2_1 string
---@field Library2_10 string
---@field Library2_11 string
---@field Library2_12 string
---@field Library2_13 string
---@field Library2_14 string
---@field Library2_15 string
---@field Library2_16 string
---@field Library2_17 string
---@field Library2_18 string
---@field Library2_2 string
---@field Library2_3 string
---@field Library2_4 string
---@field Library2_5 string
---@field Library2_6 string
---@field Library2_7 string
---@field Library2_8 string
---@field Library2_9 string
---@field Mapselect_1 string
---@field Mapselect_10 string
---@field Mapselect_11 string
---@field Mapselect_12 string
---@field Mapselect_13 string
---@field Mapselect_14 string
---@field Mapselect_2 string
---@field Mapselect_3 string
---@field Mapselect_4 string
---@field Mapselect_5 string
---@field Mapselect_6 string
---@field Mapselect_7 string
---@field Mapselect_8 string
---@field Mapselect_9 string
---@field PartnerCard_AswiftBlow string
---@field PartnerCard_Combing string
---@field PartnerCard_DeepGrows string
---@field PartnerCard_FuneralBell string
---@field PartnerCard_Hah string
---@field PartnerCard_QuadrupleHits string
---@field PartnerCard_attack string
---@field PartnerCard_defence string
---@field Partner_10001 string
---@field Partner_10002 string
---@field Partner_10003 string
---@field Partner_10004 string
---@field Partner_10005 string
---@field ReturnAgain_1 string
---@field ReturnAgain_10 string
---@field ReturnAgain_11 string
---@field ReturnAgain_12 string
---@field ReturnAgain_13 string
---@field ReturnAgain_14 string
---@field ReturnAgain_15 string
---@field ReturnAgain_2 string
---@field ReturnAgain_3 string
---@field ReturnAgain_4 string
---@field ReturnAgain_5 string
---@field ReturnAgain_6 string
---@field ReturnAgain_7 string
---@field ReturnAgain_8 string
---@field ReturnAgain_9 string
---@field SecondAD_1 string
---@field SecondAD_2 string
---@field SecondAD_3 string
---@field SecondAD_4 string
---@field SecondAD_5 string
---@field SpecialBuff_AllogeneicConcentric string
---@field SpecialBuff_BackToBasics string
---@field SpecialBuff_BlessedByHeaven string
---@field SpecialBuff_CAR_Deadline string
---@field SpecialBuff_CAR_HeroBlessing string
---@field SpecialBuff_CAR_Momentum string
---@field SpecialBuff_CalamityIncarnates string
---@field SpecialBuff_Crow string
---@field SpecialBuff_Demigod_sBody string
---@field SpecialBuff_DesireWitch string
---@field SpecialBuff_Dragon_sBlood string
---@field SpecialBuff_DragonScaleArmor string
---@field SpecialBuff_EndlessDesire string
---@field SpecialBuff_FortuneBoy string
---@field SpecialBuff_GiantDollBear string
---@field SpecialBuff_HJE_AbsoluteShield string
---@field SpecialBuff_HJE_FateDawn string
---@field SpecialBuff_HJE_FateHolyMachine string
---@field SpecialBuff_HJE_FateJudgment string
---@field SpecialBuff_HolyJudgementEngine string
---@field SpecialBuff_Hysteresis string
---@field SpecialBuff_ImmortalGodhead string
---@field SpecialBuff_Irritable string
---@field SpecialBuff_Joker_King string
---@field SpecialBuff_Law_Death string
---@field SpecialBuff_Law_Judgment string
---@field SpecialBuff_Law_Supreme string
---@field SpecialBuff_ManInTheMirror string
---@field SpecialBuff_Mimics string
---@field SpecialBuff_Musician string
---@field SpecialBuff_OriginalSin string
---@field SpecialBuff_Phoenix string
---@field SpecialBuff_Priest string
---@field SpecialBuff_Restrain string
---@field SpecialBuff_Snitch string
---@field SpecialBuff_SwordOfTheDemonKing string
---@field SpecialBuff_ThievesKing string
---@field SpecialBuff_ThirstForBlood string
---@field SpecialBuff_Transcendent string
---@field SpecialBuff_TrialsOfWisdom string
---@field SpecialBuff_Twins string
---@field SpecialBuff_UnparalleledPower string
---@field SpecialBuff_WitchCultists string
---@field SpecialBuff_believer string
---@field SpecialBuff_expiation string
---@field SpecialBuff_fluster string
---@field SpecialBuff_hunting string
---@field SpecialBuff_meow string
---@field SpecialBuff_meowFamiliar string
---@field SpellCard_1 string
---@field SpellCard_10 string
---@field SpellCard_11 string
---@field SpellCard_12 string
---@field SpellCard_13 string
---@field SpellCard_14 string
---@field SpellCard_15 string
---@field SpellCard_16 string
---@field SpellCard_17 string
---@field SpellCard_18 string
---@field SpellCard_19 string
---@field SpellCard_2 string
---@field SpellCard_20 string
---@field SpellCard_21 string
---@field SpellCard_22 string
---@field SpellCard_23 string
---@field SpellCard_3 string
---@field SpellCard_4 string
---@field SpellCard_5 string
---@field SpellCard_6 string
---@field SpellCard_7 string
---@field SpellCard_8 string
---@field SpellCard_9 string
---@field Spring1_1 string
---@field Spring1_10 string
---@field Spring1_11 string
---@field Spring1_12 string
---@field Spring1_13 string
---@field Spring1_14 string
---@field Spring1_2 string
---@field Spring1_3 string
---@field Spring1_4 string
---@field Spring1_5 string
---@field Spring1_6 string
---@field Spring1_7 string
---@field Spring1_8 string
---@field Spring1_9 string
---@field Spring_1 string
---@field Spring_10 string
---@field Spring_11 string
---@field Spring_12 string
---@field Spring_13 string
---@field Spring_14 string
---@field Spring_15 string
---@field Spring_16 string
---@field Spring_17 string
---@field Spring_18 string
---@field Spring_2 string
---@field Spring_3 string
---@field Spring_4 string
---@field Spring_5 string
---@field Spring_6 string
---@field Spring_7 string
---@field Spring_8 string
---@field Spring_9 string
---@field StartTutorial_1 string
---@field StartTutorial_10 string
---@field StartTutorial_11 string
---@field StartTutorial_12 string
---@field StartTutorial_13 string
---@field StartTutorial_14 string
---@field StartTutorial_15 string
---@field StartTutorial_16 string
---@field StartTutorial_17 string
---@field StartTutorial_18 string
---@field StartTutorial_19 string
---@field StartTutorial_2 string
---@field StartTutorial_20 string
---@field StartTutorial_21 string
---@field StartTutorial_22 string
---@field StartTutorial_23 string
---@field StartTutorial_24 string
---@field StartTutorial_25 string
---@field StartTutorial_26 string
---@field StartTutorial_27 string
---@field StartTutorial_28 string
---@field StartTutorial_281 string
---@field StartTutorial_282 string
---@field StartTutorial_283 string
---@field StartTutorial_284 string
---@field StartTutorial_29 string
---@field StartTutorial_291 string
---@field StartTutorial_3 string
---@field StartTutorial_30 string
---@field StartTutorial_31 string
---@field StartTutorial_32 string
---@field StartTutorial_33 string
---@field StartTutorial_34 string
---@field StartTutorial_35 string
---@field StartTutorial_36 string
---@field StartTutorial_37 string
---@field StartTutorial_38 string
---@field StartTutorial_39 string
---@field StartTutorial_4 string
---@field StartTutorial_40 string
---@field StartTutorial_41 string
---@field StartTutorial_42 string
---@field StartTutorial_43 string
---@field StartTutorial_44 string
---@field StartTutorial_45 string
---@field StartTutorial_46 string
---@field StartTutorial_47 string
---@field StartTutorial_48 string
---@field StartTutorial_49 string
---@field StartTutorial_5 string
---@field StartTutorial_50 string
---@field StartTutorial_51 string
---@field StartTutorial_52 string
---@field StartTutorial_53 string
---@field StartTutorial_54 string
---@field StartTutorial_55 string
---@field StartTutorial_56 string
---@field StartTutorial_6 string
---@field StartTutorial_7 string
---@field StartTutorial_8 string
---@field StartTutorial_9 string
---@field StoreHouse_1 string
---@field StoreHouse_10 string
---@field StoreHouse_11 string
---@field StoreHouse_12 string
---@field StoreHouse_13 string
---@field StoreHouse_14 string
---@field StoreHouse_15 string
---@field StoreHouse_16 string
---@field StoreHouse_17 string
---@field StoreHouse_18 string
---@field StoreHouse_19 string
---@field StoreHouse_2 string
---@field StoreHouse_20 string
---@field StoreHouse_21 string
---@field StoreHouse_22 string
---@field StoreHouse_23 string
---@field StoreHouse_24 string
---@field StoreHouse_3 string
---@field StoreHouse_4 string
---@field StoreHouse_5 string
---@field StoreHouse_6 string
---@field StoreHouse_7 string
---@field StoreHouse_8 string
---@field StoreHouse_9 string
---@field WinChruch_1 string
---@field WinChruch_10 string
---@field WinChruch_11 string
---@field WinChruch_12 string
---@field WinChruch_13 string
---@field WinChruch_14 string
---@field WinChruch_15 string
---@field WinChruch_16 string
---@field WinChruch_2 string
---@field WinChruch_3 string
---@field WinChruch_4 string
---@field WinChruch_5 string
---@field WinChruch_6 string
---@field WinChruch_7 string
---@field WinChruch_8 string
---@field WinChruch_9 string
---@field achievement_abyss_1 string
---@field achievement_abyss_2 string
---@field achievement_abyss_3 string
---@field achievement_abyss_4 string
---@field achievement_adela_obsidian_legion string
---@field achievement_boss_demon_king string
---@field achievement_boss_hero_phase3 string
---@field achievement_boss_holy_judgement string
---@field achievement_boss_night_avatar string
---@field achievement_burn_20 string
---@field achievement_choose_branch string
---@field achievement_clean_shot string
---@field achievement_clear_adela string
---@field achievement_clear_ameliya string
---@field achievement_clear_caroline string
---@field achievement_clear_coco string
---@field achievement_clear_emiya string
---@field achievement_clear_nana string
---@field achievement_clear_once string
---@field achievement_clear_slot string
---@field achievement_clear_vivian string
---@field achievement_create_magic string
---@field achievement_damage_2000 string
---@field achievement_defend_400 string
---@field achievement_die_by_alchemy string
---@field achievement_die_by_contract string
---@field achievement_extraordinary_9999 string
---@field achievement_gold_1 string
---@field achievement_heal_100 string
---@field achievement_hp_1000_before_12 string
---@field achievement_large_deck string
---@field achievement_lucky_cap string
---@field achievement_max_hp string
---@field achievement_nana_devour_teammate string
---@field achievement_one_hit_kill string
---@field achievement_perceive_cap string
---@field achievement_play_30 string
---@field achievement_prebattle_setup string
---@field achievement_resentment_99 string
---@field achievement_resurrect_3 string
---@field achievement_safebox string
---@field achievement_send_emoji string
---@field achievement_skip_card_reward string
---@field achievement_small_deck string
---@field achievement_statue_all string
---@field achievement_statue_upgrade string
---@field achievement_strength_cap string
---@field achievement_third_tier_spell string
---@field achievement_tutorial_ameliya string
---@field achievement_unload_relic string
---@field achievement_win_without_card string
---@field achievement_wisdom_cap string
---@field achievement_witch_skill string
---@field blessing_1 string
---@field blessing_10 string
---@field blessing_101 string
---@field blessing_102 string
---@field blessing_103 string
---@field blessing_104 string
---@field blessing_105 string
---@field blessing_106 string
---@field blessing_107 string
---@field blessing_108 string
---@field blessing_109 string
---@field blessing_11 string
---@field blessing_110 string
---@field blessing_111 string
---@field blessing_112 string
---@field blessing_113 string
---@field blessing_114 string
---@field blessing_115 string
---@field blessing_116 string
---@field blessing_12 string
---@field blessing_14 string
---@field blessing_15 string
---@field blessing_19 string
---@field blessing_2 string
---@field blessing_20 string
---@field blessing_21 string
---@field blessing_22 string
---@field blessing_23 string
---@field blessing_24 string
---@field blessing_3 string
---@field blessing_32 string
---@field blessing_33 string
---@field blessing_34 string
---@field blessing_35 string
---@field blessing_36 string
---@field blessing_37 string
---@field blessing_38 string
---@field blessing_39 string
---@field blessing_4 string
---@field blessing_40 string
---@field blessing_41 string
---@field blessing_42 string
---@field blessing_43 string
---@field blessing_44 string
---@field blessing_45 string
---@field blessing_46 string
---@field blessing_47 string
---@field blessing_48 string
---@field blessing_49 string
---@field blessing_5 string
---@field blessing_50 string
---@field blessing_6 string
---@field blessing_7 string
---@field blessing_8 string
---@field blessing_9 string
---@field blood_1 string
---@field blood_10 string
---@field blood_11 string
---@field blood_12 string
---@field blood_13 string
---@field blood_2 string
---@field blood_3 string
---@field blood_4 string
---@field blood_5 string
---@field blood_6 string
---@field blood_7 string
---@field blood_8 string
---@field blood_9 string
---@field buff_AllDharmas string
---@field buff_BonePiercingSpike string
---@field buff_ChaosMark string
---@field buff_DoomPower string
---@field buff_EnergyStorage string
---@field buff_GuleiSummoningArt string
---@field buff_LilithsPact string
---@field buff_ProfaneButterflyHymn string
---@field buff_RegenerationPrayer string
---@field buff_ReturnAgain string
---@field buff_ReturnAgainDoubleNext string
---@field buff_Soul string
---@field buff_SpellNextClearImpregnable string
---@field buff_SpellNextPower2Draw2 string
---@field buff_VowPower string
---@field buff_WailingWall string
---@field buff_barkhide string
---@field buff_biologicalArmor string
---@field buff_bleeding string
---@field buff_bloodriver string
---@field buff_bloodsea string
---@field buff_bloodwall string
---@field buff_burn string
---@field buff_chaos string
---@field buff_chrysalis string
---@field buff_contagion string
---@field buff_counterattack string
---@field buff_cripple string
---@field buff_cycle string
---@field buff_degrade string
---@field buff_eclipse string
---@field buff_elementalBody string
---@field buff_elements string
---@field buff_epiphany string
---@field buff_evergreen string
---@field buff_extraordinary string
---@field buff_fast string
---@field buff_fate string
---@field buff_frenzy string
---@field buff_immortal string
---@field buff_impregnable string
---@field buff_keenedge string
---@field buff_lifelink string
---@field buff_limitdamage string
---@field buff_oblivion string
---@field buff_oniblood string
---@field buff_poised string
---@field buff_rebirth string
---@field buff_resentment string
---@field buff_resilient string
---@field buff_revelation string
---@field buff_reverie string
---@field buff_ritualasceticism string
---@field buff_ritualbloodsacrifice string
---@field buff_ritualbountygold string
---@field buff_ritualbountymana string
---@field buff_ritualcatalyst string
---@field buff_ritualcourage string
---@field buff_ritualcycle string
---@field buff_ritualechostaff string
---@field buff_ritualenlightenment string
---@field buff_ritualoverload string
---@field buff_ritualpyre string
---@field buff_ritualsolidify string
---@field buff_ritualsublimation string
---@field buff_ritualtimeprison string
---@field buff_rotten string
---@field buff_sourcecast string
---@field buff_swordIntent string
---@field buff_synergies string
---@field buff_thorns string
---@field buff_timelock string
---@field buff_timestop string
---@field buff_toxin string
---@field buff_unyielding string
---@field buff_vitality string
---@field buff_vulnerability string
---@field buff_weak string
---@field buff_weakness string
---@field burningcard_1 string
---@field burningcard_2 string
---@field burningcard_3 string
---@field burningcard_4 string
---@field card_1 string
---@field card_10 string
---@field card_11 string
---@field card_12 string
---@field card_13 string
---@field card_14 string
---@field card_15 string
---@field card_16 string
---@field card_17 string
---@field card_18 string
---@field card_2 string
---@field card_3 string
---@field card_4 string
---@field card_5 string
---@field card_6 string
---@field card_7 string
---@field card_8 string
---@field card_9 string
---@field career_1 string
---@field career_2 string
---@field career_3 string
---@field career_4 string
---@field career_5 string
---@field career_6 string
---@field career_7 string
---@field career_8 string
---@field careercard_1 string
---@field careercard_10 string
---@field careercard_11 string
---@field careercard_2 string
---@field careercard_3 string
---@field careercard_4 string
---@field careercard_5 string
---@field careercard_6 string
---@field careercard_7 string
---@field careercard_8 string
---@field careercard_9 string
---@field coin_1 string
---@field coin_2 string
---@field coin_3 string
---@field coin_4 string
---@field combo_1 string
---@field combo_10 string
---@field combo_11 string
---@field combo_12 string
---@field combo_13 string
---@field combo_14 string
---@field combo_15 string
---@field combo_2 string
---@field combo_3 string
---@field combo_4 string
---@field combo_5 string
---@field combo_6 string
---@field combo_7 string
---@field combo_8 string
---@field combo_9 string
---@field counterattackcard_1 string
---@field counterattackcard_10 string
---@field counterattackcard_11 string
---@field counterattackcard_12 string
---@field counterattackcard_13 string
---@field counterattackcard_2 string
---@field counterattackcard_3 string
---@field counterattackcard_4 string
---@field counterattackcard_5 string
---@field counterattackcard_6 string
---@field counterattackcard_7 string
---@field counterattackcard_8 string
---@field counterattackcard_9 string
---@field cursecard_1 string
---@field cursecard_10 string
---@field cursecard_11 string
---@field cursecard_12 string
---@field cursecard_13 string
---@field cursecard_14 string
---@field cursecard_15 string
---@field cursecard_2 string
---@field cursecard_3 string
---@field cursecard_4 string
---@field cursecard_5 string
---@field cursecard_6 string
---@field cursecard_7 string
---@field cursecard_8 string
---@field cursecard_9 string
---@field destiny_1 string
---@field destiny_2 string
---@field destiny_3 string
---@field destiny_4 string
---@field destiny_5 string
---@field destiny_6 string
---@field destiny_7 string
---@field destiny_8 string
---@field destiny_9 string
---@field effect_damage string
---@field elementscard_1 string
---@field elementscard_10 string
---@field elementscard_11 string
---@field elementscard_12 string
---@field elementscard_13 string
---@field elementscard_2 string
---@field elementscard_3 string
---@field elementscard_4 string
---@field elementscard_5 string
---@field elementscard_6 string
---@field elementscard_7 string
---@field elementscard_8 string
---@field elementscard_9 string
---@field enchtag_1 string
---@field enchtag_10 string
---@field enchtag_11 string
---@field enchtag_12 string
---@field enchtag_13 string
---@field enchtag_14 string
---@field enchtag_15 string
---@field enchtag_16 string
---@field enchtag_2 string
---@field enchtag_3 string
---@field enchtag_4 string
---@field enchtag_5 string
---@field enchtag_6 string
---@field enchtag_7 string
---@field enchtag_8 string
---@field enchtag_9 string
---@field ending_1 string
---@field ending_10 string
---@field ending_11 string
---@field ending_12 string
---@field ending_13 string
---@field ending_14 string
---@field ending_2 string
---@field ending_3 string
---@field ending_4 string
---@field ending_5 string
---@field ending_6 string
---@field ending_7 string
---@field ending_8 string
---@field ending_9 string
---@field enemy_10001 string
---@field enemy_10002 string
---@field enemy_10003 string
---@field enemy_10004 string
---@field enemy_10005 string
---@field enemy_10007 string
---@field enemy_10008 string
---@field enemy_10009 string
---@field enemy_10010 string
---@field enemy_10014 string
---@field enemy_10015 string
---@field enemy_10016 string
---@field enemy_10017 string
---@field enemy_10018 string
---@field enemy_10019 string
---@field enemy_10020 string
---@field enemy_10021 string
---@field enemy_10022 string
---@field enemy_10023 string
---@field enemy_10024 string
---@field enemy_10025 string
---@field enemy_10026 string
---@field enemy_10027 string
---@field enemy_10028 string
---@field enemy_10029 string
---@field enemy_10032 string
---@field enemy_10033 string
---@field enemy_10034 string
---@field enemy_10035 string
---@field enemy_10036 string
---@field enemy_10037 string
---@field enemy_10038 string
---@field enemy_10039 string
---@field enemy_10040 string
---@field enemy_10041 string
---@field enemy_10042 string
---@field enemy_10043 string
---@field enemy_10044 string
---@field enemy_10045 string
---@field enemy_10046 string
---@field enemy_10047 string
---@field enemy_10048 string
---@field enemy_10049 string
---@field enemy_10050 string
---@field enemy_10051 string
---@field enemy_10052 string
---@field enemy_10053 string
---@field enemy_10054 string
---@field enemy_10055 string
---@field enemy_10056 string
---@field enemy_10057 string
---@field enemy_10058 string
---@field enemy_10059 string
---@field enemy_10060 string
---@field enemy_10061 string
---@field enemy_99999 string
---@field enemycard_CAR_Hammer string
---@field enemycard_CAR_Shield string
---@field enemycard_CAR_Spear string
---@field enemycard_CAR_Sword string
---@field enemycard_Charge1 string
---@field enemycard_Charge2 string
---@field enemycard_Come string
---@field enemycard_Despair string
---@field enemycard_Dragon_sMajesty string
---@field enemycard_EvilCurse string
---@field enemycard_FallenDragon string
---@field enemycard_FiveHit string
---@field enemycard_FullSupport string
---@field enemycard_GiantClawStrike string
---@field enemycard_HJE_Dawn string
---@field enemycard_HJE_HolyMachine string
---@field enemycard_HJE_Judgment string
---@field enemycard_HighFly string
---@field enemycard_IceShield string
---@field enemycard_Licking string
---@field enemycard_LimePowder string
---@field enemycard_MT1 string
---@field enemycard_MT2 string
---@field enemycard_MakeIneffectiveRays1 string
---@field enemycard_MakeIneffectiveRays2 string
---@field enemycard_NerveReflexes string
---@field enemycard_NeverDead string
---@field enemycard_Observe string
---@field enemycard_OrdinaryFiveHit string
---@field enemycard_OrdinaryHit string
---@field enemycard_OriginalSinCard string
---@field enemycard_OverrunWorkouts string
---@field enemycard_PlugCards1 string
---@field enemycard_PlugCards2 string
---@field enemycard_PlugCards3 string
---@field enemycard_PoisonThrowing string
---@field enemycard_PowerlessCurse string
---@field enemycard_QuadrupleHits string
---@field enemycard_RoyalBarrier string
---@field enemycard_Seduce string
---@field enemycard_SpreadWings string
---@field enemycard_SuperFireBall string
---@field enemycard_Thieves string
---@field enemycard_Toxin1 string
---@field enemycard_Toxin2 string
---@field enemycard_Toxin3 string
---@field enemycard_Toxin4 string
---@field enemycard_VenomSpray string
---@field enemycard_Wake string
---@field enemycard_Weak string
---@field enemycard_WeakLight string
---@field enemycard_WhereverYouGo string
---@field enemycard_Witness string
---@field enemycard_burn string
---@field enemycard_burn1 string
---@field enemycard_burn2 string
---@field enemycard_charmed string
---@field enemycard_defence string
---@field enemycard_fearless string
---@field enemycard_foraging string
---@field enemycard_obtainMoney string
---@field enemycard_psychologicalShock string
---@field enemycard_rejuvenation string
---@field enemycard_specialAttack string
---@field enemycard_thief string
---@field enemycard_vulnerabilityLight string
---@field event_1 string
---@field event_10 string
---@field event_1000 string
---@field event_1001 string
---@field event_1002 string
---@field event_11 string
---@field event_12 string
---@field event_13 string
---@field event_14 string
---@field event_15 string
---@field event_16 string
---@field event_17 string
---@field event_18 string
---@field event_19 string
---@field event_2 string
---@field event_20 string
---@field event_2001 string
---@field event_2002 string
---@field event_2003 string
---@field event_2004 string
---@field event_2005 string
---@field event_2006 string
---@field event_2007 string
---@field event_2008 string
---@field event_2009 string
---@field event_2010 string
---@field event_2011 string
---@field event_2012 string
---@field event_2013 string
---@field event_2014 string
---@field event_2015 string
---@field event_2016 string
---@field event_2017 string
---@field event_2018 string
---@field event_2019 string
---@field event_2020 string
---@field event_21 string
---@field event_3 string
---@field event_4 string
---@field event_7 string
---@field event_8 string
---@field event_9 string
---@field event_999 string
---@field event_Sub_1000_2 string
---@field event_Sub_999_2 string
---@field event_Sub_9_2 string
---@field food_1 string
---@field food_10 string
---@field food_11 string
---@field food_12 string
---@field food_13 string
---@field food_14 string
---@field food_15 string
---@field food_16 string
---@field food_2 string
---@field food_3 string
---@field food_4 string
---@field food_5 string
---@field food_6 string
---@field food_7 string
---@field food_8 string
---@field food_9 string
---@field healcard_1 string
---@field healcard_2 string
---@field healcard_3 string
---@field healcard_4 string
---@field healcard_5 string
---@field healcard_6 string
---@field healcard_7 string
---@field healcard_8 string
---@field healcard_9 string
---@field level_0 string
---@field level_10001 string
---@field level_10002 string
---@field level_10003 string
---@field level_10004 string
---@field level_10005 string
---@field level_10006 string
---@field level_10007 string
---@field level_10008 string
---@field level_10009 string
---@field level_10010 string
---@field level_10011 string
---@field level_10013 string
---@field level_10014 string
---@field level_10015 string
---@field level_10016 string
---@field level_10017 string
---@field level_10018 string
---@field level_10019 string
---@field level_10020 string
---@field level_10021 string
---@field level_10022 string
---@field level_10024 string
---@field level_10025 string
---@field level_10028 string
---@field level_10029 string
---@field level_10030 string
---@field level_10031 string
---@field level_10032 string
---@field level_10033 string
---@field level_10034 string
---@field level_10035 string
---@field level_10036 string
---@field level_10037 string
---@field level_10038 string
---@field level_10039 string
---@field level_10040 string
---@field level_10041 string
---@field level_10042 string
---@field level_10043 string
---@field level_10044 string
---@field level_10045 string
---@field level_10046 string
---@field level_10047 string
---@field level_10048 string
---@field level_10049 string
---@field level_10050 string
---@field level_10051 string
---@field level_10052 string
---@field level_10053 string
---@field level_10054 string
---@field level_99999 string
---@field luckycard_1 string
---@field luckycard_10 string
---@field luckycard_2 string
---@field luckycard_3 string
---@field luckycard_4 string
---@field luckycard_5 string
---@field luckycard_6 string
---@field luckycard_7 string
---@field luckycard_8 string
---@field luckycard_9 string
---@field map_0 string
---@field map_1 string
---@field map_10 string
---@field map_1000 string
---@field map_1001 string
---@field map_1002 string
---@field map_1003 string
---@field map_1004 string
---@field map_1005 string
---@field map_11 string
---@field map_12 string
---@field map_13 string
---@field map_15 string
---@field map_16 string
---@field map_17 string
---@field map_18 string
---@field map_19 string
---@field map_2 string
---@field map_20 string
---@field map_21 string
---@field map_22 string
---@field map_23 string
---@field map_24 string
---@field map_25 string
---@field map_26 string
---@field map_27 string
---@field map_28 string
---@field map_3 string
---@field map_31 string
---@field map_32 string
---@field map_33 string
---@field map_34 string
---@field map_35 string
---@field map_36 string
---@field map_37 string
---@field map_38 string
---@field map_39 string
---@field map_4 string
---@field map_40 string
---@field map_41 string
---@field map_42 string
---@field map_43 string
---@field map_44 string
---@field map_45 string
---@field map_46 string
---@field map_47 string
---@field map_48 string
---@field map_49 string
---@field map_5 string
---@field map_50 string
---@field map_6 string
---@field map_7 string
---@field map_8 string
---@field map_9 string
---@field map_999 string
---@field materials_1 string
---@field materials_10 string
---@field materials_11 string
---@field materials_12 string
---@field materials_13 string
---@field materials_14 string
---@field materials_15 string
---@field materials_16 string
---@field materials_17 string
---@field materials_18 string
---@field materials_19 string
---@field materials_2 string
---@field materials_20 string
---@field materials_21 string
---@field materials_22 string
---@field materials_23 string
---@field materials_24 string
---@field materials_25 string
---@field materials_26 string
---@field materials_27 string
---@field materials_28 string
---@field materials_29 string
---@field materials_3 string
---@field materials_30 string
---@field materials_4 string
---@field materials_5 string
---@field materials_6 string
---@field materials_7 string
---@field materials_8 string
---@field materials_9 string
---@field nocard_1 string
---@field nocard_2 string
---@field nocard_3 string
---@field nocard_4 string
---@field nocard_5 string
---@field onlinecard_1 string
---@field onlinecard_10 string
---@field onlinecard_11 string
---@field onlinecard_12 string
---@field onlinecard_13 string
---@field onlinecard_14 string
---@field onlinecard_15 string
---@field onlinecard_16 string
---@field onlinecard_17 string
---@field onlinecard_2 string
---@field onlinecard_3 string
---@field onlinecard_4 string
---@field onlinecard_5 string
---@field onlinecard_6 string
---@field onlinecard_7 string
---@field onlinecard_8 string
---@field onlinecard_9 string
---@field outsideshop_10 string
---@field outsideshop_16 string
---@field outsideshop_17 string
---@field outsideshop_18 string
---@field outsideshop_19 string
---@field outsideshop_2 string
---@field outsideshop_20 string
---@field outsideshop_21 string
---@field outsideshop_22 string
---@field outsideshop_23 string
---@field outsideshop_24 string
---@field outsideshop_25 string
---@field outsideshop_26 string
---@field outsideshop_27 string
---@field outsideshop_28 string
---@field outsideshop_29 string
---@field outsideshop_3 string
---@field outsideshop_30 string
---@field outsideshop_31 string
---@field outsideshop_32 string
---@field outsideshop_33 string
---@field outsideshop_4 string
---@field outsideshop_5 string
---@field outsideshop_6 string
---@field outsideshop_7 string
---@field outsideshop_8 string
---@field outsideshop_9 string
---@field perceivecard_1 string
---@field perceivecard_3 string
---@field perceivecard_5 string
---@field perceivecard_6 string
---@field relic_1 string
---@field relic_10 string
---@field relic_11 string
---@field relic_12 string
---@field relic_13 string
---@field relic_14 string
---@field relic_15 string
---@field relic_16 string
---@field relic_17 string
---@field relic_18 string
---@field relic_19 string
---@field relic_2 string
---@field relic_20 string
---@field relic_21 string
---@field relic_22 string
---@field relic_23 string
---@field relic_24 string
---@field relic_25 string
---@field relic_26 string
---@field relic_27 string
---@field relic_28 string
---@field relic_29 string
---@field relic_3 string
---@field relic_30 string
---@field relic_31 string
---@field relic_32 string
---@field relic_33 string
---@field relic_34 string
---@field relic_35 string
---@field relic_36 string
---@field relic_37 string
---@field relic_38 string
---@field relic_39 string
---@field relic_4 string
---@field relic_40 string
---@field relic_41 string
---@field relic_42 string
---@field relic_43 string
---@field relic_44 string
---@field relic_45 string
---@field relic_46 string
---@field relic_47 string
---@field relic_48 string
---@field relic_49 string
---@field relic_5 string
---@field relic_50 string
---@field relic_51 string
---@field relic_52 string
---@field relic_53 string
---@field relic_54 string
---@field relic_55 string
---@field relic_56 string
---@field relic_57 string
---@field relic_58 string
---@field relic_59 string
---@field relic_6 string
---@field relic_60 string
---@field relic_61 string
---@field relic_62 string
---@field relic_63 string
---@field relic_64 string
---@field relic_65 string
---@field relic_66 string
---@field relic_67 string
---@field relic_68 string
---@field relic_69 string
---@field relic_7 string
---@field relic_70 string
---@field relic_71 string
---@field relic_72 string
---@field relic_73 string
---@field relic_74 string
---@field relic_75 string
---@field relic_76 string
---@field relic_77 string
---@field relic_78 string
---@field relic_79 string
---@field relic_8 string
---@field relic_80 string
---@field relic_9 string
---@field ritualcard_1 string
---@field ritualcard_10 string
---@field ritualcard_11 string
---@field ritualcard_12 string
---@field ritualcard_13 string
---@field ritualcard_14 string
---@field ritualcard_15 string
---@field ritualcard_16 string
---@field ritualcard_17 string
---@field ritualcard_18 string
---@field ritualcard_19 string
---@field ritualcard_2 string
---@field ritualcard_3 string
---@field ritualcard_4 string
---@field ritualcard_5 string
---@field ritualcard_6 string
---@field ritualcard_7 string
---@field ritualcard_8 string
---@field ritualcard_9 string
---@field role_Adele string
---@field role_Krisna string
---@field role_amelia string
---@field role_berserker string
---@field role_coco string
---@field role_ermia string
---@field role_little_krisna string
---@field role_nana string
---@field role_narrator string
---@field slotCal_1 string
---@field slotCal_2 string
---@field slotCal_3 string
---@field slotCal_4 string
---@field slotCal_5 string
---@field slotReward_1 string
---@field slotReward_2 string
---@field slotReward_3 string
---@field slotReward_4 string
---@field slotReward_5 string
---@field slotReward_6 string
---@field slotReward_7 string
---@field testTask_1 string
---@field timekeeper_1 string
---@field timekeeper_10 string
---@field timekeeper_11 string
---@field timekeeper_12 string
---@field timekeeper_13 string
---@field timekeeper_14 string
---@field timekeeper_15 string
---@field timekeeper_16 string
---@field timekeeper_17 string
---@field timekeeper_18 string
---@field timekeeper_2 string
---@field timekeeper_3 string
---@field timekeeper_4 string
---@field timekeeper_5 string
---@field timekeeper_6 string
---@field timekeeper_7 string
---@field timekeeper_8 string
---@field timekeeper_9 string
---@field tutorial_Action string
---@field tutorial_Action_card string
---@field tutorial_Announcement string
---@field tutorial_Base_attributes string
---@field tutorial_Break string
---@field tutorial_Buff string
---@field tutorial_CardEditor string
---@field tutorial_Defence string
---@field tutorial_DesChoice string
---@field tutorial_DesType string
---@field tutorial_Difficulty_selection string
---@field tutorial_Disaster string
---@field tutorial_Event string
---@field tutorial_Function_bar string
---@field tutorial_Hp string
---@field tutorial_Illustrated_book string
---@field tutorial_Magic_power string
---@field tutorial_Monetary_resources string
---@field tutorial_Outside_upgrades string
---@field tutorial_Piles_fold_piles string
---@field tutorial_Relic string
---@field tutorial_Round string
---@field tutorial_SafeBox string
---@field tutorial_Shop string
---@field tutorial_Test1 string
---@field tutorial_Test2 string
---@field tutorial_Toughness string
---@field universalcard_1 string
---@field universalcard_10 string
---@field universalcard_11 string
---@field universalcard_12 string
---@field universalcard_13 string
---@field universalcard_14 string
---@field universalcard_15 string
---@field universalcard_16 string
---@field universalcard_17 string
---@field universalcard_18 string
---@field universalcard_19 string
---@field universalcard_2 string
---@field universalcard_20 string
---@field universalcard_3 string
---@field universalcard_4 string
---@field universalcard_5 string
---@field universalcard_6 string
---@field universalcard_7 string
---@field universalcard_8 string
---@field universalcard_9 string
DataId = {}
---@alias CS.DataId DataId
CS.DataId = DataId


---@class DataIds : System.Object
---@field Id_2Fight_1 string
---@field Id_2Fight_2 string
---@field Id_2Fight_3 string
---@field Id_2Fight_4 string
---@field Id_2Fight_5 string
---@field Id_2Fight_6 string
---@field Id_2Fight_7 string
---@field Id_2Fight_8 string
---@field Id_2Fight_9 string
---@field Id_3Fight_1 string
---@field Id_3Fight_2 string
---@field Id_3Fight_3 string
---@field Id_3Fight_4 string
---@field Id_3Fight_5 string
---@field Id_3Fight_6 string
---@field Id_3Fight_7 string
---@field Id_3Fight_8 string
---@field Id_3Fight_9 string
---@field Id_4Fight_1 string
---@field Id_4Fight_2 string
---@field Id_4Fight_3 string
---@field Id_4Fight_4 string
---@field Id_4Fight_5 string
---@field Id_7Node_1 string
---@field Id_7Node_2 string
---@field Id_7Node_3 string
---@field Amelia_1 string
---@field BuffKeyword_SpecialBuff_AdvancedWoodenStakes string
---@field BuffKeyword_SpecialBuff_AllogeneicConcentric string
---@field BuffKeyword_SpecialBuff_BackToBasics string
---@field BuffKeyword_SpecialBuff_BlessedByHeaven string
---@field BuffKeyword_SpecialBuff_CalamityIncarnates string
---@field BuffKeyword_SpecialBuff_Crow string
---@field BuffKeyword_SpecialBuff_FortuneBoy string
---@field BuffKeyword_SpecialBuff_GiantDollBear string
---@field BuffKeyword_SpecialBuff_Hysteresis string
---@field BuffKeyword_SpecialBuff_ImmortalGodhead string
---@field BuffKeyword_SpecialBuff_Irritable string
---@field BuffKeyword_SpecialBuff_Law_Death string
---@field BuffKeyword_SpecialBuff_Law_Judgment string
---@field BuffKeyword_SpecialBuff_Law_Supreme string
---@field BuffKeyword_SpecialBuff_ManInTheMirror string
---@field BuffKeyword_SpecialBuff_Mimics string
---@field BuffKeyword_SpecialBuff_Musician string
---@field BuffKeyword_SpecialBuff_Phoenix string
---@field BuffKeyword_SpecialBuff_Priest string
---@field BuffKeyword_SpecialBuff_Restrain string
---@field BuffKeyword_SpecialBuff_Snitch string
---@field BuffKeyword_SpecialBuff_ThievesKing string
---@field BuffKeyword_SpecialBuff_ThirstForBlood string
---@field BuffKeyword_SpecialBuff_Transcendent string
---@field BuffKeyword_SpecialBuff_TrialsOfStrength string
---@field BuffKeyword_SpecialBuff_TrialsOfTenacity string
---@field BuffKeyword_SpecialBuff_TrialsOfWisdom string
---@field BuffKeyword_SpecialBuff_Twins string
---@field BuffKeyword_SpecialBuff_UnparalleledPower string
---@field BuffKeyword_SpecialBuff_WitchCultists string
---@field BuffKeyword_SpecialBuff_believer string
---@field BuffKeyword_SpecialBuff_biologicalInstinct string
---@field BuffKeyword_SpecialBuff_expiation string
---@field BuffKeyword_SpecialBuff_fluster string
---@field BuffKeyword_SpecialBuff_guiltless string
---@field BuffKeyword_SpecialBuff_hunting string
---@field BuffKeyword_SpecialBuff_meow string
---@field BuffKeyword_buff_BonePiercingSpike string
---@field BuffKeyword_buff_ChaosMark string
---@field BuffKeyword_buff_DoomPower string
---@field BuffKeyword_buff_EnergyStorage string
---@field BuffKeyword_buff_GuleiSummoningArt string
---@field BuffKeyword_buff_Lilith_s_Pact string
---@field BuffKeyword_buff_RegenerationPrayer string
---@field BuffKeyword_buff_WailingWall string
---@field BuffKeyword_buff_barkhide string
---@field BuffKeyword_buff_biologicalArmor string
---@field BuffKeyword_buff_bleeding string
---@field BuffKeyword_buff_bloodriver string
---@field BuffKeyword_buff_bloodsea string
---@field BuffKeyword_buff_bloodwall string
---@field BuffKeyword_buff_burn string
---@field BuffKeyword_buff_chaos string
---@field BuffKeyword_buff_chrysalis string
---@field BuffKeyword_buff_contagion string
---@field BuffKeyword_buff_counterattack string
---@field BuffKeyword_buff_cripple string
---@field BuffKeyword_buff_cycle string
---@field BuffKeyword_buff_degrade string
---@field BuffKeyword_buff_eclipse string
---@field BuffKeyword_buff_elementalBody string
---@field BuffKeyword_buff_elements string
---@field BuffKeyword_buff_epiphany string
---@field BuffKeyword_buff_evergreen string
---@field BuffKeyword_buff_extraordinary string
---@field BuffKeyword_buff_fast string
---@field BuffKeyword_buff_fate string
---@field BuffKeyword_buff_frenzy string
---@field BuffKeyword_buff_immortal string
---@field BuffKeyword_buff_impregnable string
---@field BuffKeyword_buff_keenedge string
---@field BuffKeyword_buff_lifelink string
---@field BuffKeyword_buff_limitdamage string
---@field BuffKeyword_buff_oblivion string
---@field BuffKeyword_buff_obsidianKnight string
---@field BuffKeyword_buff_obsidianQueen string
---@field BuffKeyword_buff_obsidianSoldier string
---@field BuffKeyword_buff_oniblood string
---@field BuffKeyword_buff_poised string
---@field BuffKeyword_buff_resilient string
---@field BuffKeyword_buff_revelation string
---@field BuffKeyword_buff_reverie string
---@field BuffKeyword_buff_rotten string
---@field BuffKeyword_buff_sourcecast string
---@field BuffKeyword_buff_swordIntent string
---@field BuffKeyword_buff_synergies string
---@field BuffKeyword_buff_thorns string
---@field BuffKeyword_buff_timelock string
---@field BuffKeyword_buff_timestop string
---@field BuffKeyword_buff_toxin string
---@field BuffKeyword_buff_unyielding string
---@field BuffKeyword_buff_vitality string
---@field BuffKeyword_buff_vulnerability string
---@field BuffKeyword_buff_weak string
---@field BuffKeyword_buff_weakness string
---@field EnchTag_enchtag_1 string
---@field EnchTag_enchtag_10 string
---@field EnchTag_enchtag_11 string
---@field EnchTag_enchtag_12 string
---@field EnchTag_enchtag_13 string
---@field EnchTag_enchtag_14 string
---@field EnchTag_enchtag_15 string
---@field EnchTag_enchtag_2 string
---@field EnchTag_enchtag_3 string
---@field EnchTag_enchtag_4 string
---@field EnchTag_enchtag_5 string
---@field EnchTag_enchtag_6 string
---@field EnchTag_enchtag_7 string
---@field EnchTag_enchtag_8 string
---@field EnchTag_enchtag_9 string
---@field FirstBless_1 string
---@field FirstBless_2 string
---@field FirstBless_3 string
---@field FirstBless_4 string
---@field FirstFight_1 string
---@field FirstFight_2 string
---@field FirstFight_3 string
---@field FirstFight_4 string
---@field FirstFight_5 string
---@field FirstFight_6 string
---@field FirstFight_7 string
---@field FirstFight_8 string
---@field FirstFight_9 string
---@field FirstShop_1 string
---@field FirstShop_2 string
---@field FirstShop_3 string
---@field FirstShop_4 string
---@field FirstShop_5 string
---@field FirstShop_6 string
---@field FirstShop_7 string
---@field FirstShop_8 string
---@field FirstTalk_1 string
---@field FirstTalk_10 string
---@field FirstTalk_11 string
---@field FirstTalk_12 string
---@field FirstTalk_2 string
---@field FirstTalk_3 string
---@field FirstTalk_4 string
---@field FirstTalk_5 string
---@field FirstTalk_6 string
---@field FirstTalk_7 string
---@field FirstTalk_8 string
---@field FirstTalk_9 string
---@field Hard_1 string
---@field Hard_10 string
---@field Hard_11 string
---@field Hard_12 string
---@field Hard_13 string
---@field Hard_14 string
---@field Hard_15 string
---@field Hard_16 string
---@field Hard_17 string
---@field Hard_18 string
---@field Hard_19 string
---@field Hard_2 string
---@field Hard_3 string
---@field Hard_4 string
---@field Hard_5 string
---@field Hard_6 string
---@field Hard_7 string
---@field Hard_8 string
---@field Hard_9 string
---@field Mapselect_1 string
---@field Mapselect_10 string
---@field Mapselect_11 string
---@field Mapselect_12 string
---@field Mapselect_13 string
---@field Mapselect_14 string
---@field Mapselect_2 string
---@field Mapselect_3 string
---@field Mapselect_4 string
---@field Mapselect_5 string
---@field Mapselect_6 string
---@field Mapselect_7 string
---@field Mapselect_8 string
---@field Mapselect_9 string
---@field PartnerCard_AswiftBlow string
---@field PartnerCard_Combing string
---@field PartnerCard_DeepGrows string
---@field PartnerCard_FuneralBell string
---@field PartnerCard_Hah string
---@field PartnerCard_QuadrupleHits string
---@field PartnerCard_attack string
---@field PartnerCard_defence string
---@field Partner_10001 string
---@field Partner_10002 string
---@field SecondAD_1 string
---@field SecondAD_2 string
---@field SecondAD_3 string
---@field SecondAD_4 string
---@field SecondAD_5 string
---@field SpecialBuff_AdvancedWoodenStakes string
---@field SpecialBuff_AllogeneicConcentric string
---@field SpecialBuff_BackToBasics string
---@field SpecialBuff_BlessedByHeaven string
---@field SpecialBuff_CalamityIncarnates string
---@field SpecialBuff_Crow string
---@field SpecialBuff_FortuneBoy string
---@field SpecialBuff_GiantDollBear string
---@field SpecialBuff_Hysteresis string
---@field SpecialBuff_ImmortalGodhead string
---@field SpecialBuff_Irritable string
---@field SpecialBuff_Law_Death string
---@field SpecialBuff_Law_Judgment string
---@field SpecialBuff_Law_Supreme string
---@field SpecialBuff_ManInTheMirror string
---@field SpecialBuff_Mimics string
---@field SpecialBuff_Musician string
---@field SpecialBuff_Phoenix string
---@field SpecialBuff_Priest string
---@field SpecialBuff_Restrain string
---@field SpecialBuff_Snitch string
---@field SpecialBuff_ThievesKing string
---@field SpecialBuff_ThirstForBlood string
---@field SpecialBuff_Transcendent string
---@field SpecialBuff_TrialsOfStrength string
---@field SpecialBuff_TrialsOfTenacity string
---@field SpecialBuff_TrialsOfWisdom string
---@field SpecialBuff_Twins string
---@field SpecialBuff_UnparalleledPower string
---@field SpecialBuff_WitchCultists string
---@field SpecialBuff_believer string
---@field SpecialBuff_biologicalInstinct string
---@field SpecialBuff_expiation string
---@field SpecialBuff_fluster string
---@field SpecialBuff_guiltless string
---@field SpecialBuff_hunting string
---@field SpecialBuff_meow string
---@field StartTutorial_1 string
---@field StartTutorial_2 string
---@field StartTutorial_3 string
---@field StartTutorial_4 string
---@field StartTutorial_5 string
---@field StartTutorial_6 string
---@field Blessing_1 string
---@field Blessing_10 string
---@field Blessing_101 string
---@field Blessing_102 string
---@field Blessing_103 string
---@field Blessing_104 string
---@field Blessing_105 string
---@field Blessing_106 string
---@field Blessing_107 string
---@field Blessing_108 string
---@field Blessing_109 string
---@field Blessing_11 string
---@field Blessing_110 string
---@field Blessing_111 string
---@field Blessing_112 string
---@field Blessing_113 string
---@field Blessing_114 string
---@field Blessing_115 string
---@field Blessing_116 string
---@field Blessing_12 string
---@field Blessing_14 string
---@field Blessing_15 string
---@field Blessing_19 string
---@field Blessing_2 string
---@field Blessing_20 string
---@field Blessing_21 string
---@field Blessing_22 string
---@field Blessing_23 string
---@field Blessing_24 string
---@field Blessing_3 string
---@field Blessing_32 string
---@field Blessing_33 string
---@field Blessing_34 string
---@field Blessing_35 string
---@field Blessing_36 string
---@field Blessing_37 string
---@field Blessing_4 string
---@field Blessing_5 string
---@field Blessing_6 string
---@field Blessing_7 string
---@field Blessing_8 string
---@field Blessing_9 string
---@field Blood_1 string
---@field Blood_10 string
---@field Blood_11 string
---@field Blood_12 string
---@field Blood_13 string
---@field Blood_2 string
---@field Blood_3 string
---@field Blood_4 string
---@field Blood_5 string
---@field Blood_6 string
---@field Blood_7 string
---@field Blood_8 string
---@field Blood_9 string
---@field Buff_BonePiercingSpike string
---@field Buff_ChaosMark string
---@field Buff_DoomPower string
---@field Buff_EnergyStorage string
---@field Buff_GuleiSummoningArt string
---@field Buff_Lilith_s_Pact string
---@field Buff_RegenerationPrayer string
---@field Buff_WailingWall string
---@field Buff_barkhide string
---@field Buff_biologicalArmor string
---@field Buff_bleeding string
---@field Buff_bloodriver string
---@field Buff_bloodsea string
---@field Buff_bloodwall string
---@field Buff_burn string
---@field Buff_chaos string
---@field Buff_chrysalis string
---@field Buff_contagion string
---@field Buff_counterattack string
---@field Buff_cripple string
---@field Buff_cycle string
---@field Buff_degrade string
---@field Buff_eclipse string
---@field Buff_elementalBody string
---@field Buff_elements string
---@field Buff_epiphany string
---@field Buff_evergreen string
---@field Buff_extraordinary string
---@field Buff_fast string
---@field Buff_fate string
---@field Buff_frenzy string
---@field Buff_immortal string
---@field Buff_impregnable string
---@field Buff_keenedge string
---@field Buff_lifelink string
---@field Buff_limitdamage string
---@field Buff_oblivion string
---@field Buff_obsidianKnight string
---@field Buff_obsidianQueen string
---@field Buff_obsidianSoldier string
---@field Buff_oniblood string
---@field Buff_poised string
---@field Buff_resilient string
---@field Buff_revelation string
---@field Buff_reverie string
---@field Buff_ritualasceticism string
---@field Buff_ritualbloodsacrifice string
---@field Buff_ritualbountygold string
---@field Buff_ritualbountymana string
---@field Buff_ritualcatalyst string
---@field Buff_ritualcourage string
---@field Buff_ritualcycle string
---@field Buff_ritualechostaff string
---@field Buff_ritualenlightenment string
---@field Buff_ritualoverload string
---@field Buff_ritualpyre string
---@field Buff_ritualsolidify string
---@field Buff_ritualsublimation string
---@field Buff_ritualtimeprison string
---@field Buff_rotten string
---@field Buff_sourcecast string
---@field Buff_swordIntent string
---@field Buff_synergies string
---@field Buff_thorns string
---@field Buff_timelock string
---@field Buff_timestop string
---@field Buff_toxin string
---@field Buff_unyielding string
---@field Buff_vitality string
---@field Buff_vulnerability string
---@field Buff_weak string
---@field Buff_weakness string
---@field Burningcard_1 string
---@field Burningcard_2 string
---@field Burningcard_3 string
---@field Burningcard_4 string
---@field Card_1 string
---@field Card_10 string
---@field Card_11 string
---@field Card_12 string
---@field Card_13 string
---@field Card_14 string
---@field Card_15 string
---@field Card_16 string
---@field Card_17 string
---@field Card_18 string
---@field Card_2 string
---@field Card_3 string
---@field Card_4 string
---@field Card_5 string
---@field Card_6 string
---@field Card_7 string
---@field Card_8 string
---@field Card_9 string
---@field Career_1 string
---@field Career_2 string
---@field Career_3 string
---@field Career_4 string
---@field Career_5 string
---@field Career_6 string
---@field Careercard_1 string
---@field Careercard_2 string
---@field Careercard_3 string
---@field Careercard_4 string
---@field Careercard_5 string
---@field Careercard_6 string
---@field Careercard_7 string
---@field Coin_1 string
---@field Coin_2 string
---@field Coin_3 string
---@field Combo_1 string
---@field Combo_10 string
---@field Combo_11 string
---@field Combo_12 string
---@field Combo_13 string
---@field Combo_14 string
---@field Combo_15 string
---@field Combo_2 string
---@field Combo_3 string
---@field Combo_4 string
---@field Combo_5 string
---@field Combo_6 string
---@field Combo_7 string
---@field Combo_8 string
---@field Combo_9 string
---@field Counterattackcard_1 string
---@field Counterattackcard_10 string
---@field Counterattackcard_11 string
---@field Counterattackcard_12 string
---@field Counterattackcard_13 string
---@field Counterattackcard_2 string
---@field Counterattackcard_3 string
---@field Counterattackcard_4 string
---@field Counterattackcard_5 string
---@field Counterattackcard_6 string
---@field Counterattackcard_7 string
---@field Counterattackcard_8 string
---@field Counterattackcard_9 string
---@field Cursecard_1 string
---@field Cursecard_10 string
---@field Cursecard_11 string
---@field Cursecard_12 string
---@field Cursecard_2 string
---@field Cursecard_3 string
---@field Cursecard_4 string
---@field Cursecard_5 string
---@field Cursecard_6 string
---@field Cursecard_7 string
---@field Cursecard_8 string
---@field Cursecard_9 string
---@field Effect_damage string
---@field Elementscard_1 string
---@field Elementscard_10 string
---@field Elementscard_11 string
---@field Elementscard_12 string
---@field Elementscard_13 string
---@field Elementscard_2 string
---@field Elementscard_3 string
---@field Elementscard_4 string
---@field Elementscard_5 string
---@field Elementscard_6 string
---@field Elementscard_7 string
---@field Elementscard_8 string
---@field Elementscard_9 string
---@field Enchtag_1 string
---@field Enchtag_10 string
---@field Enchtag_11 string
---@field Enchtag_12 string
---@field Enchtag_13 string
---@field Enchtag_14 string
---@field Enchtag_15 string
---@field Enchtag_2 string
---@field Enchtag_3 string
---@field Enchtag_4 string
---@field Enchtag_5 string
---@field Enchtag_6 string
---@field Enchtag_7 string
---@field Enchtag_8 string
---@field Enchtag_9 string
---@field Ending_1 string
---@field Ending_2 string
---@field Ending_3 string
---@field Ending_4 string
---@field Ending_5 string
---@field Enemy_10001 string
---@field Enemy_10002 string
---@field Enemy_10003 string
---@field Enemy_10004 string
---@field Enemy_10005 string
---@field Enemy_10006 string
---@field Enemy_10007 string
---@field Enemy_10008 string
---@field Enemy_10009 string
---@field Enemy_10010 string
---@field Enemy_10011 string
---@field Enemy_10013 string
---@field Enemy_10014 string
---@field Enemy_10015 string
---@field Enemy_10016 string
---@field Enemy_10017 string
---@field Enemy_10018 string
---@field Enemy_10019 string
---@field Enemy_10020 string
---@field Enemy_10021 string
---@field Enemy_10022 string
---@field Enemy_10023 string
---@field Enemy_10024 string
---@field Enemy_10025 string
---@field Enemy_10026 string
---@field Enemy_10027 string
---@field Enemy_10028 string
---@field Enemy_10029 string
---@field Enemy_10030 string
---@field Enemy_10031 string
---@field Enemy_10032 string
---@field Enemy_10033 string
---@field Enemy_10034 string
---@field Enemy_10035 string
---@field Enemy_10036 string
---@field Enemy_10037 string
---@field Enemy_10038 string
---@field Enemy_10039 string
---@field Enemy_10040 string
---@field Enemy_10041 string
---@field Enemy_10042 string
---@field Enemy_10043 string
---@field Enemy_10044 string
---@field Enemy_10045 string
---@field Enemy_10046 string
---@field Enemy_10047 string
---@field Enemy_99999 string
---@field Enemycard_AddWisdom string
---@field Enemycard_Charge1 string
---@field Enemycard_Charge2 string
---@field Enemycard_Come string
---@field Enemycard_Dragon_sMajesty string
---@field Enemycard_EvilCurse string
---@field Enemycard_FallenDragon string
---@field Enemycard_FiveHit string
---@field Enemycard_FullSupport string
---@field Enemycard_GiantClawStrike string
---@field Enemycard_HighFly string
---@field Enemycard_IceShield string
---@field Enemycard_Licking string
---@field Enemycard_LimePowder string
---@field Enemycard_MT1 string
---@field Enemycard_MT2 string
---@field Enemycard_MakeIneffectiveRays1 string
---@field Enemycard_MakeIneffectiveRays2 string
---@field Enemycard_NerveReflexes string
---@field Enemycard_NeverDead string
---@field Enemycard_Observe string
---@field Enemycard_OrdinaryFiveHit string
---@field Enemycard_OrdinaryHit string
---@field Enemycard_OverrunWorkouts string
---@field Enemycard_PlugCards1 string
---@field Enemycard_PlugCards2 string
---@field Enemycard_PlugCards3 string
---@field Enemycard_PoisonThrowing string
---@field Enemycard_PowerlessCurse string
---@field Enemycard_QuadrupleHits string
---@field Enemycard_SpreadWings string
---@field Enemycard_SuperFireBall string
---@field Enemycard_Thieves string
---@field Enemycard_Toxin1 string
---@field Enemycard_Toxin2 string
---@field Enemycard_Toxin3 string
---@field Enemycard_Toxin4 string
---@field Enemycard_VenomSpray string
---@field Enemycard_Wake string
---@field Enemycard_Weak string
---@field Enemycard_WeakLight string
---@field Enemycard_WhereverYouGo string
---@field Enemycard_Witness string
---@field Enemycard_burn string
---@field Enemycard_burn1 string
---@field Enemycard_burn2 string
---@field Enemycard_charmed string
---@field Enemycard_defence string
---@field Enemycard_fearless string
---@field Enemycard_foraging string
---@field Enemycard_obtainMoney string
---@field Enemycard_psychologicalShock string
---@field Enemycard_rejuvenation string
---@field Enemycard_specialAttack string
---@field Enemycard_thief string
---@field Enemycard_vulnerabilityLight string
---@field Event_1 string
---@field Event_10 string
---@field Event_1000 string
---@field Event_1001 string
---@field Event_11 string
---@field Event_12 string
---@field Event_13 string
---@field Event_14 string
---@field Event_15 string
---@field Event_16 string
---@field Event_17 string
---@field Event_18 string
---@field Event_19 string
---@field Event_2 string
---@field Event_20 string
---@field Event_21 string
---@field Event_3 string
---@field Event_4 string
---@field Event_6 string
---@field Event_7 string
---@field Event_8 string
---@field Event_9 string
---@field Event_999 string
---@field Event_Sub_1000_2 string
---@field Event_Sub_6_2 string
---@field Event_Sub_999_2 string
---@field Event_Sub_9_2 string
---@field Food_1 string
---@field Food_10 string
---@field Food_11 string
---@field Food_12 string
---@field Food_13 string
---@field Food_14 string
---@field Food_15 string
---@field Food_16 string
---@field Food_2 string
---@field Food_3 string
---@field Food_4 string
---@field Food_5 string
---@field Food_6 string
---@field Food_7 string
---@field Food_8 string
---@field Food_9 string
---@field Healcard_1 string
---@field Healcard_2 string
---@field Healcard_3 string
---@field Healcard_4 string
---@field Healcard_5 string
---@field Healcard_6 string
---@field Healcard_7 string
---@field Healcard_8 string
---@field Healcard_9 string
---@field Level_0 string
---@field Level_10001 string
---@field Level_10002 string
---@field Level_10003 string
---@field Level_10004 string
---@field Level_10005 string
---@field Level_10006 string
---@field Level_10007 string
---@field Level_10008 string
---@field Level_10009 string
---@field Level_10010 string
---@field Level_10011 string
---@field Level_10013 string
---@field Level_10014 string
---@field Level_10015 string
---@field Level_10016 string
---@field Level_10017 string
---@field Level_10018 string
---@field Level_10019 string
---@field Level_10020 string
---@field Level_10021 string
---@field Level_10022 string
---@field Level_10024 string
---@field Level_10025 string
---@field Level_10026 string
---@field Level_10027 string
---@field Level_10028 string
---@field Level_10029 string
---@field Level_10030 string
---@field Level_10031 string
---@field Level_10032 string
---@field Level_10033 string
---@field Level_10034 string
---@field Level_10035 string
---@field Level_10036 string
---@field Level_10037 string
---@field Level_10038 string
---@field Level_10039 string
---@field Level_10040 string
---@field Level_10041 string
---@field Level_10042 string
---@field Level_10043 string
---@field Level_10044 string
---@field Level_10045 string
---@field Level_10046 string
---@field Level_99999 string
---@field Luckycard_1 string
---@field Luckycard_10 string
---@field Luckycard_11 string
---@field Luckycard_12 string
---@field Luckycard_2 string
---@field Luckycard_3 string
---@field Luckycard_4 string
---@field Luckycard_5 string
---@field Luckycard_6 string
---@field Luckycard_7 string
---@field Luckycard_8 string
---@field Luckycard_9 string
---@field Map_0 string
---@field Map_1 string
---@field Map_10 string
---@field Map_11 string
---@field Map_12 string
---@field Map_13 string
---@field Map_15 string
---@field Map_16 string
---@field Map_17 string
---@field Map_18 string
---@field Map_19 string
---@field Map_2 string
---@field Map_20 string
---@field Map_21 string
---@field Map_22 string
---@field Map_23 string
---@field Map_24 string
---@field Map_25 string
---@field Map_26 string
---@field Map_27 string
---@field Map_28 string
---@field Map_29 string
---@field Map_3 string
---@field Map_30 string
---@field Map_31 string
---@field Map_32 string
---@field Map_33 string
---@field Map_34 string
---@field Map_35 string
---@field Map_36 string
---@field Map_37 string
---@field Map_38 string
---@field Map_39 string
---@field Map_4 string
---@field Map_40 string
---@field Map_41 string
---@field Map_42 string
---@field Map_43 string
---@field Map_44 string
---@field Map_45 string
---@field Map_46 string
---@field Map_47 string
---@field Map_48 string
---@field Map_49 string
---@field Map_5 string
---@field Map_50 string
---@field Map_51 string
---@field Map_6 string
---@field Map_7 string
---@field Map_8 string
---@field Map_9 string
---@field Materials_1 string
---@field Materials_10 string
---@field Materials_11 string
---@field Materials_12 string
---@field Materials_13 string
---@field Materials_14 string
---@field Materials_15 string
---@field Materials_16 string
---@field Materials_17 string
---@field Materials_18 string
---@field Materials_19 string
---@field Materials_2 string
---@field Materials_20 string
---@field Materials_21 string
---@field Materials_22 string
---@field Materials_23 string
---@field Materials_24 string
---@field Materials_25 string
---@field Materials_26 string
---@field Materials_27 string
---@field Materials_28 string
---@field Materials_29 string
---@field Materials_3 string
---@field Materials_30 string
---@field Materials_4 string
---@field Materials_5 string
---@field Materials_6 string
---@field Materials_7 string
---@field Materials_8 string
---@field Materials_9 string
---@field Nocard_1 string
---@field Nocard_2 string
---@field Nocard_3 string
---@field Nocard_4 string
---@field Onlinecard_1 string
---@field Onlinecard_2 string
---@field Onlinecard_3 string
---@field Onlinecard_4 string
---@field Onlinecard_5 string
---@field Outsideshop_1 string
---@field Outsideshop_10 string
---@field Outsideshop_11 string
---@field Outsideshop_12 string
---@field Outsideshop_13 string
---@field Outsideshop_14 string
---@field Outsideshop_15 string
---@field Outsideshop_16 string
---@field Outsideshop_2 string
---@field Outsideshop_3 string
---@field Outsideshop_4 string
---@field Outsideshop_5 string
---@field Outsideshop_6 string
---@field Outsideshop_7 string
---@field Outsideshop_8 string
---@field Outsideshop_9 string
---@field Perceivecard_1 string
---@field Perceivecard_3 string
---@field Perceivecard_5 string
---@field Perceivecard_6 string
---@field Relic_1 string
---@field Relic_10 string
---@field Relic_11 string
---@field Relic_12 string
---@field Relic_13 string
---@field Relic_14 string
---@field Relic_15 string
---@field Relic_16 string
---@field Relic_17 string
---@field Relic_18 string
---@field Relic_19 string
---@field Relic_2 string
---@field Relic_20 string
---@field Relic_21 string
---@field Relic_22 string
---@field Relic_23 string
---@field Relic_24 string
---@field Relic_25 string
---@field Relic_26 string
---@field Relic_27 string
---@field Relic_28 string
---@field Relic_29 string
---@field Relic_3 string
---@field Relic_30 string
---@field Relic_31 string
---@field Relic_32 string
---@field Relic_33 string
---@field Relic_34 string
---@field Relic_35 string
---@field Relic_36 string
---@field Relic_37 string
---@field Relic_38 string
---@field Relic_39 string
---@field Relic_4 string
---@field Relic_40 string
---@field Relic_41 string
---@field Relic_42 string
---@field Relic_43 string
---@field Relic_44 string
---@field Relic_45 string
---@field Relic_46 string
---@field Relic_47 string
---@field Relic_48 string
---@field Relic_49 string
---@field Relic_5 string
---@field Relic_50 string
---@field Relic_51 string
---@field Relic_52 string
---@field Relic_53 string
---@field Relic_54 string
---@field Relic_55 string
---@field Relic_56 string
---@field Relic_57 string
---@field Relic_58 string
---@field Relic_59 string
---@field Relic_6 string
---@field Relic_60 string
---@field Relic_61 string
---@field Relic_62 string
---@field Relic_63 string
---@field Relic_64 string
---@field Relic_65 string
---@field Relic_66 string
---@field Relic_67 string
---@field Relic_68 string
---@field Relic_69 string
---@field Relic_7 string
---@field Relic_70 string
---@field Relic_71 string
---@field Relic_72 string
---@field Relic_73 string
---@field Relic_74 string
---@field Relic_75 string
---@field Relic_76 string
---@field Relic_77 string
---@field Relic_78 string
---@field Relic_79 string
---@field Relic_8 string
---@field Relic_80 string
---@field Relic_9 string
---@field Role_Adele string
---@field Role_Krisna string
---@field Role_amelia string
---@field Role_narrator string
---@field Shadowchat1_1 string
---@field Shadowchat1_10 string
---@field Shadowchat1_2 string
---@field Shadowchat1_3 string
---@field Shadowchat1_4 string
---@field Shadowchat1_5 string
---@field Shadowchat1_6 string
---@field Shadowchat1_7 string
---@field Shadowchat1_8 string
---@field Shadowchat1_9 string
---@field TestTask_1 string
---@field Timekeeper_1 string
---@field Timekeeper_10 string
---@field Timekeeper_11 string
---@field Timekeeper_12 string
---@field Timekeeper_13 string
---@field Timekeeper_14 string
---@field Timekeeper_15 string
---@field Timekeeper_16 string
---@field Timekeeper_17 string
---@field Timekeeper_18 string
---@field Timekeeper_2 string
---@field Timekeeper_3 string
---@field Timekeeper_4 string
---@field Timekeeper_5 string
---@field Timekeeper_6 string
---@field Timekeeper_7 string
---@field Timekeeper_8 string
---@field Timekeeper_9 string
---@field Tutorial_Action string
---@field Tutorial_Action_card string
---@field Tutorial_Announcement string
---@field Tutorial_Base_attributes string
---@field Tutorial_Break string
---@field Tutorial_Buff string
---@field Tutorial_CardEditor string
---@field Tutorial_Defence string
---@field Tutorial_DesChoice string
---@field Tutorial_DesType string
---@field Tutorial_Difficulty_selection string
---@field Tutorial_Disaster string
---@field Tutorial_Event string
---@field Tutorial_Function_bar string
---@field Tutorial_Hp string
---@field Tutorial_Illustrated_book string
---@field Tutorial_Magic_power string
---@field Tutorial_Monetary_resources string
---@field Tutorial_Outside_upgrades string
---@field Tutorial_Piles_fold_piles string
---@field Tutorial_Relic string
---@field Tutorial_Round string
---@field Tutorial_SafeBox string
---@field Tutorial_Shop string
---@field Tutorial_Test1 string
---@field Tutorial_Test2 string
---@field Tutorial_Toughness string
---@field Universalcard_1 string
---@field Universalcard_10 string
---@field Universalcard_11 string
---@field Universalcard_12 string
---@field Universalcard_13 string
---@field Universalcard_14 string
---@field Universalcard_15 string
---@field Universalcard_16 string
---@field Universalcard_17 string
---@field Universalcard_18 string
---@field Universalcard_19 string
---@field Universalcard_2 string
---@field Universalcard_20 string
---@field Universalcard_3 string
---@field Universalcard_4 string
---@field Universalcard_5 string
---@field Universalcard_6 string
---@field Universalcard_7 string
---@field Universalcard_8 string
---@field Universalcard_9 string
DataIds = {}
---@alias CS.DataIds DataIds
CS.DataIds = DataIds


---@class ObjectPool : Singleton
---@field Instance ObjectPool -- infered from Singleton`1[ObjectPool]
---@field GetInstance ObjectPool -- infered from Singleton`1[ObjectPool]
ObjectPool = {}
---@alias CS.ObjectPool ObjectPool
CS.ObjectPool = ObjectPool

---@return ObjectPool
function ObjectPool.New() end
---@param prefab UnityEngine.GameObject
---@param parent UnityEngine.Transform
---@return UnityEngine.GameObject
function ObjectPool:Get(prefab, parent) end
---@param prefab UnityEngine.GameObject
---@param count number
---@param batchSize number
---@param cancellationToken System.Threading.CancellationToken
---@return Cysharp.Threading.Tasks.UniTask
function ObjectPool:PreloadAsync(prefab, count, batchSize, cancellationToken) end
---@param obj UnityEngine.GameObject
function ObjectPool:Release(obj) end
function ObjectPool:Clear() end

---@class RandomPool : System.Object
RandomPool = {}
---@alias CS.RandomPool RandomPool
CS.RandomPool = RandomPool

---@param datas System.Collections.Generic.List
---@param fromDice Dice
---@return RandomPool
function RandomPool.New(datas, fromDice) end
---@param property string
---@param count number
---@param propertyWeightDic System.Collections.Generic.Dictionary
---@return System.Collections.Generic.List
function RandomPool:DrawByProperty(property, count, propertyWeightDic) end
---@param count number
---@param typeWeightDic System.Collections.Generic.Dictionary
---@return System.Collections.Generic.List
function RandomPool:DrawByType(count, typeWeightDic) end
---@param count number
---@param typeWeightDic System.Collections.Generic.Dictionary
---@return System.Collections.Generic.List
function RandomPool:DrawByNote(count, typeWeightDic) end
---@param count number
---@return System.Collections.Generic.List
function RandomPool:DrawByCount(count) end
---@param count number
---@return System.Collections.Generic.List
function RandomPool:DrawByRarity(count) end
---@param count number
---@param tagWeightDic System.Collections.Generic.Dictionary
---@return System.Collections.Generic.List
function RandomPool:DrawByTag(count, tagWeightDic) end

---@class GameRuntimeData : Singleton
---@field savePath string
---@field key string
---@field iv string
---@field isEncrypted boolean
---@field MaxExp number
---@field md5 string
---@field playCount number
---@field Level Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field Exp Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field time Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field Gain System.Collections.Generic.Dictionary
---@field roleTable RoleTable
---@field TutorialData System.Collections.Generic.Dictionary
---@field IsTutorialCompleted System.Collections.Generic.Dictionary
---@field truth Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field PlayerId string
---@field UseCardPack System.Collections.Generic.HashSet
---@field Money number
---@field HardTags System.Collections.Generic.List
---@field UnLockDataConfigs System.Collections.Generic.HashSet
---@field AchievementTable Witch.UI.Window.AchievementTable
---@field BuyedItems System.Collections.Generic.Dictionary
---@field UsedBuyedItems System.Collections.Generic.HashSet
---@field Items System.Collections.ObjectModel.ObservableCollection
---@field CardData System.Collections.Generic.List
---@field RelicData System.Collections.Generic.List
---@field MeetEvents System.Collections.Generic.Dictionary
---@field settingTable SettingTable
---@field Time Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field Saves System.Collections.Generic.List
---@field Truth Loxodon.Framework.Obfuscation.ObfuscatedInt
---@field Instance GameRuntimeData -- infered from Singleton`1[GameRuntimeData]
---@field GetInstance GameRuntimeData -- infered from Singleton`1[GameRuntimeData]
GameRuntimeData = {}
---@alias CS.GameRuntimeData GameRuntimeData
CS.GameRuntimeData = GameRuntimeData

---@return GameRuntimeData
function GameRuntimeData.New() end
---@overload fun(path: string) : GameRuntimeData
function GameRuntimeData:Load() end
---@param str string
---@return string
function GameRuntimeData.Md5(str) end
function GameRuntimeData:Init() end
---@param id string
---@param type string
function GameRuntimeData:AddItem(id, type) end
function GameRuntimeData:Save() end
---@param data GameRuntimeData
---@return boolean
function GameRuntimeData:SaveDataCheck(data) end
---@param Id string
---@return boolean
function GameRuntimeData:IsLocked(Id) end

---@class ObfuscateIntConverter : Newtonsoft.Json.JsonConverter
ObfuscateIntConverter = {}
---@alias CS.ObfuscateIntConverter ObfuscateIntConverter
CS.ObfuscateIntConverter = ObfuscateIntConverter

---@return ObfuscateIntConverter
function ObfuscateIntConverter.New() end
---@param writer Newtonsoft.Json.JsonWriter
---@param value Loxodon.Framework.Obfuscation.ObfuscatedInt
---@param serializer Newtonsoft.Json.JsonSerializer
function ObfuscateIntConverter:WriteJson(writer, value, serializer) end
---@param reader Newtonsoft.Json.JsonReader
---@param objectType System.Type
---@param existingValue Loxodon.Framework.Obfuscation.ObfuscatedInt
---@param hasExistingValue boolean
---@param serializer Newtonsoft.Json.JsonSerializer
---@return Loxodon.Framework.Obfuscation.ObfuscatedInt
function ObfuscateIntConverter:ReadJson(reader, objectType, existingValue, hasExistingValue, serializer) end

---@class HardTagEntry : System.Object
---@field Data System.Collections.Generic.Dictionary
---@field DynamicValue number
HardTagEntry = {}
---@alias CS.HardTagEntry HardTagEntry
CS.HardTagEntry = HardTagEntry

---@param data System.Collections.Generic.Dictionary
---@param dynamicValue number
---@return HardTagEntry
function HardTagEntry.New(data, dynamicValue) end

---@class ScriptExecutor : System.Object
---@field luaEnv XLua.LuaEnv
---@field luaTable XLua.LuaTable
---@field GetStatus System.Collections.Generic.Dictionary
---@field handlers System.Collections.Generic.List
---@field status IStatusManager
---@field Self IStatusManager
---@field Object System.Collections.Generic.List
---@field dataConfig IDataConfig
---@field Target IStatusManager
---@field ScriptDict System.Collections.Generic.Dictionary
---@field Id string
---@field ValueDice ScriptExecutor.DiceWrapper
---@field CheckDice ScriptExecutor.DiceWrapper
---@field DefaultDice ScriptExecutor.DiceWrapper
---@field Vars System.Collections.Generic.IDictionary
---@field HandCard System.Collections.Generic.List
---@field WaitCard System.Collections.Generic.List
---@field DeckCard System.Collections.Generic.List
---@field UsedCard System.Collections.Generic.List
ScriptExecutor = {}
---@alias CS.ScriptExecutor ScriptExecutor
CS.ScriptExecutor = ScriptExecutor

---@param val string
function ScriptExecutor:SetHp(val) end
---@param val string
function ScriptExecutor:SetMaxHp(val) end
---@param val string
function ScriptExecutor:ChangeHp(val) end
---@param val string
function ScriptExecutor:PureChangeHp(val) end
---@param val string
function ScriptExecutor:ChangeSkill(val) end
---@param id string
function ScriptExecutor:AddCardById(id) end
---@param Id string
---@param toUsed boolean
function ScriptExecutor:AddCardToDeckById(Id, toUsed) end
---@param toUsed boolean
function ScriptExecutor:AddFakeCard(toUsed) end
---@param dataConfig DataConfig
---@param toUsed boolean
function ScriptExecutor:AddCardToFightManager(dataConfig, toUsed) end
---@param val string
function ScriptExecutor:ChangeMaxHp(val) end
---@param buffId string
---@param level string
function ScriptExecutor:AddBuff(buffId, level) end
---@param buffId string
function ScriptExecutor:RemoveBuff(buffId) end
---@param buffId string
---@param eventName string
function ScriptExecutor:RunImmediately(buffId, eventName) end
---@param value string
function ScriptExecutor:Resurrection(value) end
---@param val string
function ScriptExecutor:ChangeDefence(val) end
---@param val string
function ScriptExecutor:SetPower(val) end
---@param val string
function ScriptExecutor:DrawCount(val) end
---@param val string
function ScriptExecutor:ChangePower(val) end
---@param val string
function ScriptExecutor:ChangeMaxPower(val) end
function ScriptExecutor:ChangeRound() end
---@param index string
function ScriptExecutor:DoAction(index) end
---@param val string
---@param good string
function ScriptExecutor:RemoveBadBuff(val, good) end
---@param obj string
function ScriptExecutor:RemoveAllBadBuff(obj) end
function ScriptExecutor:RemoveAllBuff() end
---@param count string
---@param tag string
function ScriptExecutor:AddCardByCardList(count, tag) end
---@param count string
---@param tag string
function ScriptExecutor:AddCardByUsedCardList(count, tag) end
---@param id string
function ScriptExecutor:RandomAddCard(id) end
---@param val string
---@param changeMax string
function ScriptExecutor:ChangeMoney(val, changeMax) end
---@param count string
function ScriptExecutor:AddAction(count) end
function ScriptExecutor:ShuffleDeck() end
function ScriptExecutor:ShuffleHand() end
---@param val string
function ScriptExecutor:ChangeCardTop(val) end
---@param count string
---@param tag string
function ScriptExecutor:GetCardByTag(count, tag) end
---@param id string
function ScriptExecutor:AddCard(id) end
---@param Id string
---@param AddTag string
function ScriptExecutor:AddCardByData(Id, AddTag) end
---@param Id string
function ScriptExecutor:ChangeCareer(Id) end
---@param Isshow boolean
function ScriptExecutor:ChangeSummon(Isshow) end
---@param eventName string
---@param script System.Action | function
function ScriptExecutor:AddEvent(eventName, script) end
---@param eventName string
---@param script System.Action | function
function ScriptExecutor:AddTempEvent(eventName, script) end
---@param name string
---@param script System.Action | function
function ScriptExecutor:AddEventWithVar(name, script) end
---@param varName string
---@param value string
function ScriptExecutor:ChangeDynamicVar(varName, value) end
---@param varName string
---@param value string
function ScriptExecutor:ChangeDynamicVarPercent(varName, value) end
---@param type string
---@param val string
function ScriptExecutor:ChangeVars(type, val) end
---@param key string
---@param value number
function ScriptExecutor:SetDamageFilter(key, value) end
---@param key string
---@param delta number
function ScriptExecutor:AddDamageFilter(key, delta) end
---@param key string
function ScriptExecutor:RemoveDamageFilter(key) end
function ScriptExecutor:ClearDamageFilter() end
---@param val string
---@param type string
function ScriptExecutor:ThrowCard(val, type) end
---@param val string
---@param type string
function ScriptExecutor:BurnCard(val, type) end
---@param args System.Object[]
function ScriptExecutor:Undone(args) end
---@param idata IDataConfig
function ScriptExecutor:GetCardFromDeck(idata) end
function ScriptExecutor:UpdateSkillTime() end
---@param idata IDataConfig
function ScriptExecutor:UseCard(idata) end
---@param theData IDataConfig
---@param tag string
---@return boolean
function ScriptExecutor:TagCheck(theData, tag) end
---@param buffId string
---@param action System.Action | function
function ScriptExecutor:RepeatByBuffLevel(buffId, action) end
---@param ritualBuffId string
---@param eventName string
function ScriptExecutor:RepeatRitualEcho(ritualBuffId, eventName) end
function ScriptExecutor:UpdateAllDharmasSpellList() end
function ScriptExecutor:ClearAllDharmasSpellList() end
---@param outData DataConfig
function ScriptExecutor:AddEnemyAction(outData) end
---@param action System.Action | function
function ScriptExecutor:FightRelicCheck(action) end
---@param count string
function ScriptExecutor:Resentment(count) end
---@param thisId string
---@return boolean
function ScriptExecutor:CheckFrom(thisId) end
---@param count string
---@param onCardSelected System.Action | function
---@param type string
function ScriptExecutor:ChooseCardToAction(count, onCardSelected, type) end
---@param count string
---@param source System.Collections.Generic.List
---@param AddTag string
function ScriptExecutor:CopyCardWare(count, source, AddTag) end
---@param count string
---@param source System.Collections.Generic.List
---@param AddTag string
---@return Cysharp.Threading.Tasks.UniTask
function ScriptExecutor:CopyCard(count, source, AddTag) end
---@param config IDataConfig
function ScriptExecutor:CreateCard(config) end
function ScriptExecutor:DesEnemyAction() end
---@return FightType
function ScriptExecutor:returnFightType() end
---@param fromdata IDataConfig
function ScriptExecutor:BurnCardByData(fromdata) end
function ScriptExecutor:UpdateRelicShow() end
---@param count string
function ScriptExecutor:ReplaceSelfRelicWithRandomRelic(count) end
function ScriptExecutor:ComboSc() end
---@return boolean
function ScriptExecutor:ComboCheck() end
function ScriptExecutor:EndTheGame() end
function ScriptExecutor:EscapeFight() end
function ScriptExecutor:LossFight() end
---@param count string
function ScriptExecutor:RandomAddBuff(count) end
---@param count string
function ScriptExecutor:RandomAddBuffAndAbility(count) end
---@param count string
---@param type string
function ScriptExecutor:RandomAddGoodBuff(count, type) end
---@param id string
function ScriptExecutor:AddEnemy(id) end
---@return string
function ScriptExecutor:atk() end
---@param eventName string
---@param action System.Action | function
function ScriptExecutor:AddBaseEvent(eventName, action) end
---@param status IStatusManager
---@return Enemy
function ScriptExecutor:GetEnemy(status) end
---@return string
function ScriptExecutor:def() end
function ScriptExecutor:CallEffect() end
---@param val string
---@param fromDataId string
---@param fromId string
---@param damagetype string
function ScriptExecutor:OnlineDamage(val, fromDataId, fromId, damagetype) end
---@param val string
---@param damagetype string
function ScriptExecutor:Damage(val, damagetype) end
---@param Minrarity string
---@param Maxrairty string
---@return System.Collections.Generic.List
function ScriptExecutor:GetcardsByRarity(Minrarity, Maxrairty) end
---@return System.Collections.Generic.List
function ScriptExecutor:GetcardsOutLock() end
---@return DataConfig
function ScriptExecutor:EnchGetCard() end
---@param card IDataConfig
---@return DataConfig
function ScriptExecutor:CardGetEnch(card) end
---@param count string
---@param source System.Collections.Generic.List
---@param action System.Action | function
---@param DelayTime number
function ScriptExecutor:PackToDeckAction(count, source, action, DelayTime) end
---@param count string
---@param source System.Collections.Generic.List
---@param action System.Action | function
---@param DelayTime number
---@return Cysharp.Threading.Tasks.UniTask
function ScriptExecutor:GetDeckUIToAction(count, source, action, DelayTime) end
---@param count string
---@param source System.Collections.Generic.List
---@param tag string
---@return Cysharp.Threading.Tasks.UniTask
function ScriptExecutor:AddCardByDeck(count, source, tag) end
---@param count string
---@param source System.Collections.Generic.List
---@param cardevent System.Action | function
function ScriptExecutor:OutFightSelectCardToAction(count, source, cardevent) end
---@param searchId string
function ScriptExecutor:SetStatusById(searchId) end
---@overload fun(self: ScriptExecutor, filter: string) : System.Collections.Generic.List
---@overload fun(self: ScriptExecutor, statuses: System.Collections.Generic.IEnumerable) : System.Collections.Generic.List
---@param statuses ZLinq.ValueEnumerable
---@return System.Collections.Generic.List
function ScriptExecutor:SetStatus(statuses) end
---@param status IStatusManager
---@param effectName string
function ScriptExecutor:ProcessEffect(status, effectName) end
---@param percent number
---@param action System.Action | function
function ScriptExecutor:DiceCheck(percent, action) end
---@param action System.Action | function
function ScriptExecutor:ForAllStatus(action) end
---@param content string
function ScriptExecutor:Log(content) end
---@overload fun(self: ScriptExecutor, propertyName: string, action: System.Action | function)
---@param propertyName string
---@param action System.Action | function
function ScriptExecutor:WatchRoleTable(propertyName, action) end
---@overload fun(self: ScriptExecutor, index: string, type: string, value: string)
---@overload fun(self: ScriptExecutor, index: string, type: string, value: number)
---@overload fun(self: ScriptExecutor, index: string, type: string, value: number)
---@param index string
---@param type string
---@param value number
function ScriptExecutor:AddDescription(index, type, value) end
---@param index string
---@return string
function ScriptExecutor:GetDesValue(index) end
---@param scriptId string
---@param scriptName string
function ScriptExecutor:CallScript(scriptId, scriptName) end
---@param ScriptName string
---@param options Microsoft.CodeAnalysis.Scripting.ScriptOptions
function ScriptExecutor:PreCompileScripts(ScriptName, options) end
---@param ScriptsName string
function ScriptExecutor:RunScript(ScriptsName) end
function ScriptExecutor:Clear() end
---@param eventName string
---@param parameters System.String[]
---@return boolean
function ScriptExecutor:TrySendOnlineEvent(eventName, parameters) end

---@class ScriptExecutor.DiceWrapper : System.Object
---@field OnRoll System.Action | function
---@field result Dice.State
ScriptExecutor.DiceWrapper = {}
---@alias CS.ScriptExecutor.DiceWrapper ScriptExecutor.DiceWrapper
CS.ScriptExecutor.DiceWrapper = ScriptExecutor.DiceWrapper

---@param dice Dice
---@return ScriptExecutor.DiceWrapper
function ScriptExecutor.DiceWrapper.New(dice) end
---@param Target System.Nullable
---@return Dice.State
function ScriptExecutor.DiceWrapper:InternalRoll(Target) end
---@param Target System.Nullable
---@return Dice.State
function ScriptExecutor.DiceWrapper:Roll(Target) end
---@param min number
---@param max number
---@return Dice
function ScriptExecutor.DiceWrapper:WithRange(min, max) end

---@class ScriptExecutor.PlayerInfo : System.Object
---@field TrueCount number
---@field MaxHp number
---@field Hp number
---@field Power number
---@field MaxPower number
---@field RelicCount number
---@field CardTopCount number
---@field enemylevel number
---@field enemyCount number
---@field CardTotalCount number
---@field BlessingCount number
---@field Money number
---@field MoneyMultiplier number
---@field Level number
---@field LastCard IDataConfig
---@field Win FightType
---@field Loss FightType
---@field Enemy FightType
---@field Pattern FightType
---@field Player FightType
---@field Escape FightType
---@field CardList System.Collections.Generic.List
---@field UnCardList System.Collections.Generic.List
---@field BlessingList System.Collections.Generic.List
---@field RelicList System.Collections.Generic.List
---@field PlayerCount number
---@field Reward number
---@field Strength number
---@field DefaultRoll number
---@field Lucky number
---@field Wisdom number
---@field Perceive number
---@field TempStrength number
---@field TempLucky number
---@field TempWisdom number
---@field SkillTime System.Collections.Generic.Dictionary
---@field ChooseVars System.Collections.Generic.List
---@field MainVarUpperBound number
---@field SecondaryVarUpperBound number
---@field OtherVarUpperBound number
---@field TempPerceive number
---@field PlayerName string
---@field SpecialVars System.Collections.Generic.Dictionary
ScriptExecutor.PlayerInfo = {}
---@alias CS.ScriptExecutor.PlayerInfo ScriptExecutor.PlayerInfo
CS.ScriptExecutor.PlayerInfo = ScriptExecutor.PlayerInfo

---@return string
function ScriptExecutor.PlayerInfo.GetTagDiff() end
---@param text string
function ScriptExecutor.PlayerInfo.ChangeEventSubtip(text) end
---@param type FightType
function ScriptExecutor.PlayerInfo.ChangeType(type) end
function ScriptExecutor.PlayerInfo.WinTheFight() end
function ScriptExecutor.PlayerInfo.GiveWin() end
---@param instanceId string
function ScriptExecutor.PlayerInfo.CopyCard(instanceId) end
---@param instanceId string
function ScriptExecutor.PlayerInfo.CopyBless(instanceId) end
---@param instanceId string
function ScriptExecutor.PlayerInfo.CopyRelic(instanceId) end
---@param id string
function ScriptExecutor.PlayerInfo.AddCard(id) end
---@param id string
function ScriptExecutor.PlayerInfo.RemoveCard(id) end
---@param id string
function ScriptExecutor.PlayerInfo.AddRelic(id) end
---@param id string
function ScriptExecutor.PlayerInfo.RemoveRelic(id) end
---@param id string
function ScriptExecutor.PlayerInfo.AddBless(id) end
---@param id string
function ScriptExecutor.PlayerInfo.RemoveBless(id) end
---@param id string
---@param delayFrames number
function ScriptExecutor.PlayerInfo.DelayAddCard(id, delayFrames) end
---@param id string
---@param delayFrames number
function ScriptExecutor.PlayerInfo.DelayAddRelic(id, delayFrames) end
---@param id string
---@param delayFrames number
function ScriptExecutor.PlayerInfo.DelayAddBless(id, delayFrames) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomAddBless(count) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomAddRelic(count) end
---@param count string
function ScriptExecutor.PlayerInfo.Goodbless(count) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomAddCard(count) end
---@param rarity string
function ScriptExecutor.PlayerInfo.RandomrelicByRarity(rarity) end
---@param rarity string
function ScriptExecutor.PlayerInfo.RandomcardByRarity(rarity) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomAddCardByDeck(count) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomRemoveCard(count) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomRemoveBless(count) end
---@param count string
function ScriptExecutor.PlayerInfo.RandomRemoveRelic(count) end
---@param type string
---@param id2 string
function ScriptExecutor.PlayerInfo.StartLevel(type, id2) end
function ScriptExecutor.PlayerInfo.ShowReward() end
---@param key string
---@param value string
function ScriptExecutor.PlayerInfo.SetGameVar(key, value) end
---@param key string
---@return string
function ScriptExecutor.PlayerInfo.GetGameVar(key) end
---@param id string
function ScriptExecutor.PlayerInfo.ContinueEvent(id) end
function ScriptExecutor.PlayerInfo.GameOver() end
---@param id string
function ScriptExecutor.PlayerInfo.ShowDialogue(id) end
---@param name string
---@param action System.Action | function
---@param obj System.Object
function ScriptExecutor.PlayerInfo.AddEvent(name, action, obj) end
function ScriptExecutor.PlayerInfo.EndDialogue() end
---@param flag boolean
function ScriptExecutor.PlayerInfo.HideDialogue(flag) end
---@param data DataConfig
function ScriptExecutor.PlayerInfo.AddCardByData(data) end
---@param options System.ValueTuple
function ScriptExecutor.PlayerInfo.ShowOptions(options) end
---@param name string
function ScriptExecutor.PlayerInfo.EventTrigger(name) end
---@param lists System.String[]
---@return string
function ScriptExecutor.PlayerInfo.RandomSelect(lists) end
function ScriptExecutor.PlayerInfo.EventTryChangeMap() end
function ScriptExecutor.PlayerInfo.AnnounceEventDone() end
---@return GameRuntimeData
function ScriptExecutor.PlayerInfo.Getsave() end
---@param itemId string
---@param type string
function ScriptExecutor.PlayerInfo.AddItem(itemId, type) end
function ScriptExecutor.PlayerInfo.EndEvent() end
---@param index string
function ScriptExecutor.PlayerInfo.LockChoice(index) end
---@return System.Collections.Generic.IDictionary
function ScriptExecutor.PlayerInfo.GetCareer() end
---@param id string
---@param progress number
function ScriptExecutor.PlayerInfo.UpdateAch(id, progress) end
---@param value string
function ScriptExecutor.PlayerInfo.ChangeSelected(value) end
---@param value string
function ScriptExecutor.PlayerInfo.ChangeAllVars(value) end
---@param id string
function ScriptExecutor.PlayerInfo.UnlockItem(id) end
---@param text string
function ScriptExecutor.PlayerInfo.ShowCaption(text) end
function ScriptExecutor.PlayerInfo.QuitAndDeleteSave() end
---@param iconPath string
---@param title string
---@param description string
---@param tips string
function ScriptExecutor.PlayerInfo.ShowItemShowUI(iconPath, title, description, tips) end

---@class TempDataManager : Singleton
---@field seeds System.Single[]
---@field SettingTransformMap System.Collections.Generic.Dictionary
---@field rareColorMap1 System.Collections.Generic.Dictionary
---@field GameOver boolean
---@field RoleStatusMap System.Collections.Generic.Dictionary
---@field RarityMap System.Collections.Generic.Dictionary
---@field keyWordsDic System.Collections.Generic.Dictionary
---@field keyWordIds System.Collections.Generic.Dictionary
---@field rareColorMap System.Collections.Generic.Dictionary
---@field UIWorldPosMap System.Collections.Generic.Dictionary
---@field Instance TempDataManager -- infered from Singleton`1[TempDataManager]
---@field GetInstance TempDataManager -- infered from Singleton`1[TempDataManager]
TempDataManager = {}
---@alias CS.TempDataManager TempDataManager
CS.TempDataManager = TempDataManager

---@return TempDataManager
function TempDataManager.New() end
---@param seed number
---@return boolean
function TempDataManager.EnsureRandomReady(seed) end
---@param seed number
function TempDataManager:Random(seed) end

---@class VisualScriptExecutor : System.Object
---@field luaEnv XLua.LuaEnv
---@field luaTable XLua.LuaTable
---@field status IStatusManager
---@field dataConfig IDataConfig
---@field Vars System.Collections.Generic.IDictionary
---@field Self IStatusManager
---@field Object System.Collections.Generic.List
---@field Target IStatusManager
---@field ScriptDict System.Collections.Generic.Dictionary
VisualScriptExecutor = {}
---@alias CS.VisualScriptExecutor VisualScriptExecutor
CS.VisualScriptExecutor = VisualScriptExecutor

---@param dataConfig IDataConfig
---@return VisualScriptExecutor
function VisualScriptExecutor.New(dataConfig) end
---@param id string
function VisualScriptExecutor.ShowDialogue(id) end
function VisualScriptExecutor.EndDialogue() end
---@param flag boolean
function VisualScriptExecutor.HideDialogue(flag) end
---@param index number
---@param x number
---@param time number
---@param delay number
function VisualScriptExecutor.DoMoveX(index, x, time, delay) end
---@param index number
---@param y number
---@param time number
---@param delay number
function VisualScriptExecutor.DoMoveY(index, y, time, delay) end
---@param index number
---@param scale number
---@param time number
---@param delay number
function VisualScriptExecutor.DoScale(index, scale, time, delay) end
---@param index number
---@param time number
function VisualScriptExecutor.DoFadeIn(index, time) end
---@param index number
---@param time number
function VisualScriptExecutor.DoFadeOut(index, time) end
---@param ScriptsName string
function VisualScriptExecutor:RunScript(ScriptsName) end
---@param ScriptName string
---@param options Microsoft.CodeAnalysis.Scripting.ScriptOptions
function VisualScriptExecutor:PreCompileScripts(ScriptName, options) end
---@overload fun(self: VisualScriptExecutor, filter: string) : System.Collections.Generic.List
---@overload fun(self: VisualScriptExecutor, statuses: System.Collections.Generic.IEnumerable) : System.Collections.Generic.List
---@param statuses ZLinq.ValueEnumerable
---@return System.Collections.Generic.List
function VisualScriptExecutor:SetStatus(statuses) end
---@param eventName string
---@param parameters System.String[]
---@return boolean
function VisualScriptExecutor:TrySendOnlineEvent(eventName, parameters) end
---@param eventName string
---@param action System.Action | function
function VisualScriptExecutor:AddEvent(eventName, action) end
function VisualScriptExecutor:Clear() end

---@class EffectData : System.Object
---@field InitScript string
---@field Timepoint string
---@field Cost number
---@field Name string
---@field Description string
EffectData = {}
---@alias CS.EffectData EffectData
CS.EffectData = EffectData

---@return EffectData
function EffectData.New() end
---@param dataconfig DataConfig
function EffectData:Init(dataconfig) end

---@class RaycastDeepProbe : UnityEngine.MonoBehaviour
RaycastDeepProbe = {}
---@alias CS.RaycastDeepProbe RaycastDeepProbe
CS.RaycastDeepProbe = RaycastDeepProbe


---@class WarningFilter : UnityEngine.MonoBehaviour
WarningFilter = {}
---@alias CS.WarningFilter WarningFilter
CS.WarningFilter = WarningFilter


---@class WarningFilter.BlockingLogHandler : System.Object
---@field _originalHandler UnityEngine.ILogHandler
WarningFilter.BlockingLogHandler = {}
---@alias CS.WarningFilter.BlockingLogHandler WarningFilter.BlockingLogHandler
CS.WarningFilter.BlockingLogHandler = WarningFilter.BlockingLogHandler

---@param originalHandler UnityEngine.ILogHandler
---@return WarningFilter.BlockingLogHandler
function WarningFilter.BlockingLogHandler.New(originalHandler) end
---@param logType UnityEngine.LogType
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function WarningFilter.BlockingLogHandler:LogFormat(logType, context, format, args) end
---@param exception System.Exception
---@param context UnityEngine.Object
function WarningFilter.BlockingLogHandler:LogException(exception, context) end

---@class PropertyWatcher : Singleton
---@field Instance PropertyWatcher -- infered from Singleton`1[PropertyWatcher]
---@field GetInstance PropertyWatcher -- infered from Singleton`1[PropertyWatcher]
PropertyWatcher = {}
---@alias CS.PropertyWatcher PropertyWatcher
CS.PropertyWatcher = PropertyWatcher

---@return PropertyWatcher
function PropertyWatcher.New() end
---@overload fun(self: PropertyWatcher, classBody: System.ComponentModel.INotifyPropertyChanged, propertyName: string, action: System.Action | function) : System.ComponentModel.PropertyChangedEventHandler
---@overload fun(self: PropertyWatcher, classBody: System.ComponentModel.INotifyPropertyChanged, propertyName: string, action: System.Action | function) : System.ComponentModel.PropertyChangedEventHandler
---@param classBody System.ComponentModel.INotifyPropertyChanged
---@param propertyName string
---@param action System.Action | function
---@return System.ComponentModel.PropertyChangedEventHandler
function PropertyWatcher:AddListener(classBody, propertyName, action) end
---@param classBody System.ComponentModel.INotifyPropertyChanged
---@param handler System.ComponentModel.PropertyChangedEventHandler
function PropertyWatcher:RemoveListener(classBody, handler) end

---@class CustomDamageType : UnityEngine.ScriptableObject
---@field popUpType string
---@field ignoreDefend boolean
---@field CanUseTough boolean
CustomDamageType = {}
---@alias CS.CustomDamageType CustomDamageType
CS.CustomDamageType = CustomDamageType

---@return CustomDamageType
function CustomDamageType.New() end
---@param status StatusManager
---@param damage number
---@param vector UnityEngine.Vector3
---@param from StatusManager
---@param originalVal number
---@param damageType string
---@param fromDataId string
---@return number
function CustomDamageType:ApplyDamage(status, damage, vector, from, originalVal, damageType, fromDataId) end
---@param status StatusManager
---@param damage number
---@param vector UnityEngine.Vector3
---@param from StatusManager
---@param originalVal number
function CustomDamageType:ShowDamage(status, damage, vector, from, originalVal) end
---@param status StatusManager
---@param heal number
function CustomDamageType:ApplyHeal(status, heal) end

---@class Bullet : UnityEngine.MonoBehaviour
---@field cast UnityEngine.GameObject
---@field hit UnityEngine.GameObject
Bullet = {}
---@alias CS.Bullet Bullet
CS.Bullet = Bullet


---@class BulletEffectInfo : EffectBase
---@field initAngle UnityEngine.Vector3
---@field speed number
BulletEffectInfo = {}
---@alias CS.BulletEffectInfo BulletEffectInfo
CS.BulletEffectInfo = BulletEffectInfo

---@return BulletEffectInfo
function BulletEffectInfo.New() end
---@param status IStatusManager
---@param isReverse boolean
function BulletEffectInfo:Play(status, isReverse) end

---@class CardEffectInfo : EffectBase
---@field type CardEffectInfo.Type
---@field initAngle UnityEngine.Vector3
CardEffectInfo = {}
---@alias CS.CardEffectInfo CardEffectInfo
CS.CardEffectInfo = CardEffectInfo

---@return CardEffectInfo
function CardEffectInfo.New() end
---@param status IStatusManager
---@param isReverse boolean
function CardEffectInfo:Play(status, isReverse) end

---@class CardEffectInfo.Type
---@field Default CardEffectInfo.Type
---@field Area CardEffectInfo.Type
CardEffectInfo.Type = {}
---@alias CS.CardEffectInfo.Type CardEffectInfo.Type
CS.CardEffectInfo.Type = CardEffectInfo.Type


---@class EffectBase : UnityEngine.ScriptableObject
---@field effectPrefab UnityEngine.GameObject
---@field duration number
---@field target EffectBase.Target
---@field effect UnityEngine.GameObject
---@field positionType EffectBase.PositionType
EffectBase = {}
---@alias CS.EffectBase EffectBase
CS.EffectBase = EffectBase

---@param status IStatusManager
---@param isReverse boolean
function EffectBase:Play(status, isReverse) end

---@class EffectBase.Target
---@field None EffectBase.Target
---@field Self EffectBase.Target
---@field Target EffectBase.Target
EffectBase.Target = {}
---@alias CS.EffectBase.Target EffectBase.Target
CS.EffectBase.Target = EffectBase.Target


---@class EffectBase.PositionType
---@field Center EffectBase.PositionType
---@field Top EffectBase.PositionType
---@field Bottom EffectBase.PositionType
EffectBase.PositionType = {}
---@alias CS.EffectBase.PositionType EffectBase.PositionType
CS.EffectBase.PositionType = EffectBase.PositionType


---@class EffectInfo : EffectBase
EffectInfo = {}
---@alias CS.EffectInfo EffectInfo
CS.EffectInfo = EffectInfo

---@return EffectInfo
function EffectInfo.New() end

---@class EffectManager : Singleton
---@field Instance EffectManager -- infered from Singleton`1[EffectManager]
---@field GetInstance EffectManager -- infered from Singleton`1[EffectManager]
EffectManager = {}
---@alias CS.EffectManager EffectManager
CS.EffectManager = EffectManager

---@return EffectManager
function EffectManager.New() end
function EffectManager:Init() end
---@overload fun(self: EffectManager, scriptExecutor: IScriptExecutor, effectName: string)
---@param Self IStatusManager
---@param effectName string
function EffectManager:PlayEffect(Self, effectName) end
---@param Self IStatusManager
---@param Object System.Collections.Generic.List
---@param effectName string
function EffectManager:InternalPlayEffect(Self, Object, effectName) end
---@param scriptExecutor IScriptExecutor
---@param effectName string
---@param delay number
function EffectManager:PlayActionEffect(scriptExecutor, effectName, delay) end
---@param effectName string
function EffectManager:PlayScreenEffect(effectName) end

---@class EnemyEffectInfo : EffectBase
---@field type EnemyEffectInfo.Type
---@field initAngle UnityEngine.Vector3
EnemyEffectInfo = {}
---@alias CS.EnemyEffectInfo EnemyEffectInfo
CS.EnemyEffectInfo = EnemyEffectInfo

---@return EnemyEffectInfo
function EnemyEffectInfo.New() end
---@param status IStatusManager
---@param isReverse boolean
function EnemyEffectInfo:Play(status, isReverse) end

---@class EnemyEffectInfo.Type
---@field Default EnemyEffectInfo.Type
---@field Area EnemyEffectInfo.Type
EnemyEffectInfo.Type = {}
---@alias CS.EnemyEffectInfo.Type EnemyEffectInfo.Type
CS.EnemyEffectInfo.Type = EnemyEffectInfo.Type


---@class FightInit : FightUnit
FightInit = {}
---@alias CS.FightInit FightInit
CS.FightInit = FightInit

---@return FightInit
function FightInit.New() end
function FightInit:Init() end
function FightInit:ApplyBlessingRelic() end
function FightInit:RpcLoadRoles() end

---@class FightPlayer : FightObject
---@field diceIconList UnityEngine.Transform
---@field isEnd boolean
---@field Instance FightPlayer
---@field Type string
---@field Id string
---@field AnimationLocation string
---@field VocalLocation string
---@field Name string
---@field Status IStatusManager
---@field MaxPowerCount number
---@field CurPowerCount number
---@field diceIcon DiceIcon
FightPlayer = {}
---@alias CS.FightPlayer FightPlayer
CS.FightPlayer = FightPlayer

function FightPlayer:StartBoredTimer() end
function FightPlayer:ResetBoredTimer() end
function FightPlayer:StopBoredTimer() end
---@param instanceId string
function FightPlayer:Init(instanceId) end
---@return System.Collections.IEnumerator
function FightPlayer:DoAction() end
function FightPlayer:OnDestroy() end
---@param path string
function FightPlayer:PlayAudio(path) end
function FightPlayer:EndRound() end
function FightPlayer:DeadEffect() end
---@return boolean
function FightPlayer:Weaved() end

---@class FightUnit : System.Object
FightUnit = {}
---@alias CS.FightUnit FightUnit
CS.FightUnit = FightUnit

---@return FightUnit
function FightUnit.New() end
function FightUnit:Init() end
function FightUnit:OnUpdate() end

---@class Fight_EnemyTurn : FightUnit
Fight_EnemyTurn = {}
---@alias CS.Fight_EnemyTurn Fight_EnemyTurn
CS.Fight_EnemyTurn = Fight_EnemyTurn

---@return Fight_EnemyTurn
function Fight_EnemyTurn.New() end
function Fight_EnemyTurn:Init() end

---@class Fight_Escape : FightUnit
---@field RewardMul number
Fight_Escape = {}
---@alias CS.Fight_Escape Fight_Escape
CS.Fight_Escape = Fight_Escape

---@return Fight_Escape
function Fight_Escape.New() end
function Fight_Escape:Init() end

---@class Fight_Loss : FightUnit
Fight_Loss = {}
---@alias CS.Fight_Loss Fight_Loss
CS.Fight_Loss = Fight_Loss

---@return Fight_Loss
function Fight_Loss.New() end
function Fight_Loss:Init() end

---@class Fight_OtherTurn : FightUnit
Fight_OtherTurn = {}
---@alias CS.Fight_OtherTurn Fight_OtherTurn
CS.Fight_OtherTurn = Fight_OtherTurn

---@return Fight_OtherTurn
function Fight_OtherTurn.New() end
function Fight_OtherTurn:Init() end

---@class Fight_Partner : FightUnit
Fight_Partner = {}
---@alias CS.Fight_Partner Fight_Partner
CS.Fight_Partner = Fight_Partner

---@return Fight_Partner
function Fight_Partner.New() end
function Fight_Partner:Init() end

---@class Fight_PlayerTurn : FightUnit
---@field ShouldCard number
---@field NowActionId string
Fight_PlayerTurn = {}
---@alias CS.Fight_PlayerTurn Fight_PlayerTurn
CS.Fight_PlayerTurn = Fight_PlayerTurn

---@return Fight_PlayerTurn
function Fight_PlayerTurn.New() end
function Fight_PlayerTurn:Init() end
function Fight_PlayerTurn:OnUpdate() end

---@class Fight_Start : FightUnit
Fight_Start = {}
---@alias CS.Fight_Start Fight_Start
CS.Fight_Start = Fight_Start

---@return Fight_Start
function Fight_Start.New() end
function Fight_Start:Init() end

---@class Fight_Win : FightUnit
---@field RewardMul number
Fight_Win = {}
---@alias CS.Fight_Win Fight_Win
CS.Fight_Win = Fight_Win

---@return Fight_Win
function Fight_Win.New() end
function Fight_Win:Init() end

---@class OtherPlayer : FightObject
---@field isEnd boolean
---@field Type string
---@field Id string
---@field AnimationLocation string
---@field VocalLocation string
---@field Name string
OtherPlayer = {}
---@alias CS.OtherPlayer OtherPlayer
CS.OtherPlayer = OtherPlayer

---@param Index string
function OtherPlayer:Init(Index) end
---@return System.Collections.IEnumerator
function OtherPlayer:DoAction() end
function OtherPlayer:EndRound() end
---@return boolean
function OtherPlayer:Weaved() end

---@class Enemy : OtherObj
---@field Type string
Enemy = {}
---@alias CS.Enemy Enemy
CS.Enemy = Enemy

---@param dataConfig DataConfig
---@param SumOfEnemyPositive number
---@param index number
---@param ExHp number
function Enemy:Init(dataConfig, SumOfEnemyPositive, index, ExHp) end
function Enemy:AddCardList() end
---@return System.Collections.IEnumerator
function Enemy:DoAction() end
---@return boolean
function Enemy:Weaved() end

---@class EnemyManager : System.Object
---@field SettlementMultiplier number
---@field levelData System.Collections.Generic.Dictionary
---@field enemyCount number
---@field enemyList System.Collections.Generic.List
---@field LevelId string
---@field IndexCount number
---@field Instance EnemyManager
EnemyManager = {}
---@alias CS.EnemyManager EnemyManager
CS.EnemyManager = EnemyManager

---@return EnemyManager
function EnemyManager.New() end
---@param id string
function EnemyManager:LoadRes(id) end
---@return boolean
function EnemyManager:TrySpawnNextWheelEnemy() end
---@param id string
---@return string
function EnemyManager:AddEnemy(id) end
function EnemyManager:UpdatePos() end
function EnemyManager:ResPat() end

---@class ObjectAction : System.Object
ObjectAction = {}
---@alias CS.ObjectAction ObjectAction
CS.ObjectAction = ObjectAction

---@param father OtherObj
---@return ObjectAction
function ObjectAction.New(father) end
---@param enemyCard ObjectCard
function ObjectAction:AddCard(enemyCard) end
function ObjectAction:ActionExecute() end
---@param index number
function ObjectAction:DesActionCard(index) end
---@return ObjectCard
function ObjectAction:TryGetCard() end
---@param count number
---@return System.Collections.Generic.List
function ObjectAction:ActionShow(count) end
function ObjectAction:CardUpdate() end

---@class ObjectCard : System.Object
---@field nowCD number
---@field isIgnored boolean
---@field status StatusManager
---@field dataConfig DataConfig
---@field keyWords System.Collections.Generic.List
ObjectCard = {}
---@alias CS.ObjectCard ObjectCard
CS.ObjectCard = ObjectCard

---@return ObjectCard
function ObjectCard.New() end
---@param dataConfig DataConfig
function ObjectCard:Init(dataConfig) end
function ObjectCard:DataUpdate() end
---@param target StatusManager
function ObjectCard:UseCard(target) end
function ObjectCard:SetStatus() end
---@return number
function ObjectCard:GetPriority() end
function ObjectCard:UpdateMsg() end

---@class OtherObj : FightObject
---@field dataConfig DataConfig
---@field FightAction ObjectAction
---@field ActionCards System.Collections.Generic.List
---@field data System.Collections.Generic.IDictionary
---@field Type string
---@field Attack number
---@field Defend number
---@field ActionCount number
---@field MaxActionCount number
---@field Id string
---@field Name string
---@field AnimationLocation string
---@field VocalLocation string
OtherObj = {}
---@alias CS.OtherObj OtherObj
CS.OtherObj = OtherObj

---@param fromdata DataConfig
---@param SumOfEnemyPositive number
---@param index number
function OtherObj:Init(fromdata, SumOfEnemyPositive, index) end
---@param outData DataConfig
function OtherObj:AddAction(outData) end
---@return System.Collections.IEnumerator
function OtherObj:DoAction() end
function OtherObj:EndRound() end
---@overload fun(self: OtherObj, isShow: boolean)
function OtherObj:ShowAction() end
---@param index number
function OtherObj:AnnounceDesAction(index) end
---@param index number
function OtherObj:DesActionCard(index) end
function OtherObj:ResetActionObj() end
function OtherObj:SetAction() end
function OtherObj:UpdataActionShow() end
---@param tempPar UnityEngine.Transform
---@param text string
function OtherObj:UpdateText(tempPar, text) end
---@param i number
---@param isSingle boolean
---@return boolean
function OtherObj:DoOneAction(i, isSingle) end
function OtherObj:HideAction() end
---@return boolean
function OtherObj:ActionJudge() end
function OtherObj:AddCardList() end
function OtherObj:DeadEffect() end
---@return boolean
function OtherObj:Weaved() end

---@class Partner : OtherObj
---@field Type string
Partner = {}
---@alias CS.Partner Partner
CS.Partner = Partner

---@param fromdata DataConfig
---@param SumOfEnemyPositive number
---@param index number
function Partner:Init(fromdata, SumOfEnemyPositive, index) end
---@return System.Collections.IEnumerator
function Partner:DoAction() end
function Partner:AddCardList() end
---@return boolean
function Partner:Weaved() end

---@class PatternManager : System.Object
---@field PatternList System.Collections.Generic.List
---@field Instance PatternManager
PatternManager = {}
---@alias CS.PatternManager PatternManager
CS.PatternManager = PatternManager

---@return PatternManager
function PatternManager.New() end
function PatternManager:InitPattern() end
function PatternManager:ResPat() end

---@class SkillItem : UnityEngine.MonoBehaviour
---@field dataConfig IDataConfig
---@field data System.Collections.Generic.IDictionary
---@field Vars System.Collections.Generic.IDictionary
---@field status IStatusManager
---@field lasttime number
---@field scriptExecutor IScriptExecutor
SkillItem = {}
---@alias CS.SkillItem SkillItem
CS.SkillItem = SkillItem

---@param ScriptName string
function SkillItem:RunScript(ScriptName) end
---@param dataConfig IDataConfig
function SkillItem:Init(dataConfig) end
function SkillItem:Awake() end
function SkillItem:DataUpdate() end
function SkillItem:UpdateSkillTime() end
function SkillItem:RegisterEvent() end
function SkillItem:OnDisable() end
---@return boolean
function SkillItem:TryUse() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SkillItem:OnPointerDown(eventData) end
function SkillItem:TrueUse() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SkillItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SkillItem:OnPointerExit(eventData) end

---@class StatusManager : UnityEngine.MonoBehaviour
---@field _animatedState IStatusManager.AnimatedState
---@field Summon System.Collections.Generic.List
---@field _NetEnqueue boolean
---@field selfUI UnityEngine.GameObject
---@field statusBarObj UnityEngine.GameObject
---@field actionText Witch.UI.KeywordDisplay[]
---@field statusBarUI Witch.UI.Window.StatusBarUI
---@field actionContent UnityEngine.GameObject
---@field effectListObj UnityEngine.GameObject
---@field initPos UnityEngine.Vector3
---@field MiDataConfig DataConfig
---@field maxHp number
---@field curHp number
---@field defend number
---@field isResurrecting boolean
---@field animatedState IStatusManager.AnimatedState
---@field state IStatusManager.State
---@field Name string
---@field fatherObject FightObject
---@field actionObj UnityEngine.GameObject[]
---@field DamageFilter System.Collections.Generic.Dictionary
---@field effectList System.Collections.Generic.List
---@field InstanceId string
---@field MirrorSc IScriptExecutor
---@field MaxHp number
---@field CurHp number
---@field Defend number
---@field dynamicVariables System.Collections.Generic.Dictionary
---@field dynamicVariablesLog System.Collections.Generic.Dictionary
---@field HasFirstDeadReviveMark boolean
StatusManager = {}
---@alias CS.StatusManager StatusManager
CS.StatusManager = StatusManager

---@param key string
---@param value number
---@param enqueue boolean
function StatusManager:SetDynamicVariable(key, value, enqueue) end
---@return IStatusManager.AnimatedState
function StatusManager:ConsumeHitReactionAnimationState() end
---@param key string
---@param delta number
---@param enqueue boolean
function StatusManager:AddDynamicVariable(key, delta, enqueue) end
---@param key string
---@param value number
---@param enqueue boolean
function StatusManager:SetDamageFilter(key, value, enqueue) end
---@param key string
---@param delta number
---@param enqueue boolean
function StatusManager:AddDamageFilter(key, delta, enqueue) end
---@param key string
---@param enqueue boolean
function StatusManager:RemoveDamageFilter(key, enqueue) end
---@param enqueue boolean
function StatusManager:ClearDamageFilter(enqueue) end
---@return boolean
function StatusManager:TryMarkFirstDeadRevive() end
---@return boolean
function StatusManager:TryConsumeFirstDeadReviveMark() end
function StatusManager:ResetFirstDeadReviveMark() end
---@param Isshow boolean
function StatusManager:ShowSummon(Isshow) end
---@param sprite UnityEngine.Sprite
function StatusManager:SetSprite(sprite) end
function StatusManager:CancelGraveVisualPlayback() end
function StatusManager:EnterGraveVisual() end
---@param onComplete System.Action | function
function StatusManager:PlayReviveFromGraveVisual(onComplete) end
---@param path string
---@param name string
function StatusManager:AddSummon(path, name) end
---@param name string
---@return Witch.Core.SummonObject
function StatusManager:FindSummon(name) end
---@param name string
function StatusManager:RemoveSummon(name) end
function StatusManager:OnSelect() end
function StatusManager:OnUnSelect() end
---@param replaceImmediate boolean
function StatusManager:ResetAnimator(replaceImmediate) end
---@param replaceImmediate boolean
---@return UnityEngine.Sprite
function StatusManager:InitAnimator(replaceImmediate) end
---@param fromId string
function StatusManager:ClearBuffById(fromId) end
function StatusManager:InitVocal() end
function StatusManager:ResetVocal() end
---@param father FightObject
---@return IStatusManager
function StatusManager:Init(father) end
---@param pos UnityEngine.Vector3
function StatusManager:SetPosition(pos) end
function StatusManager:UpdateDisplay() end
function StatusManager:UpdateObjPos() end
---@param NeedEffect boolean
function StatusManager:UpdateStatus(NeedEffect) end
function StatusManager:ResetDamageStatus() end
---@param val number
---@param damageType string
---@param fromDataId string
---@param fromInstanceId string
function StatusManager:Hit(val, damageType, fromDataId, fromInstanceId) end
---@param val number
---@param damageType string
function StatusManager:Heal(val, damageType) end
---@param state IStatusManager.VocalState
function StatusManager:PlayVocal(state) end
---@param Delay number
function StatusManager:EnemyDead(Delay) end
function StatusManager:UpdateEffectList() end
---@param spellChain string
function StatusManager:UpdateAllDharmasSpellList(spellChain) end
function StatusManager:ClearAllDharmasSpellList() end
---@param state IStatusManager.State
function StatusManager:ChangeState(state) end
---@param BaseDamage number
---@return number
function StatusManager:DamageCalculate(BaseDamage) end
---@param BaseDefence number
---@return number
function StatusManager:DefenceCalculate(BaseDefence) end
---@param BaseDamage number
---@return number
function StatusManager:UnDamageCalucate(BaseDamage) end
---@param value number
function StatusManager:Resurrection(value) end
function StatusManager:CheckDead() end
---@param way string
---@return IStatusManager
function StatusManager:CheckAllBuff(way) end
---@return IStatusManager
function StatusManager:UpdateBuff() end
---@return IStatusManager
function StatusManager:ClearAllBuff() end
---@param buffId string
---@return IStatusManager
function StatusManager:RemoveBuff(buffId) end
---@overload fun(self: StatusManager, buffId: string, level: number) : IStatusManager
---@param buffConfig IBuffItemConfig
---@return IStatusManager
function StatusManager:AddBuff(buffConfig) end
---@param buffId string
---@return IBuffItem
function StatusManager:GetBuff(buffId) end
---@return IBuffItem[]
function StatusManager:GetBuffs() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function StatusManager:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function StatusManager:OnPointerExit(eventData) end

---@class StatusDataTransfer : System.Object
---@field maxHp number
---@field curHp number
---@field defend number
---@field InstanceId string
StatusDataTransfer = {}
---@alias CS.StatusDataTransfer StatusDataTransfer
CS.StatusDataTransfer = StatusDataTransfer

---@overload fun(status: StatusManager) : StatusDataTransfer
---@overload fun(status: StatusDataTransfer) : StatusDataTransfer
---@return StatusDataTransfer
function StatusDataTransfer.New() end
---@param propertyName string
---@param value System.Object
---@return StatusDataTransfer
function StatusDataTransfer:WithPropertys(propertyName, value) end
---@param status StatusManager
function StatusDataTransfer:Populate(status) end

---@class StatusManagerConverter : Newtonsoft.Json.JsonConverter
StatusManagerConverter = {}
---@alias CS.StatusManagerConverter StatusManagerConverter
CS.StatusManagerConverter = StatusManagerConverter

---@return StatusManagerConverter
function StatusManagerConverter.New() end
---@param writer Newtonsoft.Json.JsonWriter
---@param value StatusManager
---@param serializer Newtonsoft.Json.JsonSerializer
function StatusManagerConverter:WriteJson(writer, value, serializer) end
---@param reader Newtonsoft.Json.JsonReader
---@param objectType System.Type
---@param existingValue StatusManager
---@param hasExistingValue boolean
---@param serializer Newtonsoft.Json.JsonSerializer
---@return StatusManager
function StatusManagerConverter:ReadJson(reader, objectType, existingValue, hasExistingValue, serializer) end

---@class GameApp : UnityEngine.MonoBehaviour
---@field Instance GameApp
---@field STEAMBUILD boolean
---@field OFFLINE boolean
---@field debugText TMPro.TMP_Text
---@field NowBackground UnityEngine.GameObject
---@field WarmupFontAssets System.Collections.Generic.List
---@field MainFontAsset TMPro.TMP_FontAsset
---@field HouseItem UnityEngine.GameObject
---@field breakObj UnityEngine.GameObject
GameApp = {}
---@alias CS.GameApp GameApp
CS.GameApp = GameApp

function GameApp:ChangeTransportToSteam() end
function GameApp:ChangeTransportToKCP() end
function GameApp:StartMenu() end
function GameApp:StartHouse() end
---@param ray boolean
function GameApp:SetHouseRay(ray) end
function GameApp:CloseHouse() end
function GameApp:StartBreaks() end
function GameApp:StartGame() end
---@param roleTable RoleTable
function GameApp:ContinueGame(roleTable) end
---@param belong Witch.UI.SceneType
function GameApp:UpdateBack(belong) end
function GameApp:GameOver() end
---@param level string
---@return Cysharp.Threading.Tasks.UniTask
function GameApp:StartFight(level) end
---@param level string
---@return Cysharp.Threading.Tasks.UniTask
function GameApp:StartFakeFight(level) end
---@param context UnityEngine.InputSystem.InputAction.CallbackContext
function GameApp:OpenBackpack(context) end
function GameApp:ReturnToMenu() end
---@param state string
function GameApp:SetSteamRichState(state) end
function GameApp:PreventCut() end

---@class AudioManager : UnityEngine.MonoBehaviour
---@field Instance AudioManager
---@field EffectVolume number
---@field NarrationVolume number
---@field bgmVolume number
---@field NowBGMName string
---@field masterVolume number
---@field bgmSource UnityEngine.AudioSource
AudioManager = {}
---@alias CS.AudioManager AudioManager
CS.AudioManager = AudioManager

---@param volume number
function AudioManager:ChangeMasterVolume(volume) end
---@param volume number
function AudioManager:ChangeBgmVolume(volume) end
---@param volume number
function AudioManager:ChangeEffectVolume(volume) end
---@param volume number
function AudioManager:ChangeNarration(volume) end
---@overload fun(self: AudioManager, name: string, next: boolean)
---@overload fun(self: AudioManager, bgmList: BGMList, next: boolean)
---@param bgmList System.Collections.Generic.List
---@param bgmListName string
---@param next boolean
---@param keepPlayingInBackground boolean
function AudioManager:PlayBGMList(bgmList, bgmListName, next, keepPlayingInBackground) end
---@overload fun(self: AudioManager, name: string)
---@param clip UnityEngine.AudioClip
function AudioManager:PlayEffect(clip) end
---@overload fun(self: AudioManager, roleId: string, clip: UnityEngine.AudioClip)
---@param roleId string
---@param clipPath string
function AudioManager:PlayVocal(roleId, clipPath) end
