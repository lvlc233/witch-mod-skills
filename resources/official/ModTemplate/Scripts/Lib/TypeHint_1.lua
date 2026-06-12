---@meta

---@class DialogueManager : Singleton
---@field Identity System.Collections.Generic.Dictionary
---@field IsPreviewMode boolean
---@field IsChat boolean
---@field Instance DialogueManager -- infered from Singleton`1[DialogueManager]
---@field GetInstance DialogueManager -- infered from Singleton`1[DialogueManager]
DialogueManager = {}
---@alias CS.DialogueManager DialogueManager
CS.DialogueManager = DialogueManager

---@return DialogueManager
function DialogueManager.New() end
function DialogueManager:Init() end
function DialogueManager:InitPreview() end
---@param id string
function DialogueManager:ShowDialogue(id) end
---@param flag boolean
function DialogueManager:HideDialogue(flag) end
---@return boolean
function DialogueManager:ShowDialogueBoxIfHidden() end
---@param instanceId string
---@param emoji GifAsset
function DialogueManager:ShowEmoji(instanceId, emoji) end
function DialogueManager:NextDialogue() end
---@param options System.ValueTuple
function DialogueManager:ShowOptions(options) end
function DialogueManager:EndDialogue() end

---@class FightCardManager : System.Object
---@field cardList System.Collections.ObjectModel.ObservableCollection
---@field tempList System.Collections.Generic.List
---@field usedCardList System.Collections.ObjectModel.ObservableCollection
---@field FightcardList System.Collections.Generic.List
---@field nascentList System.Collections.Generic.List
---@field CardTags System.Collections.Generic.Dictionary
---@field Instance FightCardManager
FightCardManager = {}
---@alias CS.FightCardManager FightCardManager
CS.FightCardManager = FightCardManager

---@return FightCardManager
function FightCardManager.New() end
function FightCardManager:Init() end
---@param dataConfig DataConfig
function FightCardManager:CardTagCheck(dataConfig) end
---@param dataConfig IDataConfig
function FightCardManager:RefreshTag(dataConfig) end
---@param NeedUsed boolean
function FightCardManager:RandomIndex(NeedUsed) end
---@return boolean
function FightCardManager:HasCard() end
---@return DataConfig
function FightCardManager:DrawCard() end

---@class FightManager : Mirror.NetworkBehaviour
---@field Instance FightManager
---@field IsFake boolean
---@field fightType FightType
---@field level string
---@field ValueDice ScriptExecutor.DiceWrapper
---@field CheckDice ScriptExecutor.DiceWrapper
---@field DefaultDice ScriptExecutor.DiceWrapper
---@field roleQueue System.Collections.Generic.List
---@field ActionQueue System.Collections.Generic.List
---@field statuses System.Collections.Generic.Dictionary
---@field statusData System.Collections.Generic.Dictionary
---@field TempVarsMap System.Collections.Generic.Dictionary
---@field eventList System.Collections.Generic.Queue
---@field targetList System.Collections.Generic.Queue
---@field enemyManager EnemyManager
---@field patternManager PatternManager
---@field SumOfEnemyPositive number
---@field EnemyHp number
---@field NowActionRole string
---@field waitCount number
---@field wantLevel string
---@field ReSetCount number
---@field TempRoleList System.Collections.Generic.Dictionary
---@field IsRet boolean
---@field selfIndex string
---@field NetworkNowActionRole string
FightManager = {}
---@alias CS.FightManager FightManager
CS.FightManager = FightManager

function FightManager:ResetFirstDeadPlayer() end
---@param instanceId string
---@return boolean
function FightManager:TryMarkFirstDeadPlayer(instanceId) end
---@param instanceId string
---@return boolean
function FightManager:IsFirstDeadPlayer(instanceId) end
---@param target StatusManager
---@param from StatusManager
---@return boolean
function FightManager:CanTriggerFirstDeadRevive(target, from) end
function FightManager:ResetWaitCount() end
---@param level string
function FightManager:ReadyToInit(level) end
function FightManager:RpcFightCheck() end
function FightManager:ReadyToStart() end
---@param level string
function FightManager:ReSetFight(level) end
function FightManager:ClearFightui() end
---@param action string
---@param Id string
---@param sourceInstanceId string
---@param fromId string
---@param theData System.Byte[]
---@param Vars System.String[]
function FightManager:CmdSendEvent(action, Id, sourceInstanceId, fromId, theData, Vars) end
---@param level string
---@param roleQueueStream System.Byte[]
---@param fromtempRoleListStream System.Byte[]
---@param positive number
---@param enemyHp number
function FightManager:Init(level, roleQueueStream, fromtempRoleListStream, positive, enemyHp) end
---@param enemyId string
function FightManager:CmdAddEnemy(enemyId) end
---@param enemyId string
function FightManager:RpcAddEnemy(enemyId) end
---@param statusData StatusDataTransfer
function FightManager:SyncStatus(statusData) end
---@param type FightType
function FightManager:CmdChangeType(type) end
---@param instanceId string
function FightManager:CmdPlayChange(instanceId) end
---@param instanceId string
---@param isDead boolean
function FightManager:CmdAnnounceDone(instanceId, isDead) end
function FightManager:EndPlayerturn() end
function FightManager:TurnEnd() end
---@param conn Mirror.NetworkConnection
---@param newType FightType
---@param nowAction string
function FightManager:TargetChangeUnit(conn, newType, nowAction) end
---@param newType FightType
function FightManager:ChangeUnit(newType) end
---@overload fun(self: FightManager, statusCommand: IStatusCommand)
---@param statusCommand IStatusCommand
---@param conn Mirror.NetworkConnection
function FightManager:EnqueueEvent(statusCommand, conn) end
---@param target Mirror.NetworkConnection
---@param objCommand Fight.ObjTarget.ObjTargetBase
function FightManager:TargetEnqueueEvent(target, objCommand) end
---@param statusCommand Fight.StatusCommand.ClientCommandBase
function FightManager:CmdEnqueueEvent(statusCommand) end
---@param conn Mirror.NetworkConnectionToClient
function FightManager:CmdCheckDead(conn) end
---@return System.Collections.IEnumerator
function FightManager:DOAllAction() end
---@param CareerId string
---@param playerIdentity string
function FightManager:CmdChangeCareer(CareerId, playerIdentity) end
---@param Isshow boolean
---@param playerIdentity string
function FightManager:CmdChangeSummon(Isshow, playerIdentity) end
---@param Isshow boolean
---@param playerIdentity string
function FightManager:RpcChangeSummon(Isshow, playerIdentity) end
---@param CareerId string
---@param playerIdentity string
function FightManager:RpcChangeCareer(CareerId, playerIdentity) end
---@param instanceId string
---@param index string
function FightManager:CmdActionChange(instanceId, index) end
---@param instanceId string
---@param index string
function FightManager:RpcActionChange(instanceId, index) end
---@param fightObject FightObject
---@return System.Collections.IEnumerator
function FightManager:DoAction(fightObject) end
---@return boolean
function FightManager:Weaved() end
---@param writer Mirror.NetworkWriter
---@param forceAll boolean
function FightManager:SerializeSyncVars(writer, forceAll) end
---@param reader Mirror.NetworkReader
---@param initialState boolean
function FightManager:DeserializeSyncVars(reader, initialState) end

---@class FightManager.RoleData : System.Object
---@field InstanceId string
---@field MaxHp number
---@field CurHp number
---@field Defend number
---@field State IStatusManager.State
---@field career DataConfig
FightManager.RoleData = {}
---@alias CS.FightManager.RoleData FightManager.RoleData
CS.FightManager.RoleData = FightManager.RoleData

---@overload fun() : FightManager.RoleData
---@param instanceId string
---@return FightManager.RoleData
function FightManager.RoleData.New(instanceId) end

---@class MapManager : Mirror.NetworkBehaviour
---@field ModeMapManager Witch.IModeManager
---@field CurrentMode string
---@field mapList System.String[]
---@field mapData System.String[]
---@field SumOfEnemyPositive number
---@field ExHp number
---@field eventWait number
---@field eventDone number
---@field Instance MapManager
---@field MapTree MapTree
---@field Level number
---@field NowDice Dice
---@field NetworkSumOfEnemyPositive number
---@field NetworkExHp number
MapManager = {}
---@alias CS.MapManager MapManager
CS.MapManager = MapManager

function MapManager:Awake() end
function MapManager:RpcTryChange() end
---@param mapManager string
function MapManager:SetMap(mapManager) end
function MapManager:TryChange() end
---@param conn Mirror.NetworkConnectionToClient
function MapManager:ReadyToChangeMap(conn) end
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdReadyToNextMap(conn) end
---@param name string
function MapManager:RpcAnnounceNextMap(name) end
function MapManager:CmdNextMap() end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function MapManager:MapUIStart(mapSelectUI) end
function MapManager:RpcNextMap() end
function MapManager:ResetEvent() end
function MapManager:CmdAnnounceEventWait() end
function MapManager:CmdEventWait() end
---@param type string
---@param id string
function MapManager:RpcLoadMap(type, id) end
function MapManager:CloseMapUI() end
---@param diceJSON string
function MapManager:RpcSyncDice(diceJSON) end
---@param level number
function MapManager:SetLevel(level) end
---@param seed number
function MapManager:RpcSyncRandom(seed) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function MapManager:MapItemInit(mapSelectUI) end
---@param maps System.String[]
---@param mapdata System.String[]
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdSelectMap(maps, mapdata, conn) end
---@param maps System.String[]
---@param mapdata System.String[]
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdSelectMapIncludeSender(maps, mapdata, conn) end
---@param conn Mirror.NetworkConnection
---@param maps System.String[]
---@param mapdata System.String[]
function MapManager:TargetUpdateMap(conn, maps, mapdata) end
---@param maps System.String[]
---@param mapdata System.String[]
function MapManager:RpcUpdateMap(maps, mapdata) end
---@param strokeId string
---@param authorId string
---@param startPoint UnityEngine.Vector2
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdMapDrawBegin(strokeId, authorId, startPoint, conn) end
---@param strokeId string
---@param authorId string
---@param startPoint UnityEngine.Vector2
function MapManager:RpcMapDrawBegin(strokeId, authorId, startPoint) end
---@param strokeId string
---@param authorId string
---@param point UnityEngine.Vector2
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdMapDrawPoint(strokeId, authorId, point, conn) end
---@param strokeId string
---@param authorId string
---@param point UnityEngine.Vector2
function MapManager:RpcMapDrawPoint(strokeId, authorId, point) end
---@param strokeId string
---@param authorId string
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdMapDrawEnd(strokeId, authorId, conn) end
---@param strokeId string
---@param authorId string
function MapManager:RpcMapDrawEnd(strokeId, authorId) end
---@param authorId string
---@param point UnityEngine.Vector2
---@param radius number
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdMapErase(authorId, point, radius, conn) end
---@param authorId string
---@param point UnityEngine.Vector2
---@param radius number
function MapManager:RpcMapErase(authorId, point, radius) end
---@param authorId string
---@param conn Mirror.NetworkConnectionToClient
function MapManager:CmdMapClearAll(authorId, conn) end
---@param authorId string
function MapManager:RpcMapClearAll(authorId) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function MapManager:SetReward(battleRewardsUI) end
---@param identity Mirror.NetworkIdentity
function MapManager:RemoveReady(identity) end
---@return boolean
function MapManager:WinTheGame() end
---@return boolean
function MapManager:Weaved() end
---@param writer Mirror.NetworkWriter
---@param forceAll boolean
function MapManager:SerializeSyncVars(writer, forceAll) end
---@param reader Mirror.NetworkReader
---@param initialState boolean
function MapManager:DeserializeSyncVars(reader, initialState) end

---@class NarrationManager : Singleton
---@field Instance NarrationManager -- infered from Singleton`1[NarrationManager]
---@field GetInstance NarrationManager -- infered from Singleton`1[NarrationManager]
NarrationManager = {}
---@alias CS.NarrationManager NarrationManager
CS.NarrationManager = NarrationManager

---@return NarrationManager
function NarrationManager.New() end
---@param ids System.Int32[]
function NarrationManager:Play(ids) end
---@param ids System.Int32[]
function NarrationManager:PlayWithChance(ids) end
function NarrationManager:PlayFightStartForCurrentEnemies() end
function NarrationManager:PlayFightWinForCurrentEnemies() end
---@param enemyId string
---@return boolean
function NarrationManager:CurrentFightHasEnemy(enemyId) end

---@class TutorialManager : Singleton
---@field Instance TutorialManager -- infered from Singleton`1[TutorialManager]
---@field GetInstance TutorialManager -- infered from Singleton`1[TutorialManager]
TutorialManager = {}
---@alias CS.TutorialManager TutorialManager
CS.TutorialManager = TutorialManager

---@return TutorialManager
function TutorialManager.New() end
function TutorialManager:Init() end

---@class VNPlayerManager : UnityEngine.MonoBehaviour
VNPlayerManager = {}
---@alias CS.VNPlayerManager VNPlayerManager
CS.VNPlayerManager = VNPlayerManager

---@param payload System.Object
function VNPlayerManager:StartPreview(payload) end

---@class MouseRayLogger : UnityEngine.MonoBehaviour
MouseRayLogger = {}
---@alias CS.MouseRayLogger MouseRayLogger
CS.MouseRayLogger = MouseRayLogger


---@class GameServer : Mirror.NetworkBehaviour
---@field EndCommit boolean
---@field LobbyInfo LobbyInfo
---@field RoleTables System.Collections.Generic.Dictionary
---@field isAcceptJoin boolean
---@field IsRoleTableSynced boolean
---@field EnemyDone boolean
---@field PatDone boolean
---@field Instance GameServer
GameServer = {}
---@alias CS.GameServer GameServer
CS.GameServer = GameServer

---@param roleTables System.Collections.Generic.Dictionary
function GameServer:StartRole(roleTables) end
function GameServer:StartGame() end
function GameServer:RoleRes() end
---@param tomap System.Collections.Generic.Dictionary
function GameServer:GetRoles(tomap) end
---@param roleTable RoleTable
function GameServer:ReceiveRoleTable(roleTable) end
---@param onAllReceived System.Action | function
function GameServer:CollectRoleTables(onAllReceived) end
function GameServer:SaveGame() end
function GameServer:EndGame() end
---@param playerId string
---@return boolean
function GameServer:CheckOnline(playerId) end
---@return boolean
function GameServer:Weaved() end

---@class PingSelection : Supabase.Postgrest.Models.BaseModel
---@field max_ping number
---@field average_ping number
---@field min_ping number
PingSelection = {}
---@alias CS.PingSelection PingSelection
CS.PingSelection = PingSelection

---@return PingSelection
function PingSelection.New() end

---@class LatencyRecorder : UnityEngine.MonoBehaviour
---@field Instance LatencyRecorder
---@field AvgMs number
---@field MaxMs number
---@field MinMs number
---@field SampleCount number
LatencyRecorder = {}
---@alias CS.LatencyRecorder LatencyRecorder
CS.LatencyRecorder = LatencyRecorder

function LatencyRecorder:StopAndReport() end

---@class LobbyInfo : System.Object
---@field AddedPlayers System.Collections.Generic.List
LobbyInfo = {}
---@alias CS.LobbyInfo LobbyInfo
CS.LobbyInfo = LobbyInfo

---@return LobbyInfo
function LobbyInfo.New() end

---@class LobbyInfo.PlayerInfo : System.Object
---@field Name string
---@field Id string
---@field IsSyncedRole boolean
---@field Version string
---@field Mods Witch.Mod.ModConfig[]
---@field Connection Mirror.NetworkConnectionToClient
LobbyInfo.PlayerInfo = {}
---@alias CS.LobbyInfo.PlayerInfo LobbyInfo.PlayerInfo
CS.LobbyInfo.PlayerInfo = LobbyInfo.PlayerInfo

---@return LobbyInfo.PlayerInfo
function LobbyInfo.PlayerInfo.New() end

---@class LobbyManager : Mirror.NetworkManager
---@field lobbyId number
---@field Instance LobbyManager
LobbyManager = {}
---@alias CS.LobbyManager LobbyManager
CS.LobbyManager = LobbyManager

---@param modeType string
function LobbyManager:SetLobbyModeType(modeType) end
function LobbyManager:Awake() end
---@param conn Mirror.NetworkConnectionToClient
function LobbyManager:OnServerDisconnect(conn) end
function LobbyManager:OnClientDisconnect() end
---@param joined boolean
function LobbyManager:UpdateSteamLobyState(joined) end
function LobbyManager:QuitLobby() end
function LobbyManager:OnApplicationQuit() end
---@param conn Mirror.NetworkConnectionToClient
function LobbyManager:OnServerConnect(conn) end

---@class PlayerManager : Mirror.NetworkBehaviour
---@field playerInfo LobbyInfo.PlayerInfo
---@field LobbyInfos LobbyInfo
---@field ShareCards Mirror.SyncList
---@field ShareRelics Mirror.SyncList
---@field ShareFood Mirror.SyncList
---@field Instance PlayerManager
---@field PlayerId string
---@field NetworkplayerInfo LobbyInfo.PlayerInfo
---@field NetworkLobbyInfos LobbyInfo
PlayerManager = {}
---@alias CS.PlayerManager PlayerManager
CS.PlayerManager = PlayerManager

function PlayerManager:StartGame() end
function PlayerManager:EnsureShareFoodCreated() end
function PlayerManager:ResetShareFood() end
---@param conn Mirror.NetworkConnectionToClient
---@param message string
function PlayerManager:ShowMessage(conn, message) end
---@param conn Mirror.NetworkConnectionToClient
---@param roleTable RoleTable
function PlayerManager:RpcContinueToGame(conn, roleTable) end
---@param info LobbyInfo.PlayerInfo
---@param conn Mirror.NetworkConnectionToClient
function PlayerManager:CmdJoinLobby(info, conn) end
---@param info LobbyInfo.PlayerInfo
function PlayerManager:LeaveLobby(info) end
---@param players System.Collections.Generic.List
function PlayerManager:RpcUpdateLobby(players) end
---@param ready boolean
---@param playerId string
function PlayerManager:CmdReady(ready, playerId) end
---@param ready boolean
---@param playerId string
function PlayerManager:RpcReady(ready, playerId) end
function PlayerManager:RpcSyncRoleTables() end
function PlayerManager:CmdChangeHide() end
---@param target Mirror.NetworkConnection
---@param roleTable RoleTable
---@param GetSaveType string
function PlayerManager:RpcNewGameInit(target, roleTable, GetSaveType) end
function PlayerManager:ChangeHide() end
---@param roleTable RoleTable
function PlayerManager:CmdSyncRoleTable(roleTable) end
function PlayerManager:CmdSendSave() end
function PlayerManager:GameOver() end
---@param dataConfig string
---@param fromId string
function PlayerManager:CmdSendCareer(dataConfig, fromId) end
---@param dataConfig string
---@param fromId string
function PlayerManager:RpcSendCareer(dataConfig, fromId) end
---@param mapMode string
function PlayerManager:RpcSetMapMode(mapMode) end
function PlayerManager:OnStartClient() end
function PlayerManager:CreateChatPanel() end
---@param value string
---@param fromId string
---@param type string
function PlayerManager:CmdSendRoleTable(value, fromId, type) end
---@param value string
---@param fromId string
---@param type string
function PlayerManager:RpcSendRoleTable(value, fromId, type) end
---@param key string
---@param value string
function PlayerManager:SetGameVar(key, value) end
function PlayerManager:RpcGameOver() end
---@param saveJson System.Byte[]
function PlayerManager:CmdSyncHostSave(saveJson) end
---@param compressed System.Byte[]
function PlayerManager:RpcHostSave(compressed) end
function PlayerManager:OnPlayerDisconnected() end
---@param command Network.Command.RpcCommandBase
function PlayerManager:SendRpcCommand(command) end
---@param command Network.Command.RpcCommandBase
function PlayerManager:SendRpcCommandExcludeOwner(command) end
---@return boolean
function PlayerManager:Weaved() end
---@param writer Mirror.NetworkWriter
---@param forceAll boolean
function PlayerManager:SerializeSyncVars(writer, forceAll) end
---@param reader Mirror.NetworkReader
---@param initialState boolean
function PlayerManager:DeserializeSyncVars(reader, initialState) end

---@class BlessingRelic : Singleton
---@field Instance BlessingRelic -- infered from Singleton`1[BlessingRelic]
---@field GetInstance BlessingRelic -- infered from Singleton`1[BlessingRelic]
BlessingRelic = {}
---@alias CS.BlessingRelic BlessingRelic
CS.BlessingRelic = BlessingRelic

---@return BlessingRelic
function BlessingRelic.New() end
---@return BlessingRelic
function BlessingRelic:Init() end
---@param status StatusManager
---@return BlessingRelic
function BlessingRelic:Apply(status) end
---@return BlessingRelic
function BlessingRelic:Clear() end

---@class AnimatorRole : UnityEngine.MonoBehaviour
---@field animationPerFrame number
---@field dataConfig DataConfig
---@field SpecialScale boolean
---@field OriPos UnityEngine.Vector2
---@field InstanceId string
---@field NeeDYOffset boolean
---@field animationTimeCounter number
---@field BottomDistance number
---@field TopDistance number
AnimatorRole = {}
---@alias CS.AnimatorRole AnimatorRole
CS.AnimatorRole = AnimatorRole

---@param fromData DataConfig
---@param instanceId string
---@param needDialogueBox boolean
---@param yoff boolean
function AnimatorRole:Init(fromData, instanceId, needDialogueBox, yoff) end
---@param path string
---@return string
function AnimatorRole:TryGetAnimationConfig(path) end
---@param sprite UnityEngine.Sprite
---@param instanceId string
function AnimatorRole:InitSprite(sprite, instanceId) end
function AnimatorRole:GetConfig() end

---@class RandomMove : UnityEngine.MonoBehaviour
RandomMove = {}
---@alias CS.RandomMove RandomMove
CS.RandomMove = RandomMove


---@class RorationFix : UnityEngine.MonoBehaviour
RorationFix = {}
---@alias CS.RorationFix RorationFix
CS.RorationFix = RorationFix


---@class UIAnimation : UnityEngine.MonoBehaviour
---@field FPS number
---@field SpriteFrames System.Collections.Generic.List
---@field FrameDurations System.Collections.Generic.List
---@field GifAsset GifAsset
---@field IsPlaying boolean
---@field Foward boolean
---@field AutoPlay boolean
---@field Loop boolean
---@field OnComplete System.Action | function
---@field SourceSize boolean
---@field SliceImage boolean
---@field FrameCount number
UIAnimation = {}
---@alias CS.UIAnimation UIAnimation
CS.UIAnimation = UIAnimation

---@param idx number
function UIAnimation:SetSprite(idx) end
---@param gif GifAsset
function UIAnimation:SetGif(gif) end
function UIAnimation:Play() end
function UIAnimation:PlayReverse() end
function UIAnimation:Pause() end
function UIAnimation:Resume() end
function UIAnimation:Stop() end
function UIAnimation:Rewind() end

---@class UIParallax : UnityEngine.MonoBehaviour
---@field uiElements UnityEngine.RectTransform[]
---@field parallaxSpeeds System.Single[]
---@field minPositions UnityEngine.Vector2[]
---@field maxPositions UnityEngine.Vector2[]
UIParallax = {}
---@alias CS.UIParallax UIParallax
CS.UIParallax = UIParallax


---@class AnimationManager : System.Object
---@field Instance AnimationManager
AnimationManager = {}
---@alias CS.AnimationManager AnimationManager
CS.AnimationManager = AnimationManager

---@return AnimationManager
function AnimationManager.New() end
---@param obj UnityEngine.GameObject
function AnimationManager:AnimationPlay(obj) end
---@param obj UnityEngine.Transform
function AnimationManager:Tailing(obj) end

---@class ProgressButton : UnityEngine.MonoBehaviour
---@field isLongPress boolean
---@field OnPress System.Action | function
---@field progress number
---@field pressTime number
---@field maxA number
---@field acc number
---@field text TMPro.TMP_Text
ProgressButton = {}
---@alias CS.ProgressButton ProgressButton
CS.ProgressButton = ProgressButton

function ProgressButton:Awake() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ProgressButton:OnPointerDown(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ProgressButton:OnPointerUp(eventData) end

---@class SelectGroup : SwitchButton
SelectGroup = {}
---@alias CS.SelectGroup SelectGroup
CS.SelectGroup = SelectGroup


---@class SwitchButton : UnityEngine.MonoBehaviour
---@field Normal UnityEngine.CanvasGroup
---@field Pressed UnityEngine.CanvasGroup
---@field Highlighted UnityEngine.CanvasGroup
---@field _isOn boolean
---@field isSingle boolean
---@field allowSwitchOff boolean
---@field AlwaysOn boolean
---@field animationType SwitchButton.AnimationType
---@field transitionTime number
---@field isAnimated boolean
---@field MustLeftClick boolean
---@field interactable boolean
---@field onValueChanged UnityEngine.Events.UnityEvent
---@field onClick UnityEngine.Events.UnityEvent
---@field isOn boolean
SwitchButton = {}
---@alias CS.SwitchButton SwitchButton
CS.SwitchButton = SwitchButton

function SwitchButton:Awake() end
function SwitchButton:SetOffImmediate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SwitchButton:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SwitchButton:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SwitchButton:OnPointerClick(eventData) end
---@param action System.Action | function
function SwitchButton:SetElement(action) end

---@class SwitchButton.AnimationType
---@field None SwitchButton.AnimationType
---@field Fade SwitchButton.AnimationType
SwitchButton.AnimationType = {}
---@alias CS.SwitchButton.AnimationType SwitchButton.AnimationType
CS.SwitchButton.AnimationType = SwitchButton.AnimationType


---@class SwitchButtonGroup : UnityEngine.MonoBehaviour
SwitchButtonGroup = {}
---@alias CS.SwitchButtonGroup SwitchButtonGroup
CS.SwitchButtonGroup = SwitchButtonGroup


---@class HorizontalScrollSnapController : UnityEngine.MonoBehaviour
---@field CurrentStepIndex number
---@field MaxStepIndex number
HorizontalScrollSnapController = {}
---@alias CS.HorizontalScrollSnapController HorizontalScrollSnapController
CS.HorizontalScrollSnapController = HorizontalScrollSnapController

function HorizontalScrollSnapController:RefreshLayout() end
function HorizontalScrollSnapController:MovePrevious() end
function HorizontalScrollSnapController:MoveNext() end
function HorizontalScrollSnapController:SnapToNearest() end
function HorizontalScrollSnapController:SnapToNearestImmediate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function HorizontalScrollSnapController:OnEndDrag(eventData) end

---@class ScrollRectDragForwarder : UnityEngine.MonoBehaviour
ScrollRectDragForwarder = {}
---@alias CS.ScrollRectDragForwarder ScrollRectDragForwarder
CS.ScrollRectDragForwarder = ScrollRectDragForwarder

---@param scrollRect UnityEngine.UI.ScrollRect
function ScrollRectDragForwarder:SetTarget(scrollRect) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ScrollRectDragForwarder:OnInitializePotentialDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ScrollRectDragForwarder:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ScrollRectDragForwarder:OnDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function ScrollRectDragForwarder:OnEndDrag(eventData) end

---@class AnimatedHorizontalLayout : AnimatedLayout
AnimatedHorizontalLayout = {}
---@alias CS.AnimatedHorizontalLayout AnimatedHorizontalLayout
CS.AnimatedHorizontalLayout = AnimatedHorizontalLayout

---@param rectTransform UnityEngine.RectTransform
---@param pos number
---@param duration number
function AnimatedHorizontalLayout:SetLayout(rectTransform, pos, duration) end

---@class AnimatedLayout : UnityEngine.MonoBehaviour
---@field duration number
---@field ease DG.Tweening.Ease
---@field spacing number
---@field useScaleX boolean
---@field useScaleY boolean
AnimatedLayout = {}
---@alias CS.AnimatedLayout AnimatedLayout
CS.AnimatedLayout = AnimatedLayout

function AnimatedLayout:Start() end
function AnimatedLayout:OnTransformChildrenChanged() end
---@param duration number
function AnimatedLayout:LayoutChildren(duration) end
---@param rectTransform UnityEngine.RectTransform
---@param pos number
---@param duration number
function AnimatedLayout:SetLayout(rectTransform, pos, duration) end
function AnimatedLayout:Update() end

---@class AnimatedLayout.EnableListener : UnityEngine.MonoBehaviour
---@field layout AnimatedLayout
AnimatedLayout.EnableListener = {}
---@alias CS.AnimatedLayout.EnableListener AnimatedLayout.EnableListener
CS.AnimatedLayout.EnableListener = AnimatedLayout.EnableListener

function AnimatedLayout.EnableListener:OnEnable() end
function AnimatedLayout.EnableListener:OnDisable() end
function AnimatedLayout.EnableListener:OnDestroy() end

---@class TextWithKeyword : UnityEngine.MonoBehaviour
---@field tooltip UnityEngine.RectTransform
---@field maxDistance number
TextWithKeyword = {}
---@alias CS.TextWithKeyword TextWithKeyword
CS.TextWithKeyword = TextWithKeyword

function TextWithKeyword:Init() end
---@param pos UnityEngine.Vector2
---@param keyword string
---@param text string
---@param icon UnityEngine.Sprite
---@param type string
function TextWithKeyword:ShowTooltip(pos, keyword, text, icon, type) end
function TextWithKeyword:HideTooltip() end

---@class TMPFontFallbackManager : System.Object
TMPFontFallbackManager = {}
---@alias CS.TMPFontFallbackManager TMPFontFallbackManager
CS.TMPFontFallbackManager = TMPFontFallbackManager

---@param language string
function TMPFontFallbackManager.ApplyForLanguage(language) end

---@class BuffItem : UnityEngine.MonoBehaviour
---@field buffBarUI Witch.UI.Window.BuffBarUI
---@field keywordDisplay Witch.UI.KeywordDisplay
---@field HasClear boolean
---@field buffConfig IBuffItemConfig
---@field status IStatusManager
---@field effectList System.Collections.ObjectModel.ObservableCollection
---@field scriptExecutor IScriptExecutor
BuffItem = {}
---@alias CS.BuffItem BuffItem
CS.BuffItem = BuffItem

---@param config BuffItemConfig
---@param Status StatusManager
---@param buffBarUI Witch.UI.Window.BuffBarUI
function BuffItem:Init(config, Status, buffBarUI) end
---@param isacting boolean
function BuffItem:BuffProcess(isacting) end
function BuffItem:EffectAnimation() end
function BuffItem:UpdateMsg() end
---@param index number
function BuffItem:UpdateSorting(index) end
function BuffItem:UpdateTooltip() end
function BuffItem:ApplyBuff() end
---@param way string
function BuffItem:DurationCheck(way) end
function BuffItem:ClearBuff() end
---@param fromId string
---@param needAnnounce boolean
function BuffItem:ClearDynamicVar(fromId, needAnnounce) end

---@class TextUse : UnityEngine.MonoBehaviour
---@field oddLineOffset number
TextUse = {}
---@alias CS.TextUse TextUse
CS.TextUse = TextUse

---@param raw string
function TextUse:SetText(raw) end

---@class HouseItem : UnityEngine.MonoBehaviour
---@field houseManager Witch.UI.Window.HouseManager
---@field TargetCount number
---@field oriStr string
---@field houseItemType HouseItem.HouseItemType
HouseItem = {}
---@alias CS.HouseItem HouseItem
CS.HouseItem = HouseItem

function HouseItem:RegisterEvent() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function HouseItem:OnPointerClick(eventData) end

---@class HouseItem.HouseItemType
---@field CardEditor HouseItem.HouseItemType
---@field OutsiderShop HouseItem.HouseItemType
---@field ModManager HouseItem.HouseItemType
---@field GameMenu HouseItem.HouseItemType
---@field crystalBall HouseItem.HouseItemType
---@field store HouseItem.HouseItemType
---@field Dictionary HouseItem.HouseItemType
---@field shadow HouseItem.HouseItemType
---@field announcement HouseItem.HouseItemType
---@field task HouseItem.HouseItemType
---@field cardShop HouseItem.HouseItemType
---@field rollShop HouseItem.HouseItemType
---@field Achievement HouseItem.HouseItemType
HouseItem.HouseItemType = {}
---@alias CS.HouseItem.HouseItemType HouseItem.HouseItemType
CS.HouseItem.HouseItemType = HouseItem.HouseItemType


---@class MapFrame : UnityEngine.MonoBehaviour
MapFrame = {}
---@alias CS.MapFrame MapFrame
CS.MapFrame = MapFrame

---@param eventData UnityEngine.EventSystems.PointerEventData
function MapFrame:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapFrame:OnPointerExit(eventData) end

---@class MapItem : Witch.UI.Window.Item
---@field node MapTree.Node
---@field animationController CardAnimationController
---@field hasSelected boolean
---@field des boolean
---@field ignore boolean
---@field isReverse boolean
---@field initPosition UnityEngine.Vector2
---@field initAngle UnityEngine.Vector3
---@field draging boolean
---@field index number
---@field initScale number
---@field selectScale number
MapItem = {}
---@alias CS.MapItem MapItem
CS.MapItem = MapItem

function MapItem:Awake() end
---@param node1 MapTree.Node
function MapItem:Init(node1) end
function MapItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnPointerDown(eventData) end
---@return Cysharp.Threading.Tasks.UniTask
function MapItem:StartLine() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnEndDrag(eventData) end
function MapItem:OnDestroy() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnDrag(eventData) end
function MapItem:RayCheck() end
function MapItem:RemoveFromParent() end
function MapItem:OnTransformParentChanged() end
---@param item SwapContentIdentity
function MapItem:AddToList(item) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function MapItem:OnBeginDrag(eventData) end
---@param Index number
function MapItem:SetIndex(Index) end

---@class MapTree : System.Object
---@field root MapTree.Node
---@field currentNode MapTree.Node
---@field treedice Dice
---@field SelectNode System.Collections.Generic.List
---@field DefaultNode System.Collections.Generic.List
---@field hasUsed System.Collections.Generic.List
MapTree = {}
---@alias CS.MapTree MapTree
CS.MapTree = MapTree

---@return MapTree
function MapTree.New() end
---@param type string
---@return MapTree.Node
function MapTree:TypeGenerate(type) end
---@param nodeId string
---@return MapTree.Node
function MapTree:GetNodeByNodeId(nodeId) end

---@class MapTree.Node : System.Object
---@field depth number
---@field type string
---@field data System.Collections.Generic.Dictionary
---@field NodeDice Dice
---@field childrens MapTree.Node[]
MapTree.Node = {}
---@alias CS.MapTree.Node MapTree.Node
CS.MapTree.Node = MapTree.Node

---@param type string
---@return MapTree.Node
function MapTree.Node.New(type) end
---@param index number
---@param child MapTree.Node
---@return MapTree.Node
function MapTree.Node:SetChild(index, child) end
---@param index number
---@return MapTree.Node
function MapTree.Node:GetChild(index) end

---@class SettingMapper : UnityEngine.MonoBehaviour
SettingMapper = {}
---@alias CS.SettingMapper SettingMapper
CS.SettingMapper = SettingMapper


---@class DialogueBox : UnityEngine.MonoBehaviour
DialogueBox = {}
---@alias CS.DialogueBox DialogueBox
CS.DialogueBox = DialogueBox

---@param dataConfig DataConfig
function DialogueBox:ShowDialogue(dataConfig) end
---@param id string
---@param emoji GifAsset
function DialogueBox:ShowEmoji(id, emoji) end
function DialogueBox:Close() end
function DialogueBox:PlayTalkEffect() end

---@class DialogueBoxIdentity : UnityEngine.MonoBehaviour
---@field Name string
DialogueBoxIdentity = {}
---@alias CS.DialogueBoxIdentity DialogueBoxIdentity
CS.DialogueBoxIdentity = DialogueBoxIdentity

function DialogueBoxIdentity:Start() end
function DialogueBoxIdentity:OnDestroy() end
---@param id string
function DialogueBoxIdentity:SetInstanceId(id) end

---@class DiceIcon : UnityEngine.MonoBehaviour
---@field result TMPro.TextMeshProUGUI
---@field bonusText TMPro.TextMeshProUGUI
---@field range TMPro.TextMeshProUGUI
---@field Target string
---@field canvasGroup UnityEngine.CanvasGroup
---@field rollDuration number
---@field value number
---@field bonus number
---@field rangeValue System.Nullable
DiceIcon = {}
---@alias CS.DiceIcon DiceIcon
CS.DiceIcon = DiceIcon

---@param title string
function DiceIcon:Roll(title) end

---@class FightLine : UnityEngine.MonoBehaviour
---@field curvature number
---@field arrowLength number
---@field show boolean
FightLine = {}
---@alias CS.FightLine FightLine
CS.FightLine = FightLine

---@param localPos UnityEngine.Vector3
function FightLine:SetStartPos(localPos) end
function FightLine:OnEnable() end
---@param uiObject UnityEngine.Transform
function FightLine:Combine(uiObject) end
---@param uiWorldPos UnityEngine.Vector3
function FightLine:SetEndPos(uiWorldPos) end
---@param start UnityEngine.Vector3
---@param control UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function FightLine:GetBezier(start, control, _end, t) end

---@class FloatingWindow : UnityEngine.MonoBehaviour
---@field buttons System.Collections.Generic.List
---@field showItem UnityEngine.Transform
---@field subitemContent UnityEngine.Transform
FloatingWindow = {}
---@alias CS.FloatingWindow FloatingWindow
CS.FloatingWindow = FloatingWindow

---@overload fun(self: FloatingWindow, obj: UnityEngine.Transform)
---@param pos UnityEngine.Vector3
function FloatingWindow:Show(pos) end
function FloatingWindow:Hide() end
---@overload fun(self: FloatingWindow, basename: string, action: UnityEngine.Events.UnityAction, subItems: System.Collections.Generic.List) : FloatingWindow
---@param button1 FloatingWindow.button
function FloatingWindow:AddButton(button1) end
---@return FloatingWindow
function FloatingWindow:Clear() end
---@return FloatingWindow
function FloatingWindow:ResetWindow() end

---@class FloatingWindow.button : System.Object
---@field name string
---@field action UnityEngine.Events.UnityAction
---@field subButtons System.Collections.Generic.List
FloatingWindow.button = {}
---@alias CS.FloatingWindow.button FloatingWindow.button
CS.FloatingWindow.button = FloatingWindow.button

---@return FloatingWindow.button
function FloatingWindow.button.New() end

---@class SelectMessage : UnityEngine.MonoBehaviour
---@field msg string
---@field ClickAction System.Action | function
SelectMessage = {}
---@alias CS.SelectMessage SelectMessage
CS.SelectMessage = SelectMessage

---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectMessage:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectMessage:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectMessage:OnPointerClick(eventData) end

---@class SelectOutline : UnityEngine.MonoBehaviour
SelectOutline = {}
---@alias CS.SelectOutline SelectOutline
CS.SelectOutline = SelectOutline

---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectOutline:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectOutline:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function SelectOutline:OnPointerClick(eventData) end

---@class SwapContentIdentity : UnityEngine.MonoBehaviour
---@field ItemName string
---@field Content UnityEngine.Transform
---@field CheckType boolean
SwapContentIdentity = {}
---@alias CS.SwapContentIdentity SwapContentIdentity
CS.SwapContentIdentity = SwapContentIdentity


---@class Tooltip : UnityEngine.MonoBehaviour
---@field spacingX number
---@field spacingY number
---@field subWidth number
---@field subHeight number
---@field transitionTime number
Tooltip = {}
---@alias CS.Tooltip Tooltip
CS.Tooltip = Tooltip

---@param obj UnityEngine.Transform
---@param title string
---@param text string
---@param keywords System.Collections.Generic.List
---@param msg string
---@param icon UnityEngine.Sprite
---@param type string
---@param Main boolean
---@param Sub boolean
function Tooltip:Show(obj, title, text, keywords, msg, icon, type, Main, Sub) end
function Tooltip:Hide() end

---@class XluaEventVarUse : System.Object
---@field XLua_CSharpCallLua_Delegates System.Collections.Generic.List
XluaEventVarUse = {}
---@alias CS.XluaEventVarUse XluaEventVarUse
CS.XluaEventVarUse = XluaEventVarUse


---@class ExampleGenConfig : System.Object
---@field LuaCallCSharp System.Collections.Generic.List
---@field CSharpCallLua System.Collections.Generic.List
---@field BlackList System.Collections.Generic.List
---@field BlackGenericTypeList System.Collections.Generic.List
---@field GenericTypeFilter System.Func
ExampleGenConfig = {}
---@alias CS.ExampleGenConfig ExampleGenConfig
CS.ExampleGenConfig = ExampleGenConfig


---@class LuaCallCs : UnityEngine.MonoBehaviour
LuaCallCs = {}
---@alias CS.LuaCallCs LuaCallCs
CS.LuaCallCs = LuaCallCs


---@class UnitySourceGeneratedAssemblyMonoScriptTypes_v1 : System.Object
UnitySourceGeneratedAssemblyMonoScriptTypes_v1 = {}
---@alias CS.UnitySourceGeneratedAssemblyMonoScriptTypes_v1 UnitySourceGeneratedAssemblyMonoScriptTypes_v1
CS.UnitySourceGeneratedAssemblyMonoScriptTypes_v1 = UnitySourceGeneratedAssemblyMonoScriptTypes_v1

---@return UnitySourceGeneratedAssemblyMonoScriptTypes_v1
function UnitySourceGeneratedAssemblyMonoScriptTypes_v1.New() end

---@class UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData : System.ValueType
---@field FilePathsData System.Byte[]
---@field TypesData System.Byte[]
---@field TotalTypes number
---@field TotalFiles number
---@field IsEditorOnly boolean
UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData = {}
---@alias CS.UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData
CS.UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData = UnitySourceGeneratedAssemblyMonoScriptTypes_v1.MonoScriptData


---@class Tutorial.CSCallLua : UnityEngine.MonoBehaviour
Tutorial.CSCallLua = {}
---@alias CS.Tutorial.CSCallLua Tutorial.CSCallLua
CS.Tutorial.CSCallLua = Tutorial.CSCallLua


---@class Tutorial.CSCallLua.DClass : System.Object
---@field f1 number
---@field f2 number
Tutorial.CSCallLua.DClass = {}
---@alias CS.Tutorial.CSCallLua.DClass Tutorial.CSCallLua.DClass
CS.Tutorial.CSCallLua.DClass = Tutorial.CSCallLua.DClass

---@return Tutorial.CSCallLua.DClass
function Tutorial.CSCallLua.DClass.New() end

---@class Tutorial.CSCallLua.ItfD
---@field f1 number
---@field f2 number
Tutorial.CSCallLua.ItfD = {}
---@alias CS.Tutorial.CSCallLua.ItfD Tutorial.CSCallLua.ItfD
CS.Tutorial.CSCallLua.ItfD = Tutorial.CSCallLua.ItfD

---@param a number
---@param b number
---@return number
function Tutorial.CSCallLua.ItfD:add(a, b) end

---@class Tutorial.CSCallLua.FDelegate : System.MulticastDelegate
Tutorial.CSCallLua.FDelegate = {}
---@alias CS.Tutorial.CSCallLua.FDelegate Tutorial.CSCallLua.FDelegate
CS.Tutorial.CSCallLua.FDelegate = Tutorial.CSCallLua.FDelegate

---@param object System.Object
---@param method System.IntPtr
---@return Tutorial.CSCallLua.FDelegate
function Tutorial.CSCallLua.FDelegate.New(object, method) end
---@param a number
---@param b string
---@param out_c Tutorial.CSCallLua.DClass
---@return number,Tutorial.CSCallLua.DClass
function Tutorial.CSCallLua.FDelegate:Invoke(a, b, out_c) end
---@param a number
---@param b string
---@param out_c Tutorial.CSCallLua.DClass
---@param callback System.AsyncCallback
---@param object System.Object
---@return System.IAsyncResult,Tutorial.CSCallLua.DClass
function Tutorial.CSCallLua.FDelegate:BeginInvoke(a, b, out_c, callback, object) end
---@param out_c Tutorial.CSCallLua.DClass
---@param result System.IAsyncResult
---@return number,Tutorial.CSCallLua.DClass
function Tutorial.CSCallLua.FDelegate:EndInvoke(out_c, result) end

---@class Tutorial.CSCallLua.GetE : System.MulticastDelegate
Tutorial.CSCallLua.GetE = {}
---@alias CS.Tutorial.CSCallLua.GetE Tutorial.CSCallLua.GetE
CS.Tutorial.CSCallLua.GetE = Tutorial.CSCallLua.GetE

---@param object System.Object
---@param method System.IntPtr
---@return Tutorial.CSCallLua.GetE
function Tutorial.CSCallLua.GetE.New(object, method) end
---@return System.Action | function
function Tutorial.CSCallLua.GetE:Invoke() end
---@param callback System.AsyncCallback
---@param object System.Object
---@return System.IAsyncResult
function Tutorial.CSCallLua.GetE:BeginInvoke(callback, object) end
---@param result System.IAsyncResult
---@return System.Action | function
function Tutorial.CSCallLua.GetE:EndInvoke(result) end

---@class Tutorial.ByFile : UnityEngine.MonoBehaviour
Tutorial.ByFile = {}
---@alias CS.Tutorial.ByFile Tutorial.ByFile
CS.Tutorial.ByFile = Tutorial.ByFile


---@class Tutorial.ByString : UnityEngine.MonoBehaviour
Tutorial.ByString = {}
---@alias CS.Tutorial.ByString Tutorial.ByString
CS.Tutorial.ByString = Tutorial.ByString


---@class Tutorial.CustomLoader : UnityEngine.MonoBehaviour
Tutorial.CustomLoader = {}
---@alias CS.Tutorial.CustomLoader Tutorial.CustomLoader
CS.Tutorial.CustomLoader = Tutorial.CustomLoader


---@class Tutorial.BaseClass : System.Object
---@field BSF number
---@field BMF number
Tutorial.BaseClass = {}
---@alias CS.Tutorial.BaseClass Tutorial.BaseClass
CS.Tutorial.BaseClass = Tutorial.BaseClass

---@return Tutorial.BaseClass
function Tutorial.BaseClass.New() end
function Tutorial.BaseClass.BSFunc() end
function Tutorial.BaseClass:BMFunc() end
---@return number
function Tutorial.BaseClass:GetSomeBaseData() end

---@class Tutorial.Param1 : System.ValueType
---@field x number
---@field y string
Tutorial.Param1 = {}
---@alias CS.Tutorial.Param1 Tutorial.Param1
CS.Tutorial.Param1 = Tutorial.Param1


---@class Tutorial.TestEnum
---@field E1 Tutorial.TestEnum
---@field E2 Tutorial.TestEnum
Tutorial.TestEnum = {}
---@alias CS.Tutorial.TestEnum Tutorial.TestEnum
CS.Tutorial.TestEnum = Tutorial.TestEnum


---@class Tutorial.DerivedClass : Tutorial.BaseClass
---@field TestDelegate System.Action | function
---@field DMF number
Tutorial.DerivedClass = {}
---@alias CS.Tutorial.DerivedClass Tutorial.DerivedClass
CS.Tutorial.DerivedClass = Tutorial.DerivedClass

---@return Tutorial.DerivedClass
function Tutorial.DerivedClass.New() end
function Tutorial.DerivedClass:DMFunc() end
---@param p1 Tutorial.Param1
---@param ref_p2 number
---@param out_p3 string
---@param luafunc System.Action | function
---@param out_csfunc System.Action | function
---@return number,number,string,System.Action
function Tutorial.DerivedClass:ComplexFunc(p1, ref_p2, out_p3, luafunc, out_csfunc) end
---@overload fun(self: Tutorial.DerivedClass, i: number)
---@param i string
function Tutorial.DerivedClass:TestFunc(i) end
---@param a number
---@param b string
---@param c string
function Tutorial.DerivedClass:DefaultValueFunc(a, b, c) end
---@param a number
---@param strs System.String[]
function Tutorial.DerivedClass:VariableParamsFunc(a, strs) end
---@param e Tutorial.TestEnum
---@return Tutorial.TestEnum
function Tutorial.DerivedClass:EnumTestFunc(e) end
function Tutorial.DerivedClass:CallEvent() end
---@param n number
---@return number
function Tutorial.DerivedClass:TestLong(n) end
---@return Tutorial.ICalc
function Tutorial.DerivedClass:GetCalc() end
---@return number
function Tutorial.DerivedClass:GetSomeData() end
function Tutorial.DerivedClass:GenericMethodOfString() end

---@class Tutorial.DerivedClass.TestEnumInner
---@field E3 Tutorial.DerivedClass.TestEnumInner
---@field E4 Tutorial.DerivedClass.TestEnumInner
Tutorial.DerivedClass.TestEnumInner = {}
---@alias CS.Tutorial.DerivedClass.TestEnumInner Tutorial.DerivedClass.TestEnumInner
CS.Tutorial.DerivedClass.TestEnumInner = Tutorial.DerivedClass.TestEnumInner


---@class Tutorial.DerivedClass.InnerCalc : System.Object
---@field id number
Tutorial.DerivedClass.InnerCalc = {}
---@alias CS.Tutorial.DerivedClass.InnerCalc Tutorial.DerivedClass.InnerCalc
CS.Tutorial.DerivedClass.InnerCalc = Tutorial.DerivedClass.InnerCalc

---@return Tutorial.DerivedClass.InnerCalc
function Tutorial.DerivedClass.InnerCalc.New() end
---@param a number
---@param b number
---@return number
function Tutorial.DerivedClass.InnerCalc:add(a, b) end

---@class Tutorial.ICalc
Tutorial.ICalc = {}
---@alias CS.Tutorial.ICalc Tutorial.ICalc
CS.Tutorial.ICalc = Tutorial.ICalc

---@param a number
---@param b number
---@return number
function Tutorial.ICalc:add(a, b) end

---@class Tutorial.DerivedClassExtensions : System.Object
Tutorial.DerivedClassExtensions = {}
---@alias CS.Tutorial.DerivedClassExtensions Tutorial.DerivedClassExtensions
CS.Tutorial.DerivedClassExtensions = Tutorial.DerivedClassExtensions

---@param obj Tutorial.DerivedClass
---@return number
function Tutorial.DerivedClassExtensions.GetSomeData(obj) end
---@param obj Tutorial.BaseClass
---@return number
function Tutorial.DerivedClassExtensions.GetSomeBaseData(obj) end
---@param obj Tutorial.DerivedClass
function Tutorial.DerivedClassExtensions.GenericMethodOfString(obj) end

---@class UI.ScreenEffect.ScreenEffectBase : UnityEngine.MonoBehaviour
---@field delay number
UI.ScreenEffect.ScreenEffectBase = {}
---@alias CS.UI.ScreenEffect.ScreenEffectBase UI.ScreenEffect.ScreenEffectBase
CS.UI.ScreenEffect.ScreenEffectBase = UI.ScreenEffect.ScreenEffectBase

function UI.ScreenEffect.ScreenEffectBase:Play() end

---@class UI.ScreenEffect.ShakeScreenEffect : UI.ScreenEffect.ScreenEffectBase
---@field count number
---@field duration number
---@field intensity number
UI.ScreenEffect.ShakeScreenEffect = {}
---@alias CS.UI.ScreenEffect.ShakeScreenEffect UI.ScreenEffect.ShakeScreenEffect
CS.UI.ScreenEffect.ShakeScreenEffect = UI.ScreenEffect.ShakeScreenEffect

function UI.ScreenEffect.ShakeScreenEffect:Play() end

---@class UnityEngine.UI.ScrollRectNonDrag : UnityEngine.EventSystems.UIBehaviour
---@field content UnityEngine.RectTransform
---@field horizontal boolean
---@field vertical boolean
---@field movementType UnityEngine.UI.ScrollRectNonDrag.MovementType
---@field elasticity number
---@field inertia boolean
---@field decelerationRate number
---@field scrollSensitivity number
---@field viewport UnityEngine.RectTransform
---@field horizontalScrollbar UnityEngine.UI.Scrollbar
---@field verticalScrollbar UnityEngine.UI.Scrollbar
---@field horizontalScrollbarVisibility UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
---@field verticalScrollbarVisibility UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
---@field horizontalScrollbarSpacing number
---@field verticalScrollbarSpacing number
---@field onValueChanged UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent
---@field velocity UnityEngine.Vector2
---@field normalizedPosition UnityEngine.Vector2
---@field horizontalNormalizedPosition number
---@field verticalNormalizedPosition number
---@field minWidth number
---@field preferredWidth number
---@field flexibleWidth number
---@field minHeight number
---@field preferredHeight number
---@field flexibleHeight number
---@field layoutPriority number
UnityEngine.UI.ScrollRectNonDrag = {}
---@alias CS.UnityEngine.UI.ScrollRectNonDrag UnityEngine.UI.ScrollRectNonDrag
CS.UnityEngine.UI.ScrollRectNonDrag = UnityEngine.UI.ScrollRectNonDrag

---@param executing UnityEngine.UI.CanvasUpdate
function UnityEngine.UI.ScrollRectNonDrag:Rebuild(executing) end
function UnityEngine.UI.ScrollRectNonDrag:LayoutComplete() end
function UnityEngine.UI.ScrollRectNonDrag:GraphicUpdateComplete() end
---@return boolean
function UnityEngine.UI.ScrollRectNonDrag:IsActive() end
function UnityEngine.UI.ScrollRectNonDrag:StopMovement() end
---@param data UnityEngine.EventSystems.PointerEventData
function UnityEngine.UI.ScrollRectNonDrag:OnScroll(data) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function UnityEngine.UI.ScrollRectNonDrag:OnInitializePotentialDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function UnityEngine.UI.ScrollRectNonDrag:OnBeginDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function UnityEngine.UI.ScrollRectNonDrag:OnEndDrag(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function UnityEngine.UI.ScrollRectNonDrag:OnDrag(eventData) end
function UnityEngine.UI.ScrollRectNonDrag:CalculateLayoutInputHorizontal() end
function UnityEngine.UI.ScrollRectNonDrag:CalculateLayoutInputVertical() end
function UnityEngine.UI.ScrollRectNonDrag:SetLayoutHorizontal() end
function UnityEngine.UI.ScrollRectNonDrag:SetLayoutVertical() end

---@class UnityEngine.UI.ScrollRectNonDrag.MovementType
---@field Unrestricted UnityEngine.UI.ScrollRectNonDrag.MovementType
---@field Elastic UnityEngine.UI.ScrollRectNonDrag.MovementType
---@field Clamped UnityEngine.UI.ScrollRectNonDrag.MovementType
UnityEngine.UI.ScrollRectNonDrag.MovementType = {}
---@alias CS.UnityEngine.UI.ScrollRectNonDrag.MovementType UnityEngine.UI.ScrollRectNonDrag.MovementType
CS.UnityEngine.UI.ScrollRectNonDrag.MovementType = UnityEngine.UI.ScrollRectNonDrag.MovementType


---@class UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
---@field Permanent UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
---@field AutoHide UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
---@field AutoHideAndExpandViewport UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility = {}
---@alias CS.UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility
CS.UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility = UnityEngine.UI.ScrollRectNonDrag.ScrollbarVisibility


---@class UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent : UnityEngine.Events.UnityEvent
UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent = {}
---@alias CS.UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent
CS.UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent = UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent

---@return UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent
function UnityEngine.UI.ScrollRectNonDrag.ScrollRectEvent.New() end

---@class Component.UI.Animation.ClockAnimator : UnityEngine.MonoBehaviour
---@field clockHand UnityEngine.Transform
---@field clockBoard UnityEngine.Transform
---@field rotateSound UnityEngine.AudioClip
---@field rotationDuration number
---@field fullRotationEase DG.Tweening.Ease
---@field rotateCount number
Component.UI.Animation.ClockAnimator = {}
---@alias CS.Component.UI.Animation.ClockAnimator Component.UI.Animation.ClockAnimator
CS.Component.UI.Animation.ClockAnimator = Component.UI.Animation.ClockAnimator

function Component.UI.Animation.ClockAnimator:Awake() end
---@param rotateType Component.UI.Animation.ClockAnimator.RotatePos
function Component.UI.Animation.ClockAnimator:RotateToAngle(rotateType) end
function Component.UI.Animation.ClockAnimator:RotateToSelf() end
function Component.UI.Animation.ClockAnimator:RotateToFriend() end
function Component.UI.Animation.ClockAnimator:RotateToEnemy() end
function Component.UI.Animation.ClockAnimator:RotateToNeutral() end

---@class Component.UI.Animation.ClockAnimator.RotatePos
---@field Default Component.UI.Animation.ClockAnimator.RotatePos
---@field Self Component.UI.Animation.ClockAnimator.RotatePos
---@field Enemy Component.UI.Animation.ClockAnimator.RotatePos
---@field Friend Component.UI.Animation.ClockAnimator.RotatePos
---@field Neutral Component.UI.Animation.ClockAnimator.RotatePos
Component.UI.Animation.ClockAnimator.RotatePos = {}
---@alias CS.Component.UI.Animation.ClockAnimator.RotatePos Component.UI.Animation.ClockAnimator.RotatePos
CS.Component.UI.Animation.ClockAnimator.RotatePos = Component.UI.Animation.ClockAnimator.RotatePos


---@class Network.SupabaseUpload.SupabaseUploadAuthService : System.Object
Network.SupabaseUpload.SupabaseUploadAuthService = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadAuthService Network.SupabaseUpload.SupabaseUploadAuthService
CS.Network.SupabaseUpload.SupabaseUploadAuthService = Network.SupabaseUpload.SupabaseUploadAuthService

---@param purpose string
---@return Cysharp.Threading.Tasks.UniTask
function Network.SupabaseUpload.SupabaseUploadAuthService.GetVerifiedSupabaseClientAsync(purpose) end
---@return boolean
function Network.SupabaseUpload.SupabaseUploadAuthService.CanUpload() end
function Network.SupabaseUpload.SupabaseUploadAuthService.Invalidate() end
---@param exception System.Exception
---@return boolean
function Network.SupabaseUpload.SupabaseUploadAuthService.HandleAuthorizationFailure(exception) end
---@param exception System.Exception
---@return boolean
function Network.SupabaseUpload.SupabaseUploadAuthService.IsAuthorizationFailure(exception) end

---@class Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult : System.Object
---@field TicketHandle Steamworks.HAuthTicket
---@field TicketBytes System.Byte[]
Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult
CS.Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult = Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult

---@param ticketHandle Steamworks.HAuthTicket
---@param ticketBytes System.Byte[]
---@return Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult
function Network.SupabaseUpload.SupabaseUploadAuthService.SteamTicketResult.New(ticketHandle, ticketBytes) end

---@class Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession : System.Object
---@field UploadJwt string
---@field ExpiresAt string
---@field ExpiresAtUtc System.DateTimeOffset
Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession
CS.Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession = Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession

---@return Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession
function Network.SupabaseUpload.SupabaseUploadAuthService.VerifiedUploadSession.New() end

---@class Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider
Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider
CS.Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider = Network.SupabaseUpload.SupabaseUploadAuthService.IPostgrestTableProvider


---@class Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider : System.Object
Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider
CS.Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider = Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider

---@param supabaseUrl string
---@param supabasePublishableKey string
---@param uploadJwt string
---@return Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider
function Network.SupabaseUpload.SupabaseUploadAuthService.StatelessPostgrestTableProvider.New(supabaseUrl, supabasePublishableKey, uploadJwt) end

---@class Network.SupabaseUpload.SupabaseUploadConfig : System.Object
---@field SupabaseUrl string
---@field SupabasePublishableKey string
---@field SupabaseLegacyAnonJwt string
---@field VerifySteamUploadFunctionName string
---@field SteamTicketIdentity string
---@field UploadRole string
Network.SupabaseUpload.SupabaseUploadConfig = {}
---@alias CS.Network.SupabaseUpload.SupabaseUploadConfig Network.SupabaseUpload.SupabaseUploadConfig
CS.Network.SupabaseUpload.SupabaseUploadConfig = Network.SupabaseUpload.SupabaseUploadConfig

---@return System.Collections.Generic.Dictionary
function Network.SupabaseUpload.SupabaseUploadConfig.CreateFunctionHeaders() end
---@param accessToken string
---@return System.Collections.Generic.Dictionary
function Network.SupabaseUpload.SupabaseUploadConfig.CreatePostgrestHeaders(accessToken) end

---@class Network.Query.QueryBase : System.Object
---@field QueryId number
Network.Query.QueryBase = {}
---@alias CS.Network.Query.QueryBase Network.Query.QueryBase
CS.Network.Query.QueryBase = Network.Query.QueryBase

function Network.Query.QueryBase:CmdExecute() end
---@param response Network.Query.QueryBase
function Network.Query.QueryBase:OnResponse(response) end

---@class Network.Query.QueryBase : Network.Query.QueryBase
---@field Result T
---@field Callback System.Action[T]
Network.Query.QueryBase = {}
---@alias CS.Network.Query.QueryBase Network.Query.QueryBase
CS.Network.Query.QueryBase = Network.Query.QueryBase

---@param response Network.Query.QueryBase
function Network.Query.QueryBase:OnResponse(response) end

---@class Network.Query.QueryBaseSerializer : System.Object
Network.Query.QueryBaseSerializer = {}
---@alias CS.Network.Query.QueryBaseSerializer Network.Query.QueryBaseSerializer
CS.Network.Query.QueryBaseSerializer = Network.Query.QueryBaseSerializer

---@param writer Mirror.NetworkWriter
---@param value Network.Query.QueryBase
function Network.Query.QueryBaseSerializer.Write(writer, value) end
---@param reader Mirror.NetworkReader
---@return Network.Query.QueryBase
function Network.Query.QueryBaseSerializer.Read(reader) end

---@class Network.Query.QueryCareers : Network.Query.QueryBase
---@field Result Network.Query.QueryCareers -- infered from Network.Query.QueryBase`1[System.ValueTuple`2[System.String,DataConfig][]]
Network.Query.QueryCareers = {}
---@alias CS.Network.Query.QueryCareers Network.Query.QueryCareers
CS.Network.Query.QueryCareers = Network.Query.QueryCareers

---@return Network.Query.QueryCareers
function Network.Query.QueryCareers.New() end
function Network.Query.QueryCareers:CmdExecute() end

---@class Network.Query.QueryDeck : Network.Query.QueryBase
---@field instanceId string
---@field Result Network.Query.QueryDeck -- infered from Network.Query.QueryBase`1[Witch.UI.Window.OutDeckUIData]
Network.Query.QueryDeck = {}
---@alias CS.Network.Query.QueryDeck Network.Query.QueryDeck
CS.Network.Query.QueryDeck = Network.Query.QueryDeck

---@param instanceId string
---@return Network.Query.QueryDeck
function Network.Query.QueryDeck.New(instanceId) end
function Network.Query.QueryDeck:CmdExecute() end

---@class Network.Query.QueryFood : Network.Query.QueryBase
---@field Result Network.Query.QueryFood -- infered from Network.Query.QueryBase`1[System.Collections.Generic.List`1[DataConfig]]
Network.Query.QueryFood = {}
---@alias CS.Network.Query.QueryFood Network.Query.QueryFood
CS.Network.Query.QueryFood = Network.Query.QueryFood

---@return Network.Query.QueryFood
function Network.Query.QueryFood.New() end
function Network.Query.QueryFood:CmdExecute() end

---@class Network.Query.QueryRelic : Network.Query.QueryBase
---@field instanceId string
---@field Result Network.Query.QueryRelic -- infered from Network.Query.QueryBase`1[Witch.UI.Window.RelicData]
Network.Query.QueryRelic = {}
---@alias CS.Network.Query.QueryRelic Network.Query.QueryRelic
CS.Network.Query.QueryRelic = Network.Query.QueryRelic

---@param instanceId string
---@return Network.Query.QueryRelic
function Network.Query.QueryRelic.New(instanceId) end
function Network.Query.QueryRelic:CmdExecute() end

---@class Network.Query.QueryStatus : Network.Query.QueryBase
---@field instanceId string
---@field Result Network.Query.QueryStatus -- infered from Network.Query.QueryBase`1[Witch.UI.Window.StatusUIData]
Network.Query.QueryStatus = {}
---@alias CS.Network.Query.QueryStatus Network.Query.QueryStatus
CS.Network.Query.QueryStatus = Network.Query.QueryStatus

---@param instanceId string
---@return Network.Query.QueryStatus
function Network.Query.QueryStatus.New(instanceId) end
function Network.Query.QueryStatus:CmdExecute() end

---@class Network.Command.RpcCommandBase : System.Object
Network.Command.RpcCommandBase = {}
---@alias CS.Network.Command.RpcCommandBase Network.Command.RpcCommandBase
CS.Network.Command.RpcCommandBase = Network.Command.RpcCommandBase

---@return Network.Command.RpcCommandBase
function Network.Command.RpcCommandBase.New() end
function Network.Command.RpcCommandBase:CmdExecute() end
function Network.Command.RpcCommandBase:RpcExecute() end

---@class Network.Command.RpcCommandBaseSerializer : System.Object
Network.Command.RpcCommandBaseSerializer = {}
---@alias CS.Network.Command.RpcCommandBaseSerializer Network.Command.RpcCommandBaseSerializer
CS.Network.Command.RpcCommandBaseSerializer = Network.Command.RpcCommandBaseSerializer

---@param writer Mirror.NetworkWriter
---@param value Network.Command.RpcCommandBase
function Network.Command.RpcCommandBaseSerializer.Write(writer, value) end
---@param reader Mirror.NetworkReader
---@return Network.Command.RpcCommandBase
function Network.Command.RpcCommandBaseSerializer.Read(reader) end

---@class Network.Command.RpcEatFood : Network.Command.RpcCommandBase
---@field dataConfig DataConfig
---@field getId string
---@field isEat boolean
Network.Command.RpcEatFood = {}
---@alias CS.Network.Command.RpcEatFood Network.Command.RpcEatFood
CS.Network.Command.RpcEatFood = Network.Command.RpcEatFood

---@param dataConfig DataConfig
---@param getId string
---@return Network.Command.RpcEatFood
function Network.Command.RpcEatFood.New(dataConfig, getId) end
function Network.Command.RpcEatFood:CmdExecute() end
function Network.Command.RpcEatFood:RpcExecute() end

---@class Network.Command.RpcGetItem : Network.Command.RpcCommandBase
---@field itemType string
---@field dataConfig DataConfig
---@field getId string
---@field isGet boolean
Network.Command.RpcGetItem = {}
---@alias CS.Network.Command.RpcGetItem Network.Command.RpcGetItem
CS.Network.Command.RpcGetItem = Network.Command.RpcGetItem

---@param itemType string
---@param dataConfig DataConfig
---@param getId string
---@return Network.Command.RpcGetItem
function Network.Command.RpcGetItem.New(itemType, dataConfig, getId) end
function Network.Command.RpcGetItem:CmdExecute() end
function Network.Command.RpcGetItem:RpcExecute() end

---@class Network.Command.RpcSendChat : Network.Command.RpcCommandBase
---@field name string
---@field message string
Network.Command.RpcSendChat = {}
---@alias CS.Network.Command.RpcSendChat Network.Command.RpcSendChat
CS.Network.Command.RpcSendChat = Network.Command.RpcSendChat

---@param name string
---@param message string
---@return Network.Command.RpcSendChat
function Network.Command.RpcSendChat.New(name, message) end
function Network.Command.RpcSendChat:RpcExecute() end

---@class Network.Command.RpcSendEmoji : Network.Command.RpcCommandBase
---@field instanceid string
---@field emoji GifAsset
Network.Command.RpcSendEmoji = {}
---@alias CS.Network.Command.RpcSendEmoji Network.Command.RpcSendEmoji
CS.Network.Command.RpcSendEmoji = Network.Command.RpcSendEmoji

---@param instanceid string
---@param emoji GifAsset
---@return Network.Command.RpcSendEmoji
function Network.Command.RpcSendEmoji.New(instanceid, emoji) end
function Network.Command.RpcSendEmoji:RpcExecute() end

---@class Network.Command.RpcSendItem : Network.Command.RpcCommandBase
---@field dataConfig DataConfig
---@field itemType string
Network.Command.RpcSendItem = {}
---@alias CS.Network.Command.RpcSendItem Network.Command.RpcSendItem
CS.Network.Command.RpcSendItem = Network.Command.RpcSendItem

---@param itemType string
---@param dataConfig DataConfig
---@return Network.Command.RpcSendItem
function Network.Command.RpcSendItem.New(itemType, dataConfig) end
function Network.Command.RpcSendItem:CmdExecute() end
function Network.Command.RpcSendItem:RpcExecute() end

---@class Network.Command.RpcUpdateWareShow : Network.Command.RpcCommandBase
Network.Command.RpcUpdateWareShow = {}
---@alias CS.Network.Command.RpcUpdateWareShow Network.Command.RpcUpdateWareShow
CS.Network.Command.RpcUpdateWareShow = Network.Command.RpcUpdateWareShow

---@return Network.Command.RpcUpdateWareShow
function Network.Command.RpcUpdateWareShow.New() end
function Network.Command.RpcUpdateWareShow:RpcExecute() end

---@class Fight.StatusCommand.ClientCommandBase : System.Object
---@field Type string
---@field Value number
---@field InstanceId string
---@field From string
Fight.StatusCommand.ClientCommandBase = {}
---@alias CS.Fight.StatusCommand.ClientCommandBase Fight.StatusCommand.ClientCommandBase
CS.Fight.StatusCommand.ClientCommandBase = Fight.StatusCommand.ClientCommandBase

function Fight.StatusCommand.ClientCommandBase.RegisterFormatter() end
function Fight.StatusCommand.ClientCommandBase:Validate() end
---@param value number
---@param instanceId string
---@return Fight.StatusCommand.ClientCommandBase
function Fight.StatusCommand.ClientCommandBase:Create(value, instanceId) end
function Fight.StatusCommand.ClientCommandBase:Execute() end
---@param origin Fight.StatusCommand.ClientCommandBase
---@return Fight.StatusCommand.ClientCommandBase
function Fight.StatusCommand.ClientCommandBase:CopyFrom(origin) end

---@class Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter : MemoryPack.MemoryPackFormatter
Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter = {}
---@alias CS.Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter
CS.Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter = Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter

---@return Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter
function Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.ClientCommandBase
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.ClientCommandBase
function Fight.StatusCommand.ClientCommandBase.ClientCommandBaseFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.ClientCommandBaseReaderWriter : System.Object
Fight.StatusCommand.ClientCommandBaseReaderWriter = {}
---@alias CS.Fight.StatusCommand.ClientCommandBaseReaderWriter Fight.StatusCommand.ClientCommandBaseReaderWriter
CS.Fight.StatusCommand.ClientCommandBaseReaderWriter = Fight.StatusCommand.ClientCommandBaseReaderWriter

---@param writer Mirror.NetworkWriter
---@param command Fight.StatusCommand.ClientCommandBase
function Fight.StatusCommand.ClientCommandBaseReaderWriter.Write(writer, command) end
---@param reader Mirror.NetworkReader
---@return Fight.StatusCommand.ClientCommandBase
function Fight.StatusCommand.ClientCommandBaseReaderWriter.Read(reader) end

---@class Fight.StatusCommand.CurHp : Fight.StatusCommand.ClientCommandBase
Fight.StatusCommand.CurHp = {}
---@alias CS.Fight.StatusCommand.CurHp Fight.StatusCommand.CurHp
CS.Fight.StatusCommand.CurHp = Fight.StatusCommand.CurHp

---@return Fight.StatusCommand.CurHp
function Fight.StatusCommand.CurHp.New() end
function Fight.StatusCommand.CurHp.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.CurHp
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.CurHp
function Fight.StatusCommand.CurHp.Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.CurHp.CurHpFormatter : MemoryPack.MemoryPackFormatter
Fight.StatusCommand.CurHp.CurHpFormatter = {}
---@alias CS.Fight.StatusCommand.CurHp.CurHpFormatter Fight.StatusCommand.CurHp.CurHpFormatter
CS.Fight.StatusCommand.CurHp.CurHpFormatter = Fight.StatusCommand.CurHp.CurHpFormatter

---@return Fight.StatusCommand.CurHp.CurHpFormatter
function Fight.StatusCommand.CurHp.CurHpFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.CurHp
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.CurHp
function Fight.StatusCommand.CurHp.CurHpFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.Defend : Fight.StatusCommand.ClientCommandBase
Fight.StatusCommand.Defend = {}
---@alias CS.Fight.StatusCommand.Defend Fight.StatusCommand.Defend
CS.Fight.StatusCommand.Defend = Fight.StatusCommand.Defend

---@return Fight.StatusCommand.Defend
function Fight.StatusCommand.Defend.New() end
function Fight.StatusCommand.Defend.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.Defend
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.Defend
function Fight.StatusCommand.Defend.Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.Defend.DefendFormatter : MemoryPack.MemoryPackFormatter
Fight.StatusCommand.Defend.DefendFormatter = {}
---@alias CS.Fight.StatusCommand.Defend.DefendFormatter Fight.StatusCommand.Defend.DefendFormatter
CS.Fight.StatusCommand.Defend.DefendFormatter = Fight.StatusCommand.Defend.DefendFormatter

---@return Fight.StatusCommand.Defend.DefendFormatter
function Fight.StatusCommand.Defend.DefendFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.Defend
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.Defend
function Fight.StatusCommand.Defend.DefendFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.MaxHp : Fight.StatusCommand.ClientCommandBase
Fight.StatusCommand.MaxHp = {}
---@alias CS.Fight.StatusCommand.MaxHp Fight.StatusCommand.MaxHp
CS.Fight.StatusCommand.MaxHp = Fight.StatusCommand.MaxHp

---@return Fight.StatusCommand.MaxHp
function Fight.StatusCommand.MaxHp.New() end
function Fight.StatusCommand.MaxHp.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.MaxHp
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.MaxHp
function Fight.StatusCommand.MaxHp.Deserialize(ref_reader, ref_value) end

---@class Fight.StatusCommand.MaxHp.MaxHpFormatter : MemoryPack.MemoryPackFormatter
Fight.StatusCommand.MaxHp.MaxHpFormatter = {}
---@alias CS.Fight.StatusCommand.MaxHp.MaxHpFormatter Fight.StatusCommand.MaxHp.MaxHpFormatter
CS.Fight.StatusCommand.MaxHp.MaxHpFormatter = Fight.StatusCommand.MaxHp.MaxHpFormatter

---@return Fight.StatusCommand.MaxHp.MaxHpFormatter
function Fight.StatusCommand.MaxHp.MaxHpFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.StatusCommand.MaxHp
---@return ,MemoryPack.MemoryPackReader,Fight.StatusCommand.MaxHp
function Fight.StatusCommand.MaxHp.MaxHpFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ObjTarget.ObjTargetAction : Fight.ObjTarget.ObjTargetBase
Fight.ObjTarget.ObjTargetAction = {}
---@alias CS.Fight.ObjTarget.ObjTargetAction Fight.ObjTarget.ObjTargetAction
CS.Fight.ObjTarget.ObjTargetAction = Fight.ObjTarget.ObjTargetAction

---@return Fight.ObjTarget.ObjTargetAction
function Fight.ObjTarget.ObjTargetAction.New() end
function Fight.ObjTarget.ObjTargetAction.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ObjTarget.ObjTargetAction
---@return ,MemoryPack.MemoryPackReader,Fight.ObjTarget.ObjTargetAction
function Fight.ObjTarget.ObjTargetAction.Deserialize(ref_reader, ref_value) end

---@class Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter : MemoryPack.MemoryPackFormatter
Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter = {}
---@alias CS.Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter
CS.Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter = Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter

---@return Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter
function Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ObjTarget.ObjTargetAction
---@return ,MemoryPack.MemoryPackReader,Fight.ObjTarget.ObjTargetAction
function Fight.ObjTarget.ObjTargetAction.ObjTargetActionFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ObjTarget.ObjTargetBase : System.Object
---@field Type string
---@field FromDataConfigId string
---@field ToAction string
---@field theData System.Byte[]
---@field ThisVars System.String[]
---@field Value string
---@field InstanceId string
---@field SourceInstanceId string
---@field From string
Fight.ObjTarget.ObjTargetBase = {}
---@alias CS.Fight.ObjTarget.ObjTargetBase Fight.ObjTarget.ObjTargetBase
CS.Fight.ObjTarget.ObjTargetBase = Fight.ObjTarget.ObjTargetBase

---@param data System.Collections.Generic.IDictionary
---@return System.Byte[]
function Fight.ObjTarget.ObjTargetBase.SerializeConfigData(data) end
---@param data System.Byte[]
---@return System.Collections.Generic.Dictionary
function Fight.ObjTarget.ObjTargetBase.DeserializeConfigData(data) end
function Fight.ObjTarget.ObjTargetBase.RegisterFormatter() end
function Fight.ObjTarget.ObjTargetBase:Validate() end
---@param instanceId string
---@param sourceInstanceId string
---@param ObjAction string
---@param fromId string
---@param theData System.Byte[]
---@param Vars System.String[]
---@return Fight.ObjTarget.ObjTargetBase
function Fight.ObjTarget.ObjTargetBase:Create(instanceId, sourceInstanceId, ObjAction, fromId, theData, Vars) end
function Fight.ObjTarget.ObjTargetBase:Execute() end
---@param origin Fight.ObjTarget.ObjTargetBase
---@return Fight.ObjTarget.ObjTargetBase
function Fight.ObjTarget.ObjTargetBase:CopyFrom(origin) end

---@class Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter : MemoryPack.MemoryPackFormatter
Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter = {}
---@alias CS.Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter
CS.Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter = Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter

---@return Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter
function Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ObjTarget.ObjTargetBase
---@return ,MemoryPack.MemoryPackReader,Fight.ObjTarget.ObjTargetBase
function Fight.ObjTarget.ObjTargetBase.ObjTargetBaseFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ObjTarget.ObjTargetBaseReaderWriter : System.Object
Fight.ObjTarget.ObjTargetBaseReaderWriter = {}
---@alias CS.Fight.ObjTarget.ObjTargetBaseReaderWriter Fight.ObjTarget.ObjTargetBaseReaderWriter
CS.Fight.ObjTarget.ObjTargetBaseReaderWriter = Fight.ObjTarget.ObjTargetBaseReaderWriter

---@param writer Mirror.NetworkWriter
---@param command Fight.ObjTarget.ObjTargetBase
function Fight.ObjTarget.ObjTargetBaseReaderWriter.Write(writer, command) end
---@param reader Mirror.NetworkReader
---@return Fight.ObjTarget.ObjTargetBase
function Fight.ObjTarget.ObjTargetBaseReaderWriter.Read(reader) end

---@class Fight.ActionCommand.ActionAnimation : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.ActionAnimation = {}
---@alias CS.Fight.ActionCommand.ActionAnimation Fight.ActionCommand.ActionAnimation
CS.Fight.ActionCommand.ActionAnimation = Fight.ActionCommand.ActionAnimation

---@return Fight.ActionCommand.ActionAnimation
function Fight.ActionCommand.ActionAnimation.New() end
function Fight.ActionCommand.ActionAnimation.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ActionAnimation
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ActionAnimation
function Fight.ActionCommand.ActionAnimation.Deserialize(ref_reader, ref_value) end
---@param State Witch.UI.Window.FightUI.AnimationData
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ActionAnimation:Create(State) end

---@class Fight.ActionCommand.ActionAnimation.AnimationData : System.ValueType
---@field status System.String[]
---@field animationState IStatusManager.AnimatedState[]
---@field effectName string
Fight.ActionCommand.ActionAnimation.AnimationData = {}
---@alias CS.Fight.ActionCommand.ActionAnimation.AnimationData Fight.ActionCommand.ActionAnimation.AnimationData
CS.Fight.ActionCommand.ActionAnimation.AnimationData = Fight.ActionCommand.ActionAnimation.AnimationData

function Fight.ActionCommand.ActionAnimation.AnimationData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ActionAnimation.AnimationData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ActionAnimation.AnimationData
function Fight.ActionCommand.ActionAnimation.AnimationData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter = {}
---@alias CS.Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter
CS.Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter = Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter

---@return Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter
function Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ActionAnimation.AnimationData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ActionAnimation.AnimationData
function Fight.ActionCommand.ActionAnimation.AnimationData.AnimationDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter = {}
---@alias CS.Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter
CS.Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter = Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter

---@return Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter
function Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ActionAnimation
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ActionAnimation
function Fight.ActionCommand.ActionAnimation.ActionAnimationFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ActionCommandBase : System.Object
---@field Type string
---@field Value System.Byte[]
---@field From string
---@field Reliable boolean
Fight.ActionCommand.ActionCommandBase = {}
---@alias CS.Fight.ActionCommand.ActionCommandBase Fight.ActionCommand.ActionCommandBase
CS.Fight.ActionCommand.ActionCommandBase = Fight.ActionCommand.ActionCommandBase

function Fight.ActionCommand.ActionCommandBase.RegisterFormatter() end
function Fight.ActionCommand.ActionCommandBase:Execute() end
---@param origin Fight.ActionCommand.ActionCommandBase
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ActionCommandBase:CopyFrom(origin) end

---@class Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter = {}
---@alias CS.Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter
CS.Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter = Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter

---@return Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter
function Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ActionCommandBase
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ActionCommandBase.ActionCommandBaseFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DynamicVariableSync : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.DynamicVariableSync = {}
---@alias CS.Fight.ActionCommand.DynamicVariableSync Fight.ActionCommand.DynamicVariableSync
CS.Fight.ActionCommand.DynamicVariableSync = Fight.ActionCommand.DynamicVariableSync

---@return Fight.ActionCommand.DynamicVariableSync
function Fight.ActionCommand.DynamicVariableSync.New() end
function Fight.ActionCommand.DynamicVariableSync.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DynamicVariableSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DynamicVariableSync
function Fight.ActionCommand.DynamicVariableSync.Deserialize(ref_reader, ref_value) end
---@param instanceId string
---@param key string
---@param value number
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.DynamicVariableSync:Create(instanceId, key, value) end

---@class Fight.ActionCommand.DynamicVariableSync.DynamicVariableData : System.ValueType
---@field InstanceId string
---@field Key string
---@field Value number
Fight.ActionCommand.DynamicVariableSync.DynamicVariableData = {}
---@alias CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableData Fight.ActionCommand.DynamicVariableSync.DynamicVariableData
CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableData = Fight.ActionCommand.DynamicVariableSync.DynamicVariableData

function Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DynamicVariableSync.DynamicVariableData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DynamicVariableSync.DynamicVariableData
function Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter = {}
---@alias CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter
CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter = Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter

---@return Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter
function Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DynamicVariableSync.DynamicVariableData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DynamicVariableSync.DynamicVariableData
function Fight.ActionCommand.DynamicVariableSync.DynamicVariableData.DynamicVariableDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter = {}
---@alias CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter
CS.Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter = Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter

---@return Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter
function Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DynamicVariableSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DynamicVariableSync
function Fight.ActionCommand.DynamicVariableSync.DynamicVariableSyncFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageFilterSync : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.DamageFilterSync = {}
---@alias CS.Fight.ActionCommand.DamageFilterSync Fight.ActionCommand.DamageFilterSync
CS.Fight.ActionCommand.DamageFilterSync = Fight.ActionCommand.DamageFilterSync

---@return Fight.ActionCommand.DamageFilterSync
function Fight.ActionCommand.DamageFilterSync.New() end
function Fight.ActionCommand.DamageFilterSync.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageFilterSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageFilterSync
function Fight.ActionCommand.DamageFilterSync.Deserialize(ref_reader, ref_value) end
---@param instanceId string
---@param key string
---@param value number
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.DamageFilterSync:CreateSet(instanceId, key, value) end
---@param instanceId string
---@param key string
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.DamageFilterSync:CreateRemove(instanceId, key) end
---@param instanceId string
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.DamageFilterSync:CreateClear(instanceId) end

---@class Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
---@field Set Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
---@field Remove Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
---@field Clear Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
Fight.ActionCommand.DamageFilterSync.DamageFilterOperation = {}
---@alias CS.Fight.ActionCommand.DamageFilterSync.DamageFilterOperation Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
CS.Fight.ActionCommand.DamageFilterSync.DamageFilterOperation = Fight.ActionCommand.DamageFilterSync.DamageFilterOperation


---@class Fight.ActionCommand.DamageFilterSync.DamageFilterData : System.ValueType
---@field InstanceId string
---@field Key string
---@field Value number
---@field Operation Fight.ActionCommand.DamageFilterSync.DamageFilterOperation
Fight.ActionCommand.DamageFilterSync.DamageFilterData = {}
---@alias CS.Fight.ActionCommand.DamageFilterSync.DamageFilterData Fight.ActionCommand.DamageFilterSync.DamageFilterData
CS.Fight.ActionCommand.DamageFilterSync.DamageFilterData = Fight.ActionCommand.DamageFilterSync.DamageFilterData

function Fight.ActionCommand.DamageFilterSync.DamageFilterData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageFilterSync.DamageFilterData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageFilterSync.DamageFilterData
function Fight.ActionCommand.DamageFilterSync.DamageFilterData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter = {}
---@alias CS.Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter
CS.Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter = Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter

---@return Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter
function Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageFilterSync.DamageFilterData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageFilterSync.DamageFilterData
function Fight.ActionCommand.DamageFilterSync.DamageFilterData.DamageFilterDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter = {}
---@alias CS.Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter
CS.Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter = Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter

---@return Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter
function Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageFilterSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageFilterSync
function Fight.ActionCommand.DamageFilterSync.DamageFilterSyncFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ActionCommandBaseReaderWriter : System.Object
Fight.ActionCommand.ActionCommandBaseReaderWriter = {}
---@alias CS.Fight.ActionCommand.ActionCommandBaseReaderWriter Fight.ActionCommand.ActionCommandBaseReaderWriter
CS.Fight.ActionCommand.ActionCommandBaseReaderWriter = Fight.ActionCommand.ActionCommandBaseReaderWriter

---@param writer Mirror.NetworkWriter
---@param command Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ActionCommandBaseReaderWriter.Write(writer, command) end
---@param reader Mirror.NetworkReader
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ActionCommandBaseReaderWriter.Read(reader) end

---@class Fight.ActionCommand.ClearBuffVar : Fight.ActionCommand.ActionCommandBase
---@field Reliable boolean
Fight.ActionCommand.ClearBuffVar = {}
---@alias CS.Fight.ActionCommand.ClearBuffVar Fight.ActionCommand.ClearBuffVar
CS.Fight.ActionCommand.ClearBuffVar = Fight.ActionCommand.ClearBuffVar

---@return Fight.ActionCommand.ClearBuffVar
function Fight.ActionCommand.ClearBuffVar.New() end
function Fight.ActionCommand.ClearBuffVar.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ClearBuffVar
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ClearBuffVar
function Fight.ActionCommand.ClearBuffVar.Deserialize(ref_reader, ref_value) end
---@param Id string
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.ClearBuffVar:Create(Id) end

---@class Fight.ActionCommand.ClearBuffVar.ClearBuffData : System.ValueType
---@field TotalId string
Fight.ActionCommand.ClearBuffVar.ClearBuffData = {}
---@alias CS.Fight.ActionCommand.ClearBuffVar.ClearBuffData Fight.ActionCommand.ClearBuffVar.ClearBuffData
CS.Fight.ActionCommand.ClearBuffVar.ClearBuffData = Fight.ActionCommand.ClearBuffVar.ClearBuffData

function Fight.ActionCommand.ClearBuffVar.ClearBuffData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ClearBuffVar.ClearBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ClearBuffVar.ClearBuffData
function Fight.ActionCommand.ClearBuffVar.ClearBuffData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter = {}
---@alias CS.Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter
CS.Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter = Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter

---@return Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter
function Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ClearBuffVar.ClearBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ClearBuffVar.ClearBuffData
function Fight.ActionCommand.ClearBuffVar.ClearBuffData.ClearBuffDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter = {}
---@alias CS.Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter
CS.Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter = Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter

---@return Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter
function Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.ClearBuffVar
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.ClearBuffVar
function Fight.ActionCommand.ClearBuffVar.ClearBuffVarFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageText : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.DamageText = {}
---@alias CS.Fight.ActionCommand.DamageText Fight.ActionCommand.DamageText
CS.Fight.ActionCommand.DamageText = Fight.ActionCommand.DamageText

---@return Fight.ActionCommand.DamageText
function Fight.ActionCommand.DamageText.New() end
function Fight.ActionCommand.DamageText.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageText
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageText
function Fight.ActionCommand.DamageText.Deserialize(ref_reader, ref_value) end
---@param value Fight.ActionCommand.DamageText.DamageTextData
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.DamageText:Create(value) end

---@class Fight.ActionCommand.DamageText.DamageTextData : System.ValueType
---@field from string
---@field to string
---@field hit number
---@field originalVal number
---@field x number
---@field y number
---@field damageType string
Fight.ActionCommand.DamageText.DamageTextData = {}
---@alias CS.Fight.ActionCommand.DamageText.DamageTextData Fight.ActionCommand.DamageText.DamageTextData
CS.Fight.ActionCommand.DamageText.DamageTextData = Fight.ActionCommand.DamageText.DamageTextData

function Fight.ActionCommand.DamageText.DamageTextData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageText.DamageTextData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageText.DamageTextData
function Fight.ActionCommand.DamageText.DamageTextData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter = {}
---@alias CS.Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter
CS.Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter = Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter

---@return Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter
function Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageText.DamageTextData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageText.DamageTextData
function Fight.ActionCommand.DamageText.DamageTextData.DamageTextDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.DamageText.DamageTextFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.DamageText.DamageTextFormatter = {}
---@alias CS.Fight.ActionCommand.DamageText.DamageTextFormatter Fight.ActionCommand.DamageText.DamageTextFormatter
CS.Fight.ActionCommand.DamageText.DamageTextFormatter = Fight.ActionCommand.DamageText.DamageTextFormatter

---@return Fight.ActionCommand.DamageText.DamageTextFormatter
function Fight.ActionCommand.DamageText.DamageTextFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.DamageText
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.DamageText
function Fight.ActionCommand.DamageText.DamageTextFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Effect : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.Effect = {}
---@alias CS.Fight.ActionCommand.Effect Fight.ActionCommand.Effect
CS.Fight.ActionCommand.Effect = Fight.ActionCommand.Effect

---@return Fight.ActionCommand.Effect
function Fight.ActionCommand.Effect.New() end
function Fight.ActionCommand.Effect.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Effect
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Effect
function Fight.ActionCommand.Effect.Deserialize(ref_reader, ref_value) end
---@param value Fight.ActionCommand.Effect.EffectData
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.Effect:Create(value) end

---@class Fight.ActionCommand.Effect.EffectData : System.ValueType
---@field effectName string
---@field Self string
---@field Object System.Collections.Generic.List
Fight.ActionCommand.Effect.EffectData = {}
---@alias CS.Fight.ActionCommand.Effect.EffectData Fight.ActionCommand.Effect.EffectData
CS.Fight.ActionCommand.Effect.EffectData = Fight.ActionCommand.Effect.EffectData

function Fight.ActionCommand.Effect.EffectData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Effect.EffectData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Effect.EffectData
function Fight.ActionCommand.Effect.EffectData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Effect.EffectData.EffectDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.Effect.EffectData.EffectDataFormatter = {}
---@alias CS.Fight.ActionCommand.Effect.EffectData.EffectDataFormatter Fight.ActionCommand.Effect.EffectData.EffectDataFormatter
CS.Fight.ActionCommand.Effect.EffectData.EffectDataFormatter = Fight.ActionCommand.Effect.EffectData.EffectDataFormatter

---@return Fight.ActionCommand.Effect.EffectData.EffectDataFormatter
function Fight.ActionCommand.Effect.EffectData.EffectDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Effect.EffectData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Effect.EffectData
function Fight.ActionCommand.Effect.EffectData.EffectDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Effect.EffectFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.Effect.EffectFormatter = {}
---@alias CS.Fight.ActionCommand.Effect.EffectFormatter Fight.ActionCommand.Effect.EffectFormatter
CS.Fight.ActionCommand.Effect.EffectFormatter = Fight.ActionCommand.Effect.EffectFormatter

---@return Fight.ActionCommand.Effect.EffectFormatter
function Fight.ActionCommand.Effect.EffectFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Effect
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Effect
function Fight.ActionCommand.Effect.EffectFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.EventTriggerSync : Fight.ActionCommand.ActionCommandBase
---@field Reliable boolean
Fight.ActionCommand.EventTriggerSync = {}
---@alias CS.Fight.ActionCommand.EventTriggerSync Fight.ActionCommand.EventTriggerSync
CS.Fight.ActionCommand.EventTriggerSync = Fight.ActionCommand.EventTriggerSync

---@return Fight.ActionCommand.EventTriggerSync
function Fight.ActionCommand.EventTriggerSync.New() end
function Fight.ActionCommand.EventTriggerSync.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.EventTriggerSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.EventTriggerSync
function Fight.ActionCommand.EventTriggerSync.Deserialize(ref_reader, ref_value) end
---@overload fun(self: Fight.ActionCommand.EventTriggerSync, eventName: string) : Fight.ActionCommand.EventTriggerSync
---@param eventName string
---@param param ISourceData
---@return Fight.ActionCommand.EventTriggerSync
function Fight.ActionCommand.EventTriggerSync:Create(eventName, param) end

---@class Fight.ActionCommand.EventTriggerSync.EventTriggerData : System.ValueType
---@field EventName string
---@field ParamTypeName string
---@field ParamBytes System.Byte[]
Fight.ActionCommand.EventTriggerSync.EventTriggerData = {}
---@alias CS.Fight.ActionCommand.EventTriggerSync.EventTriggerData Fight.ActionCommand.EventTriggerSync.EventTriggerData
CS.Fight.ActionCommand.EventTriggerSync.EventTriggerData = Fight.ActionCommand.EventTriggerSync.EventTriggerData

function Fight.ActionCommand.EventTriggerSync.EventTriggerData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.EventTriggerSync.EventTriggerData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.EventTriggerSync.EventTriggerData
function Fight.ActionCommand.EventTriggerSync.EventTriggerData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter = {}
---@alias CS.Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter
CS.Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter = Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter

---@return Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter
function Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.EventTriggerSync.EventTriggerData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.EventTriggerSync.EventTriggerData
function Fight.ActionCommand.EventTriggerSync.EventTriggerData.EventTriggerDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter = {}
---@alias CS.Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter
CS.Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter = Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter

---@return Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter
function Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.EventTriggerSync
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.EventTriggerSync
function Fight.ActionCommand.EventTriggerSync.EventTriggerSyncFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.RemoveBuff : Fight.ActionCommand.ActionCommandBase
---@field Reliable boolean
Fight.ActionCommand.RemoveBuff = {}
---@alias CS.Fight.ActionCommand.RemoveBuff Fight.ActionCommand.RemoveBuff
CS.Fight.ActionCommand.RemoveBuff = Fight.ActionCommand.RemoveBuff

---@return Fight.ActionCommand.RemoveBuff
function Fight.ActionCommand.RemoveBuff.New() end
function Fight.ActionCommand.RemoveBuff.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.RemoveBuff
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.RemoveBuff
function Fight.ActionCommand.RemoveBuff.Deserialize(ref_reader, ref_value) end
---@param buffItemConfig BuffItemConfig
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.RemoveBuff:Create(buffItemConfig) end

---@class Fight.ActionCommand.RemoveBuff.RemoveBuffData : System.ValueType
---@field InstanceId string
---@field BuffId string
Fight.ActionCommand.RemoveBuff.RemoveBuffData = {}
---@alias CS.Fight.ActionCommand.RemoveBuff.RemoveBuffData Fight.ActionCommand.RemoveBuff.RemoveBuffData
CS.Fight.ActionCommand.RemoveBuff.RemoveBuffData = Fight.ActionCommand.RemoveBuff.RemoveBuffData

function Fight.ActionCommand.RemoveBuff.RemoveBuffData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.RemoveBuff.RemoveBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.RemoveBuff.RemoveBuffData
function Fight.ActionCommand.RemoveBuff.RemoveBuffData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter = {}
---@alias CS.Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter
CS.Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter = Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter

---@return Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter
function Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.RemoveBuff.RemoveBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.RemoveBuff.RemoveBuffData
function Fight.ActionCommand.RemoveBuff.RemoveBuffData.RemoveBuffDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter = {}
---@alias CS.Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter
CS.Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter = Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter

---@return Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter
function Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.RemoveBuff
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.RemoveBuff
function Fight.ActionCommand.RemoveBuff.RemoveBuffFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.State : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.State = {}
---@alias CS.Fight.ActionCommand.State Fight.ActionCommand.State
CS.Fight.ActionCommand.State = Fight.ActionCommand.State

---@return Fight.ActionCommand.State
function Fight.ActionCommand.State.New() end
function Fight.ActionCommand.State.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.State
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.State
function Fight.ActionCommand.State.Deserialize(ref_reader, ref_value) end
---@param InstanceId string
---@param State IStatusManager.State
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.State:Create(InstanceId, State) end

---@class Fight.ActionCommand.State.StateData : System.ValueType
---@field To string
---@field Value string
Fight.ActionCommand.State.StateData = {}
---@alias CS.Fight.ActionCommand.State.StateData Fight.ActionCommand.State.StateData
CS.Fight.ActionCommand.State.StateData = Fight.ActionCommand.State.StateData

function Fight.ActionCommand.State.StateData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.State.StateData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.State.StateData
function Fight.ActionCommand.State.StateData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.State.StateData.StateDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.State.StateData.StateDataFormatter = {}
---@alias CS.Fight.ActionCommand.State.StateData.StateDataFormatter Fight.ActionCommand.State.StateData.StateDataFormatter
CS.Fight.ActionCommand.State.StateData.StateDataFormatter = Fight.ActionCommand.State.StateData.StateDataFormatter

---@return Fight.ActionCommand.State.StateData.StateDataFormatter
function Fight.ActionCommand.State.StateData.StateDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.State.StateData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.State.StateData
function Fight.ActionCommand.State.StateData.StateDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.State.StateFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.State.StateFormatter = {}
---@alias CS.Fight.ActionCommand.State.StateFormatter Fight.ActionCommand.State.StateFormatter
CS.Fight.ActionCommand.State.StateFormatter = Fight.ActionCommand.State.StateFormatter

---@return Fight.ActionCommand.State.StateFormatter
function Fight.ActionCommand.State.StateFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.State
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.State
function Fight.ActionCommand.State.StateFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UpdateBuff : Fight.ActionCommand.ActionCommandBase
---@field Reliable boolean
Fight.ActionCommand.UpdateBuff = {}
---@alias CS.Fight.ActionCommand.UpdateBuff Fight.ActionCommand.UpdateBuff
CS.Fight.ActionCommand.UpdateBuff = Fight.ActionCommand.UpdateBuff

---@return Fight.ActionCommand.UpdateBuff
function Fight.ActionCommand.UpdateBuff.New() end
function Fight.ActionCommand.UpdateBuff.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UpdateBuff
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UpdateBuff
function Fight.ActionCommand.UpdateBuff.Deserialize(ref_reader, ref_value) end
---@param buffItemConfig BuffItemConfig
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.UpdateBuff:Create(buffItemConfig) end

---@class Fight.ActionCommand.UpdateBuff.UpdateBuffData : System.ValueType
---@field InstanceId string
---@field Level number
---@field BuffId string
Fight.ActionCommand.UpdateBuff.UpdateBuffData = {}
---@alias CS.Fight.ActionCommand.UpdateBuff.UpdateBuffData Fight.ActionCommand.UpdateBuff.UpdateBuffData
CS.Fight.ActionCommand.UpdateBuff.UpdateBuffData = Fight.ActionCommand.UpdateBuff.UpdateBuffData

function Fight.ActionCommand.UpdateBuff.UpdateBuffData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UpdateBuff.UpdateBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UpdateBuff.UpdateBuffData
function Fight.ActionCommand.UpdateBuff.UpdateBuffData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter = {}
---@alias CS.Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter
CS.Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter = Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter

---@return Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter
function Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UpdateBuff.UpdateBuffData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UpdateBuff.UpdateBuffData
function Fight.ActionCommand.UpdateBuff.UpdateBuffData.UpdateBuffDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter = {}
---@alias CS.Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter
CS.Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter = Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter

---@return Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter
function Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UpdateBuff
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UpdateBuff
function Fight.ActionCommand.UpdateBuff.UpdateBuffFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UseCard : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.UseCard = {}
---@alias CS.Fight.ActionCommand.UseCard Fight.ActionCommand.UseCard
CS.Fight.ActionCommand.UseCard = Fight.ActionCommand.UseCard

---@return Fight.ActionCommand.UseCard
function Fight.ActionCommand.UseCard.New() end
function Fight.ActionCommand.UseCard.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UseCard
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UseCard
function Fight.ActionCommand.UseCard.Deserialize(ref_reader, ref_value) end
---@param cardData Fight.ActionCommand.UseCard.CardUseData
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.UseCard:Create(cardData) end

---@class Fight.ActionCommand.UseCard.CardUseData : System.ValueType
---@field cardData DataConfig
---@field isBurning boolean
Fight.ActionCommand.UseCard.CardUseData = {}
---@alias CS.Fight.ActionCommand.UseCard.CardUseData Fight.ActionCommand.UseCard.CardUseData
CS.Fight.ActionCommand.UseCard.CardUseData = Fight.ActionCommand.UseCard.CardUseData

function Fight.ActionCommand.UseCard.CardUseData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UseCard.CardUseData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UseCard.CardUseData
function Fight.ActionCommand.UseCard.CardUseData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter = {}
---@alias CS.Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter
CS.Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter = Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter

---@return Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter
function Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UseCard.CardUseData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UseCard.CardUseData
function Fight.ActionCommand.UseCard.CardUseData.CardUseDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.UseCard.UseCardFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.UseCard.UseCardFormatter = {}
---@alias CS.Fight.ActionCommand.UseCard.UseCardFormatter Fight.ActionCommand.UseCard.UseCardFormatter
CS.Fight.ActionCommand.UseCard.UseCardFormatter = Fight.ActionCommand.UseCard.UseCardFormatter

---@return Fight.ActionCommand.UseCard.UseCardFormatter
function Fight.ActionCommand.UseCard.UseCardFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.UseCard
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.UseCard
function Fight.ActionCommand.UseCard.UseCardFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Vocal : Fight.ActionCommand.ActionCommandBase
Fight.ActionCommand.Vocal = {}
---@alias CS.Fight.ActionCommand.Vocal Fight.ActionCommand.Vocal
CS.Fight.ActionCommand.Vocal = Fight.ActionCommand.Vocal

---@return Fight.ActionCommand.Vocal
function Fight.ActionCommand.Vocal.New() end
function Fight.ActionCommand.Vocal.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Vocal
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Vocal
function Fight.ActionCommand.Vocal.Deserialize(ref_reader, ref_value) end
---@param instanceId string
---@param state IStatusManager.VocalState
---@return Fight.ActionCommand.ActionCommandBase
function Fight.ActionCommand.Vocal:Create(instanceId, state) end

---@class Fight.ActionCommand.Vocal.VocalData : System.ValueType
---@field To string
---@field State number
Fight.ActionCommand.Vocal.VocalData = {}
---@alias CS.Fight.ActionCommand.Vocal.VocalData Fight.ActionCommand.Vocal.VocalData
CS.Fight.ActionCommand.Vocal.VocalData = Fight.ActionCommand.Vocal.VocalData

function Fight.ActionCommand.Vocal.VocalData.RegisterFormatter() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Vocal.VocalData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Vocal.VocalData
function Fight.ActionCommand.Vocal.VocalData.Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter = {}
---@alias CS.Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter
CS.Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter = Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter

---@return Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter
function Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Vocal.VocalData
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Vocal.VocalData
function Fight.ActionCommand.Vocal.VocalData.VocalDataFormatter:Deserialize(ref_reader, ref_value) end

---@class Fight.ActionCommand.Vocal.VocalFormatter : MemoryPack.MemoryPackFormatter
Fight.ActionCommand.Vocal.VocalFormatter = {}
---@alias CS.Fight.ActionCommand.Vocal.VocalFormatter Fight.ActionCommand.Vocal.VocalFormatter
CS.Fight.ActionCommand.Vocal.VocalFormatter = Fight.ActionCommand.Vocal.VocalFormatter

---@return Fight.ActionCommand.Vocal.VocalFormatter
function Fight.ActionCommand.Vocal.VocalFormatter.New() end
---@param ref_reader MemoryPack.MemoryPackReader
---@param ref_value Fight.ActionCommand.Vocal
---@return ,MemoryPack.MemoryPackReader,Fight.ActionCommand.Vocal
function Fight.ActionCommand.Vocal.VocalFormatter:Deserialize(ref_reader, ref_value) end

---@class DataEditor.CardEditor.EffectName : System.Attribute
---@field text string
DataEditor.CardEditor.EffectName = {}
---@alias CS.DataEditor.CardEditor.EffectName DataEditor.CardEditor.EffectName
CS.DataEditor.CardEditor.EffectName = DataEditor.CardEditor.EffectName

---@param name string
---@return DataEditor.CardEditor.EffectName
function DataEditor.CardEditor.EffectName.New(name) end

---@class DataEditor.CardEditor.EffectDes : System.Attribute
---@field text string
DataEditor.CardEditor.EffectDes = {}
---@alias CS.DataEditor.CardEditor.EffectDes DataEditor.CardEditor.EffectDes
CS.DataEditor.CardEditor.EffectDes = DataEditor.CardEditor.EffectDes

---@param des string
---@return DataEditor.CardEditor.EffectDes
function DataEditor.CardEditor.EffectDes.New(des) end

---@class DataEditor.CardEditor.EffectLimit : System.Attribute
---@field limit number
DataEditor.CardEditor.EffectLimit = {}
---@alias CS.DataEditor.CardEditor.EffectLimit DataEditor.CardEditor.EffectLimit
CS.DataEditor.CardEditor.EffectLimit = DataEditor.CardEditor.EffectLimit

---@param limit number
---@return DataEditor.CardEditor.EffectLimit
function DataEditor.CardEditor.EffectLimit.New(limit) end

---@class DataEditor.CardEditor.EffectTarget : System.Attribute
---@field weight number
DataEditor.CardEditor.EffectTarget = {}
---@alias CS.DataEditor.CardEditor.EffectTarget DataEditor.CardEditor.EffectTarget
CS.DataEditor.CardEditor.EffectTarget = DataEditor.CardEditor.EffectTarget

---@param target number
---@return DataEditor.CardEditor.EffectTarget
function DataEditor.CardEditor.EffectTarget.New(target) end

---@class DataEditor.CardEditor.EffectCardDes : System.Attribute
---@field text string
DataEditor.CardEditor.EffectCardDes = {}
---@alias CS.DataEditor.CardEditor.EffectCardDes DataEditor.CardEditor.EffectCardDes
CS.DataEditor.CardEditor.EffectCardDes = DataEditor.CardEditor.EffectCardDes

---@param des string
---@return DataEditor.CardEditor.EffectCardDes
function DataEditor.CardEditor.EffectCardDes.New(des) end

---@class DataEditor.CardEditor.AddDesVal : System.Attribute
---@field text string
DataEditor.CardEditor.AddDesVal = {}
---@alias CS.DataEditor.CardEditor.AddDesVal DataEditor.CardEditor.AddDesVal
CS.DataEditor.CardEditor.AddDesVal = DataEditor.CardEditor.AddDesVal

---@param des string
---@return DataEditor.CardEditor.AddDesVal
function DataEditor.CardEditor.AddDesVal.New(des) end

---@class DataEditor.CardEditor.ScriptData : System.Object
---@field Id string
---@field Name string
DataEditor.CardEditor.ScriptData = {}
---@alias CS.DataEditor.CardEditor.ScriptData DataEditor.CardEditor.ScriptData
CS.DataEditor.CardEditor.ScriptData = DataEditor.CardEditor.ScriptData

---@return DataEditor.CardEditor.ScriptData
function DataEditor.CardEditor.ScriptData.New() end
---@return System.Collections.Generic.List
function DataEditor.CardEditor.ScriptData.GetValues() end

---@class DataEditor.CardEditor.BuffData : DataEditor.CardEditor.ScriptData
DataEditor.CardEditor.BuffData = {}
---@alias CS.DataEditor.CardEditor.BuffData DataEditor.CardEditor.BuffData
CS.DataEditor.CardEditor.BuffData = DataEditor.CardEditor.BuffData

---@return DataEditor.CardEditor.BuffData
function DataEditor.CardEditor.BuffData.New() end
---@return System.Collections.Generic.List
function DataEditor.CardEditor.BuffData.GetValues() end

---@class DataEditor.CardEditor.CardEditorBase : System.Object
DataEditor.CardEditor.CardEditorBase = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase DataEditor.CardEditor.CardEditorBase
CS.DataEditor.CardEditor.CardEditorBase = DataEditor.CardEditor.CardEditorBase

---@return DataEditor.CardEditor.CardEditorBase
function DataEditor.CardEditor.CardEditorBase.New() end
---@param type DataEditor.CardEditor.CardEditorBase.CardTypeDes
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.SetCardType(type) end
---@param type DataEditor.CardEditor.CardEditorBase.TimeType
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.GetTime(type) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.Change(val) end
---@param val number
---@param damagetype DataEditor.CardEditor.CardEditorBase.DamageTypeDes
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.Damage(val, damagetype) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ChangePower(val) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.DrawCount(val) end
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ChangeRound() end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ThrowCard(val) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.BurnCard(val) end
---@param data DataEditor.CardEditor.BuffData
---@param level number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.AddBuff(data, level) end
---@param data DataEditor.CardEditor.BuffData
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.RemoveBuff(data) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ChangeHp(val) end
---@param val number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ChangeMaxHp(val) end
---@param count number
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.AddCardByCardList(count) end
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.ShuffleDeck() end
---@param filter DataEditor.CardEditor.CardEditorBase.TargetTypeDes
---@return System.ValueTuple
function DataEditor.CardEditor.CardEditorBase.SetStatus(filter) end

---@class DataEditor.CardEditor.CardEditorBase.CardType
---@field AttackCardItem DataEditor.CardEditor.CardEditorBase.CardType
---@field CommonCardItem DataEditor.CardEditor.CardEditorBase.CardType
DataEditor.CardEditor.CardEditorBase.CardType = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.CardType DataEditor.CardEditor.CardEditorBase.CardType
CS.DataEditor.CardEditor.CardEditorBase.CardType = DataEditor.CardEditor.CardEditorBase.CardType


---@class DataEditor.CardEditor.CardEditorBase.CardTypeDes
---@field 选中目标 DataEditor.CardEditor.CardEditorBase.CardTypeDes
---@field 非选目标 DataEditor.CardEditor.CardEditorBase.CardTypeDes
DataEditor.CardEditor.CardEditorBase.CardTypeDes = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.CardTypeDes DataEditor.CardEditor.CardEditorBase.CardTypeDes
CS.DataEditor.CardEditor.CardEditorBase.CardTypeDes = DataEditor.CardEditor.CardEditorBase.CardTypeDes


---@class DataEditor.CardEditor.CardEditorBase.ValueSelect
---@field DesVal1 DataEditor.CardEditor.CardEditorBase.ValueSelect
---@field DesVal2 DataEditor.CardEditor.CardEditorBase.ValueSelect
---@field DesVal3 DataEditor.CardEditor.CardEditorBase.ValueSelect
---@field DesVal4 DataEditor.CardEditor.CardEditorBase.ValueSelect
DataEditor.CardEditor.CardEditorBase.ValueSelect = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.ValueSelect DataEditor.CardEditor.CardEditorBase.ValueSelect
CS.DataEditor.CardEditor.CardEditorBase.ValueSelect = DataEditor.CardEditor.CardEditorBase.ValueSelect


---@class DataEditor.CardEditor.CardEditorBase.ValueSelectDes
---@field 数值1 DataEditor.CardEditor.CardEditorBase.ValueSelectDes
---@field 数值2 DataEditor.CardEditor.CardEditorBase.ValueSelectDes
---@field 数值3 DataEditor.CardEditor.CardEditorBase.ValueSelectDes
---@field 数值4 DataEditor.CardEditor.CardEditorBase.ValueSelectDes
DataEditor.CardEditor.CardEditorBase.ValueSelectDes = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.ValueSelectDes DataEditor.CardEditor.CardEditorBase.ValueSelectDes
CS.DataEditor.CardEditor.CardEditorBase.ValueSelectDes = DataEditor.CardEditor.CardEditorBase.ValueSelectDes


---@class DataEditor.CardEditor.CardEditorBase.TimeType
---@field 抽到时 DataEditor.CardEditor.CardEditorBase.TimeType
---@field 使用时 DataEditor.CardEditor.CardEditorBase.TimeType
---@field 丢弃时 DataEditor.CardEditor.CardEditorBase.TimeType
DataEditor.CardEditor.CardEditorBase.TimeType = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.TimeType DataEditor.CardEditor.CardEditorBase.TimeType
CS.DataEditor.CardEditor.CardEditorBase.TimeType = DataEditor.CardEditor.CardEditorBase.TimeType


---@class DataEditor.CardEditor.CardEditorBase.TargetType
---@field Self DataEditor.CardEditor.CardEditorBase.TargetType
---@field Target DataEditor.CardEditor.CardEditorBase.TargetType
---@field All DataEditor.CardEditor.CardEditorBase.TargetType
---@field AllTarget DataEditor.CardEditor.CardEditorBase.TargetType
DataEditor.CardEditor.CardEditorBase.TargetType = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.TargetType DataEditor.CardEditor.CardEditorBase.TargetType
CS.DataEditor.CardEditor.CardEditorBase.TargetType = DataEditor.CardEditor.CardEditorBase.TargetType


---@class DataEditor.CardEditor.CardEditorBase.TargetTypeDes
---@field 自己 DataEditor.CardEditor.CardEditorBase.TargetTypeDes
---@field 目标 DataEditor.CardEditor.CardEditorBase.TargetTypeDes
---@field 所有 DataEditor.CardEditor.CardEditorBase.TargetTypeDes
---@field 所有敌人 DataEditor.CardEditor.CardEditorBase.TargetTypeDes
DataEditor.CardEditor.CardEditorBase.TargetTypeDes = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.TargetTypeDes DataEditor.CardEditor.CardEditorBase.TargetTypeDes
CS.DataEditor.CardEditor.CardEditorBase.TargetTypeDes = DataEditor.CardEditor.CardEditorBase.TargetTypeDes


---@class DataEditor.CardEditor.CardEditorBase.DamageType
---@field Normal DataEditor.CardEditor.CardEditorBase.DamageType
---@field True DataEditor.CardEditor.CardEditorBase.DamageType
DataEditor.CardEditor.CardEditorBase.DamageType = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.DamageType DataEditor.CardEditor.CardEditorBase.DamageType
CS.DataEditor.CardEditor.CardEditorBase.DamageType = DataEditor.CardEditor.CardEditorBase.DamageType


---@class DataEditor.CardEditor.CardEditorBase.DamageTypeDes
---@field 普通 DataEditor.CardEditor.CardEditorBase.DamageTypeDes
---@field 真实 DataEditor.CardEditor.CardEditorBase.DamageTypeDes
DataEditor.CardEditor.CardEditorBase.DamageTypeDes = {}
---@alias CS.DataEditor.CardEditor.CardEditorBase.DamageTypeDes DataEditor.CardEditor.CardEditorBase.DamageTypeDes
CS.DataEditor.CardEditor.CardEditorBase.DamageTypeDes = DataEditor.CardEditor.CardEditorBase.DamageTypeDes


---@class Data.Save.GameOperInfo : System.Object
---@field PlayerId string
---@field HardTags Data.Save.GameOperInfo.ItemsInfo
---@field Cards Data.Save.GameOperInfo.ItemsInfo
---@field Relics Data.Save.GameOperInfo.ItemsInfo
---@field Blessings Data.Save.GameOperInfo.ItemsInfo
Data.Save.GameOperInfo = {}
---@alias CS.Data.Save.GameOperInfo Data.Save.GameOperInfo
CS.Data.Save.GameOperInfo = Data.Save.GameOperInfo

---@return Data.Save.GameOperInfo
function Data.Save.GameOperInfo.New() end

---@class Data.Save.GameOperInfo.ItemsInfo : System.Object
---@field RewardShow System.Collections.Generic.List
---@field Select System.Collections.Generic.List
---@field Delete System.Collections.Generic.List
---@field ShopShow System.Collections.Generic.List
---@field Buy System.Collections.Generic.List
Data.Save.GameOperInfo.ItemsInfo = {}
---@alias CS.Data.Save.GameOperInfo.ItemsInfo Data.Save.GameOperInfo.ItemsInfo
CS.Data.Save.GameOperInfo.ItemsInfo = Data.Save.GameOperInfo.ItemsInfo

---@return Data.Save.GameOperInfo.ItemsInfo
function Data.Save.GameOperInfo.ItemsInfo.New() end

---@class Data.Save.GameOperInfo.ItemsInfo.Info : System.Object
---@field Name string
---@field Level string
Data.Save.GameOperInfo.ItemsInfo.Info = {}
---@alias CS.Data.Save.GameOperInfo.ItemsInfo.Info Data.Save.GameOperInfo.ItemsInfo.Info
CS.Data.Save.GameOperInfo.ItemsInfo.Info = Data.Save.GameOperInfo.ItemsInfo.Info

---@overload fun() : Data.Save.GameOperInfo.ItemsInfo.Info
---@param name string
---@return Data.Save.GameOperInfo.ItemsInfo.Info
function Data.Save.GameOperInfo.ItemsInfo.Info.New(name) end

---@class Data.Save.OperType
---@field RewardShow Data.Save.OperType
---@field ShopShow Data.Save.OperType
---@field Select Data.Save.OperType
---@field Buy Data.Save.OperType
---@field Delete Data.Save.OperType
Data.Save.OperType = {}
---@alias CS.Data.Save.OperType Data.Save.OperType
CS.Data.Save.OperType = Data.Save.OperType


---@class Data.Save.OperObj
---@field Cards Data.Save.OperObj
---@field Relics Data.Save.OperObj
---@field Blessings Data.Save.OperObj
---@field HardTags Data.Save.OperObj
Data.Save.OperObj = {}
---@alias CS.Data.Save.OperObj Data.Save.OperObj
CS.Data.Save.OperObj = Data.Save.OperObj


---@class Data.Save.GameSaveAnalyser : System.Object
---@field Instance Data.Save.GameSaveAnalyser
---@field ItemInfos Data.Save.GameOperInfo
Data.Save.GameSaveAnalyser = {}
---@alias CS.Data.Save.GameSaveAnalyser Data.Save.GameSaveAnalyser
CS.Data.Save.GameSaveAnalyser = Data.Save.GameSaveAnalyser

---@return Data.Save.GameSaveAnalyser
function Data.Save.GameSaveAnalyser.New() end
---@param name string
---@param itemType Data.Save.OperObj
---@param operType Data.Save.OperType
function Data.Save.GameSaveAnalyser:TryPush(name, itemType, operType) end
---@param fromSave Data.Save.GameOperInfo
---@return Cysharp.Threading.Tasks.UniTask
function Data.Save.GameSaveAnalyser:UpdateToSupabase(fromSave) end

---@class Data.Save.GameSaveAnalyser.SaveSelection : Supabase.Postgrest.Models.BaseModel
---@field data string
Data.Save.GameSaveAnalyser.SaveSelection = {}
---@alias CS.Data.Save.GameSaveAnalyser.SaveSelection Data.Save.GameSaveAnalyser.SaveSelection
CS.Data.Save.GameSaveAnalyser.SaveSelection = Data.Save.GameSaveAnalyser.SaveSelection

---@return Data.Save.GameSaveAnalyser.SaveSelection
function Data.Save.GameSaveAnalyser.SaveSelection.New() end

---@class Data.Save.GameSaveManager : System.Object
---@field MapTree MapTree
Data.Save.GameSaveManager = {}
---@alias CS.Data.Save.GameSaveManager Data.Save.GameSaveManager
CS.Data.Save.GameSaveManager = Data.Save.GameSaveManager

---@return System.Collections.Generic.List
function Data.Save.GameSaveManager.LoadAll() end
---@return Data.Save.SaveInfo
function Data.Save.GameSaveManager.GetNowSave() end
---@param saveInfo Data.Save.SaveInfo
function Data.Save.GameSaveManager.Select(saveInfo) end
function Data.Save.GameSaveManager.Save() end
function Data.Save.GameSaveManager.Delete() end
---@return boolean
function Data.Save.GameSaveManager.IsSave() end
---@return string
function Data.Save.GameSaveManager.GetSaveType() end
---@param roleTable RoleTable
function Data.Save.GameSaveManager.UpdateRoles(roleTable) end
---@return System.Collections.Generic.List
function Data.Save.GameSaveManager.GetHardTags() end
---@return System.Collections.Generic.List
function Data.Save.GameSaveManager.GetSlotTags() end
---@param eventId string
function Data.Save.GameSaveManager.AddEventRecord(eventId) end
---@return number
function Data.Save.GameSaveManager.GetEventRecordCount() end
---@return System.Collections.Generic.List
function Data.Save.GameSaveManager.GetEventRecord() end
---@param node MapTree.Node
function Data.Save.GameSaveManager.UpdateNode(node) end
---@return MapTree.Node
function Data.Save.GameSaveManager.GetNode() end
function Data.Save.GameSaveManager.ApplySaveSc() end
---@return System.Collections.Generic.Dictionary
function Data.Save.GameSaveManager.GetRoleTables() end
---@return boolean
function Data.Save.GameSaveManager.CheckCheat() end
---@return number
function Data.Save.GameSaveManager.GetHardLevel() end
---@return number
function Data.Save.GameSaveManager.GetEXHard() end
---@return number
function Data.Save.GameSaveManager.GetLevel() end
---@param value number
function Data.Save.GameSaveManager.SetLevel(value) end
---@return number
function Data.Save.GameSaveManager.GetSeed() end
---@return Data.Save.GameOperInfo
function Data.Save.GameSaveManager.GetItemOpers() end
---@overload fun(key: string, value: System.Object) : string
---@param key Data.Save.GameVar
---@param value System.Object
function Data.Save.GameSaveManager.SetValue(key, value) end

---@class Data.Save.GameVar
---@field ExDeleteCard Data.Save.GameVar
---@field ExLockDes Data.Save.GameVar
---@field ExDeleteDes Data.Save.GameVar
---@field ExTough Data.Save.GameVar
---@field RefreshCount Data.Save.GameVar
---@field PriceMul Data.Save.GameVar
---@field EXEnemyHp Data.Save.GameVar
---@field EXEnemyAtk Data.Save.GameVar
---@field Difficulty Data.Save.GameVar
---@field EndBoss Data.Save.GameVar
---@field LateThrow Data.Save.GameVar
---@field UselessWis Data.Save.GameVar
---@field ExpensiveCard Data.Save.GameVar
---@field SlotDraftTurnCount Data.Save.GameVar
---@field SlotDraftEnemyCount Data.Save.GameVar
---@field SlotLuckyCoin Data.Save.GameVar
---@field SlotMisfortuneCoin Data.Save.GameVar
---@field SlotNormalCoin Data.Save.GameVar
---@field SlotCoinUseCount Data.Save.GameVar
---@field SlotMultiplierCoin Data.Save.GameVar
---@field SlotBonusRewardCoin Data.Save.GameVar
---@field SlotExtraRewardCoin Data.Save.GameVar
---@field SlotEnemyRewriteCoin Data.Save.GameVar
---@field SlotTempRemoveCoin Data.Save.GameVar
---@field SlotPendingBonusRewardDraw Data.Save.GameVar
---@field SlotMapCal Data.Save.GameVar
---@field SlotEnemyAffixCount Data.Save.GameVar
---@field SlotTempRemovedCardIds Data.Save.GameVar
---@field SlotDayBattleCount Data.Save.GameVar
---@field SlotDayNightIsNight Data.Save.GameVar
---@field SlotChipReserve Data.Save.GameVar
---@field SlotChipInvested Data.Save.GameVar
---@field SlotChipTotalEarned Data.Save.GameVar
---@field SlotChipRoundIndex Data.Save.GameVar
---@field SlotChipBaseStake Data.Save.GameVar
---@field SlotChipStakeStep Data.Save.GameVar
---@field SlotChipAutoInvest Data.Save.GameVar
---@field HasSix Data.Save.GameVar
---@field TombUse Data.Save.GameVar
---@field ExCardBottom Data.Save.GameVar
---@field Branch Data.Save.GameVar
---@field SlotAccumulatedSelectionCards Data.Save.GameVar
---@field SlotPendingDraftDiceSnapshot Data.Save.GameVar
---@field HighExHp Data.Save.GameVar
---@field ExBless Data.Save.GameVar
Data.Save.GameVar = {}
---@alias CS.Data.Save.GameVar Data.Save.GameVar
CS.Data.Save.GameVar = Data.Save.GameVar


---@class Data.Save.SaveInfo : System.Object
---@field Name string
---@field CreatedTime string
---@field Version string
---@field HardLevel number
---@field isCheat boolean
---@field mapTree MapTree
---@field modeType string
---@field roleTable System.Collections.Generic.Dictionary
---@field LastNode MapTree.Node
---@field Level number
---@field Seed string
---@field GameVars System.Collections.Generic.Dictionary
---@field startTime System.DateTime
---@field endTime System.DateTime
---@field EventRecord System.Collections.Generic.List
---@field ItemOpers Data.Save.GameOperInfo
---@field HardTags System.Collections.Generic.List
---@field SlotTags System.Collections.Generic.List
---@field ShareCards System.Collections.Generic.List
---@field ShareRelics System.Collections.Generic.List
---@field SavePath string
---@field EXHard number
Data.Save.SaveInfo = {}
---@alias CS.Data.Save.SaveInfo Data.Save.SaveInfo
CS.Data.Save.SaveInfo = Data.Save.SaveInfo

---@return Data.Save.SaveInfo
function Data.Save.SaveInfo.New() end
---@param name string
---@return Data.Save.SaveInfo
function Data.Save.SaveInfo.Load(name) end
function Data.Save.SaveInfo:Save() end
function Data.Save.SaveInfo:Delete() end
---@param key string
---@param value string
function Data.Save.SaveInfo:SetValue(key, value) end

---@class Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver : Microsoft.CodeAnalysis.MetadataReferenceResolver
---@field ResolveMissingAssemblies boolean
Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver = {}
---@alias CS.Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver
CS.Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver = Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver

---@param innerResolver Microsoft.CodeAnalysis.Scripting.ScriptMetadataResolver
---@return Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver.New(innerResolver) end
---@overload fun(self: Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver, searchPaths: System.String[]) : Microsoft.CodeAnalysis.Scripting.ScriptMetadataResolver
---@overload fun(self: Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver, searchPaths: System.Collections.Generic.IEnumerable) : Microsoft.CodeAnalysis.Scripting.ScriptMetadataResolver
---@param searchPaths System.Collections.Immutable.ImmutableArray
---@return Microsoft.CodeAnalysis.Scripting.ScriptMetadataResolver
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:WithSearchPaths(searchPaths) end
---@param baseDirectory string
---@return Microsoft.CodeAnalysis.Scripting.ScriptMetadataResolver
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:WithBaseDirectory(baseDirectory) end
---@param definition Microsoft.CodeAnalysis.MetadataReference
---@param referenceIdentity Microsoft.CodeAnalysis.AssemblyIdentity
---@return Microsoft.CodeAnalysis.PortableExecutableReference
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:ResolveMissingAssembly(definition, referenceIdentity) end
---@overload fun(self: Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver, other: Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver) : boolean
---@param other System.Object
---@return boolean
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:Equals(other) end
---@return number
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:GetHashCode() end
---@param reference string
---@param baseFilePath string
---@param properties Microsoft.CodeAnalysis.MetadataReferenceProperties
---@return System.Collections.Immutable.ImmutableArray
function Microsoft.CodeAnalysis.Scripting.LockedMetadataResolver:ResolveReference(reference, baseFilePath, properties) end

---@class Witch.PointUse : Witch.UI.Window.ItemNonDrag
---@field RewardType string
---@field DesList string
Witch.PointUse = {}
---@alias CS.Witch.PointUse Witch.PointUse
CS.Witch.PointUse = Witch.PointUse

---@overload fun(self: Witch.PointUse, dataConfig1: DataConfig)
---@param Name string
---@param Description string
---@param Icon UnityEngine.Sprite
function Witch.PointUse:Init(Name, Description, Icon) end

---@class Witch.ModeMultiplayerPolicy : System.Object
Witch.ModeMultiplayerPolicy = {}
---@alias CS.Witch.ModeMultiplayerPolicy Witch.ModeMultiplayerPolicy
CS.Witch.ModeMultiplayerPolicy = Witch.ModeMultiplayerPolicy

---@param modeType string
---@return boolean
function Witch.ModeMultiplayerPolicy.IsModeMultiplayerEnabled(modeType) end

---@class Witch.IModeManager
---@field lazyLoad boolean
---@field NowDice Dice
---@field Level number
---@field MapTree MapTree
Witch.IModeManager = {}
---@alias CS.Witch.IModeManager Witch.IModeManager
CS.Witch.IModeManager = Witch.IModeManager

function Witch.IModeManager.ResetCount() end
---@return boolean
function Witch.IModeManager:CanMultiplayer() end
function Witch.IModeManager:ReadyToChangeMap() end
function Witch.IModeManager:GeneratrMap() end
function Witch.IModeManager:ShowMapSelect() end
---@param type string
---@param id string
function Witch.IModeManager:RpcLoadMap(type, id) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.IModeManager:MapItemInit(mapSelectUI) end
---@return boolean
function Witch.IModeManager:WinTheGame() end
---@param roleTable RoleTable
---@return RoleTable
function Witch.IModeManager:InitRoleTable(roleTable) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.IModeManager:SetReward(battleRewardsUI) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.IModeManager:MapUIStart(mapSelectUI) end
function Witch.IModeManager:CloseMapUI() end
---@param rewardType string
function Witch.IModeManager:SetRewardType(rewardType) end
---@return number
function Witch.IModeManager:GetCurrentEnemyPositiveMultiplier() end
---@return number
function Witch.IModeManager:GetCurrentSettlementScoreBonus() end
---@return boolean
function Witch.IModeManager:EnableWheelBattleForMultiEnemy() end
---@param roleTable RoleTable
function Witch.IModeManager:CardCountSet(roleTable) end

---@class Witch.NormalMapManager : Mirror.NetworkBehaviour
---@field lazyLoad boolean
---@field NowDice Dice
---@field Level number
---@field MapTree MapTree
---@field Network_level number
Witch.NormalMapManager = {}
---@alias CS.Witch.NormalMapManager Witch.NormalMapManager
CS.Witch.NormalMapManager = Witch.NormalMapManager

function Witch.NormalMapManager:ReadyToChangeMap() end
function Witch.NormalMapManager:GeneratrMap() end
function Witch.NormalMapManager:RandomGenerate() end
function Witch.NormalMapManager:CloseMapUI() end
function Witch.NormalMapManager:ShowMapSelect() end
---@param type string
---@param id string
function Witch.NormalMapManager:RpcLoadMap(type, id) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.NormalMapManager:SetSpeciaMap(mapSelectUI) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.NormalMapManager:MapItemInit(mapSelectUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.NormalMapManager:SetReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.NormalMapManager:RandomSetReward(battleRewardsUI) end
---@return boolean
function Witch.NormalMapManager:CanResetSafeBox() end
---@return boolean
function Witch.NormalMapManager:WinTheGame() end
---@param roleTable RoleTable
---@return RoleTable
function Witch.NormalMapManager:InitRoleTable(roleTable) end
---@param roleTable RoleTable
function Witch.NormalMapManager:CardCountSet(roleTable) end
---@return boolean
function Witch.NormalMapManager:Weaved() end
---@param writer Mirror.NetworkWriter
---@param forceAll boolean
function Witch.NormalMapManager:SerializeSyncVars(writer, forceAll) end
---@param reader Mirror.NetworkReader
---@param initialState boolean
function Witch.NormalMapManager:DeserializeSyncVars(reader, initialState) end

---@class Witch.SlotMachineManager : Mirror.NetworkBehaviour
---@field CanStandTurnThreshold number
---@field ForceStandTurnThreshold number
---@field relicList System.Collections.Generic.List
---@field cardList System.Collections.Generic.List
---@field enemyList System.Collections.Generic.List
---@field canuse boolean
---@field nowRewardType string
---@field lazyLoad boolean
---@field NowDice Dice
---@field Level number
---@field DraftTurnCount number
---@field DraftEnemyCount number
---@field MisfortuneCoin number
---@field CoinUseCount number
---@field MultiplierCoin number
---@field BonusRewardCoin number
---@field ExtraRewardCoin number
---@field DayBattleCount number
---@field IsNightPhase boolean
---@field ChipReserve number
---@field ChipInvested number
---@field ChipTotalEarned number
---@field ChipRoundIndex number
---@field ChipBaseStake number
---@field ChipStakeStep number
---@field ChipAutoInvest number
---@field CurrentRoundRequiredStake number
---@field MapCal number
---@field EnemyAffixCount number
---@field MapTree MapTree
Witch.SlotMachineManager = {}
---@alias CS.Witch.SlotMachineManager Witch.SlotMachineManager
CS.Witch.SlotMachineManager = Witch.SlotMachineManager

function Witch.SlotMachineManager.InitList() end
---@param rewardType string
function Witch.SlotMachineManager:SetRewardType(rewardType) end
function Witch.SlotMachineManager:EnsureChipStateInitializedForSlotRun() end
---@param outsiderStakeChips number
function Witch.SlotMachineManager:InitializeChipStateForNewRun(outsiderStakeChips) end
---@param n number
---@return boolean
function Witch.SlotMachineManager:TryApplyOutsiderStakeFromTruthOnce(n) end
---@param truthCost number
---@return boolean
function Witch.SlotMachineManager:TryApplyOutsiderStakeFromTruth(truthCost) end
---@return number
function Witch.SlotMachineManager:TryGrantRealtimeChipsByScore() end
---@return boolean
function Witch.SlotMachineManager:TryAutoInvestBeforeDraw() end
---@return boolean
function Witch.SlotMachineManager:TryCommitBattleStake() end
---@return boolean
function Witch.SlotMachineManager:HandleBattleLossByChip() end
---@param status StatusManager
---@return boolean
function Witch.SlotMachineManager:TryHandlePlayerDefeatInFight(status) end
---@param reason string
---@return boolean
function Witch.SlotMachineManager:TryOpenChipSettlementIfCannotContinue(reason) end
---@param reason string
function Witch.SlotMachineManager:OpenChipSettlement(reason) end
---@return number
function Witch.SlotMachineManager:GetSettlementTruthReward() end
---@return number
function Witch.SlotMachineManager:GetCurrentSettlementBaseScore() end
---@return number
function Witch.SlotMachineManager:GetCurrentSettlementAbyssBonusScore() end
---@return string
function Witch.SlotMachineManager:GetChipStatusSummary() end
function Witch.SlotMachineManager:ReadyToChangeMap() end
---@return System.Collections.Generic.List
function Witch.SlotMachineManager:GeneratrMap() end
function Witch.SlotMachineManager:RandomAddCoin() end
---@return System.Collections.Generic.List
function Witch.SlotMachineManager:BuildCoinDisplayConfigs() end
---@return System.Collections.Generic.List
function Witch.SlotMachineManager:RandomGenerate() end
function Witch.SlotMachineManager:ShowMapSelect() end
function Witch.SlotMachineManager:ResetDraftProgress() end
function Witch.SlotMachineManager:BeginForcedSettlementAfterQueuedBattles() end
---@return boolean
function Witch.SlotMachineManager:IsForcedSettlementAfterQueuedBattles() end
function Witch.SlotMachineManager:ClearForcedSettlementAfterQueuedBattles() end
function Witch.SlotMachineManager:RecordBattleCompleted() end
---@return boolean
function Witch.SlotMachineManager:NeedsMoreBattlesBeforeDayBoss() end
---@param resetDraftProgress boolean
function Witch.SlotMachineManager:BeginNightPhase(resetDraftProgress) end
function Witch.SlotMachineManager:RecordDraftPickProgress() end
---@return boolean
function Witch.SlotMachineManager:ConsumeDraftEnemyAndHasMore() end
---@return boolean
function Witch.SlotMachineManager:TryResolveQueuedBattleCompletion() end
function Witch.SlotMachineManager:AdvanceDraftTurn() end
---@return boolean
function Witch.SlotMachineManager:CanStandNow() end
---@param fromData DataConfig
function Witch.SlotMachineManager:AddEnemyAffix(fromData) end
---@return boolean
function Witch.SlotMachineManager:ShouldForceStandNow() end
---@param factor number
---@return boolean
function Witch.SlotMachineManager:TryConsumeMultiplierCoin(factor) end
---@return boolean
function Witch.SlotMachineManager:TryConsumeBonusRewardCoin() end
---@return boolean
function Witch.SlotMachineManager:TryConsumeExtraRewardCoin() end
---@param count number
---@param dice Dice
---@return System.Collections.Generic.List
function Witch.SlotMachineManager:DrawEnemyCalOptions(count, dice) end
---@param type string
---@param id string
function Witch.SlotMachineManager:RpcLoadMap(type, id) end
---@param slotMachUI Witch.UI.Window.SlotMachUI
function Witch.SlotMachineManager:MapItemInit(slotMachUI) end
---@param enemyData DataConfig
function Witch.SlotMachineManager:AddEnemy(enemyData) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:SetReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:RandomSetReward(battleRewardsUI) end
function Witch.SlotMachineManager:CloseMapUI() end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:LowReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:NormalReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:HighReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SlotMachineManager:relicReward(battleRewardsUI) end
---@return boolean
function Witch.SlotMachineManager:CanResetSafeBox() end
---@return boolean
function Witch.SlotMachineManager:WinTheGame() end
---@param type string
---@param id string
function Witch.SlotMachineManager:CmdLoadMap(type, id) end
---@param roleTable RoleTable
---@return RoleTable
function Witch.SlotMachineManager:InitRoleTable(roleTable) end
---@param roleTable RoleTable
---@return RoleTable
function Witch.SlotMachineManager:ResetRole(roleTable) end
---@return number
function Witch.SlotMachineManager:GetCurrentEnemyPositiveMultiplier() end
---@return number
function Witch.SlotMachineManager:GetCurrentSettlementScoreBonus() end
---@return boolean
function Witch.SlotMachineManager:EnableWheelBattleForMultiEnemy() end
---@param roleTable RoleTable
function Witch.SlotMachineManager:CardCountSet(roleTable) end
---@return boolean
function Witch.SlotMachineManager:Weaved() end

---@class Witch.SublimationManager : Mirror.NetworkBehaviour
---@field lazyLoad boolean
---@field NowDice Dice
---@field Level number
---@field MapTree MapTree
Witch.SublimationManager = {}
---@alias CS.Witch.SublimationManager Witch.SublimationManager
CS.Witch.SublimationManager = Witch.SublimationManager

function Witch.SublimationManager.ResetCount() end
function Witch.SublimationManager:ReadyToChangeMap() end
function Witch.SublimationManager:GeneratrMap() end
function Witch.SublimationManager:RandomGenerate() end
function Witch.SublimationManager:CloseMapUI() end
function Witch.SublimationManager:ShowMapSelect() end
---@param type string
---@param id string
function Witch.SublimationManager:RpcLoadMap(type, id) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.SublimationManager:MapItemInit(mapSelectUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SublimationManager:SetReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.SublimationManager:RandomSetReward(battleRewardsUI) end
---@return boolean
function Witch.SublimationManager:CanResetSafeBox() end
---@return boolean
function Witch.SublimationManager:WinTheGame() end
---@param roleTable RoleTable
---@return RoleTable
function Witch.SublimationManager:InitRoleTable(roleTable) end
---@param roleTable RoleTable
function Witch.SublimationManager:CardCountSet(roleTable) end
---@return boolean
function Witch.SublimationManager:Weaved() end

---@class Witch.TeachMapManager : Mirror.NetworkBehaviour
---@field lazyLoad boolean
---@field NowDice Dice
---@field Level number
---@field MapTree MapTree
Witch.TeachMapManager = {}
---@alias CS.Witch.TeachMapManager Witch.TeachMapManager
CS.Witch.TeachMapManager = Witch.TeachMapManager

---@return boolean
function Witch.TeachMapManager:CanMultiplayer() end
function Witch.TeachMapManager:ReadyToChangeMap() end
function Witch.TeachMapManager:GeneratrMap() end
function Witch.TeachMapManager:ShowMapSelect() end
function Witch.TeachMapManager:RandomGenerate() end
function Witch.TeachMapManager:CloseMapUI() end
---@param type string
---@param id string
function Witch.TeachMapManager:RpcLoadMap(type, id) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.TeachMapManager:MapUIStart(mapSelectUI) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.TeachMapManager:MapItemInit(mapSelectUI) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.TeachMapManager:SetTeachMap(mapSelectUI) end
---@param mapSelectUI Witch.UI.Window.MapSelectUI
function Witch.TeachMapManager:SetNormalMap(mapSelectUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.TeachMapManager:SetReward(battleRewardsUI) end
---@param battleRewardsUI Witch.UI.Window.BattleRewardsUI
function Witch.TeachMapManager:RandomSetReward(battleRewardsUI) end
---@param roleTable RoleTable
---@return RoleTable
function Witch.TeachMapManager:InitRoleTable(roleTable) end
---@param roleTable RoleTable
function Witch.TeachMapManager:CardCountSet(roleTable) end
---@return boolean
function Witch.TeachMapManager:Weaved() end

---@class Witch.QueryCareer : Network.Query.QueryBase
---@field instanceId string
---@field Result Witch.QueryCareer -- infered from Network.Query.QueryBase`1[Witch.UI.Window.CareerData]
Witch.QueryCareer = {}
---@alias CS.Witch.QueryCareer Witch.QueryCareer
CS.Witch.QueryCareer = Witch.QueryCareer

---@param instanceId string
---@return Witch.QueryCareer
function Witch.QueryCareer.New(instanceId) end
function Witch.QueryCareer:CmdExecute() end

---@class Witch.ChildHeight : UnityEngine.MonoBehaviour
---@field target UnityEngine.RectTransform
---@field BottomDis number
Witch.ChildHeight = {}
---@alias CS.Witch.ChildHeight Witch.ChildHeight
CS.Witch.ChildHeight = Witch.ChildHeight


---@class Witch.AffectionItem : UnityEngine.MonoBehaviour
---@field dataConfig DataConfig
---@field affectionUI Witch.UI.Window.AffectionUI
Witch.AffectionItem = {}
---@alias CS.Witch.AffectionItem Witch.AffectionItem
CS.Witch.AffectionItem = Witch.AffectionItem

---@param dataConfig DataConfig
function Witch.AffectionItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.AffectionItem:OnPointerClick(eventData) end
function Witch.AffectionItem:DataUpdate() end

---@class Witch.TopStatusItem : UnityEngine.MonoBehaviour
---@field roleTable RoleTable
Witch.TopStatusItem = {}
---@alias CS.Witch.TopStatusItem Witch.TopStatusItem
CS.Witch.TopStatusItem = Witch.TopStatusItem

---@param roleTable RoleTable
function Witch.TopStatusItem:Init(roleTable) end
function Witch.TopStatusItem:ShowCareer() end
function Witch.TopStatusItem:UpdateStatus() end
---@param Defend string
function Witch.TopStatusItem:UpdateDefend(Defend) end
function Witch.TopStatusItem:OpenBack() end
---@param careerData Witch.UI.Window.StatusUIData
function Witch.TopStatusItem:CareerInit(careerData) end
function Witch.TopStatusItem:OpenDeck() end
function Witch.TopStatusItem:HideDefend() end
---@param value string
---@param type string
function Witch.TopStatusItem:OtherChangeShow(value, type) end

---@class Witch.ArrowUse : UnityEngine.MonoBehaviour
Witch.ArrowUse = {}
---@alias CS.Witch.ArrowUse Witch.ArrowUse
CS.Witch.ArrowUse = Witch.ArrowUse


---@class Witch.InputWIndow : UnityEngine.MonoBehaviour
---@field windowIcon UnityEngine.UI.Image
---@field windowTitle TMPro.TextMeshProUGUI
---@field windowDescription TMPro.TextMeshProUGUI
---@field confirmButton Michsky.MUIP.ButtonManager
---@field cancelButton Michsky.MUIP.ButtonManager
---@field mwAnimator UnityEngine.Animator
---@field icon UnityEngine.Sprite
---@field titleText string
---@field descriptionText string
---@field onOpen UnityEngine.Events.UnityEvent
---@field onClose UnityEngine.Events.UnityEvent
---@field onConfirm UnityEngine.Events.UnityEvent
---@field onCancel UnityEngine.Events.UnityEvent
---@field useCustomContent boolean
---@field isOn boolean
---@field closeOnCancel boolean
---@field closeOnConfirm boolean
---@field showCancelButton boolean
---@field showConfirmButton boolean
---@field startBehaviour Witch.InputWIndow.StartBehaviour
---@field closeBehaviour Witch.InputWIndow.CloseBehaviour
---@field onEnableBehaviour Witch.InputWIndow.OnEnableBehaviour
---@field inputField TMPro.TMP_InputField
---@field mustChoose boolean
Witch.InputWIndow = {}
---@alias CS.Witch.InputWIndow Witch.InputWIndow
CS.Witch.InputWIndow = Witch.InputWIndow

function Witch.InputWIndow:TryClose() end
function Witch.InputWIndow:UpdateUI() end
function Witch.InputWIndow:OpenTarget() end
function Witch.InputWIndow:Open() end
function Witch.InputWIndow:Close() end
function Witch.InputWIndow:OpenWindow() end
function Witch.InputWIndow:CloseWindow() end
function Witch.InputWIndow:AnimateWindow() end

---@class Witch.InputWIndow.StartBehaviour
---@field None Witch.InputWIndow.StartBehaviour
---@field Disable Witch.InputWIndow.StartBehaviour
---@field Enable Witch.InputWIndow.StartBehaviour
Witch.InputWIndow.StartBehaviour = {}
---@alias CS.Witch.InputWIndow.StartBehaviour Witch.InputWIndow.StartBehaviour
CS.Witch.InputWIndow.StartBehaviour = Witch.InputWIndow.StartBehaviour


---@class Witch.InputWIndow.CloseBehaviour
---@field None Witch.InputWIndow.CloseBehaviour
---@field Disable Witch.InputWIndow.CloseBehaviour
---@field Destroy Witch.InputWIndow.CloseBehaviour
Witch.InputWIndow.CloseBehaviour = {}
---@alias CS.Witch.InputWIndow.CloseBehaviour Witch.InputWIndow.CloseBehaviour
CS.Witch.InputWIndow.CloseBehaviour = Witch.InputWIndow.CloseBehaviour


---@class Witch.InputWIndow.OnEnableBehaviour
---@field None Witch.InputWIndow.OnEnableBehaviour
---@field Restore Witch.InputWIndow.OnEnableBehaviour
Witch.InputWIndow.OnEnableBehaviour = {}
---@alias CS.Witch.InputWIndow.OnEnableBehaviour Witch.InputWIndow.OnEnableBehaviour
CS.Witch.InputWIndow.OnEnableBehaviour = Witch.InputWIndow.OnEnableBehaviour


---@class Witch.FightVarItem : UnityEngine.MonoBehaviour
---@field gameEntryUI Witch.UI.Window.GameEntryUI
Witch.FightVarItem = {}
---@alias CS.Witch.FightVarItem Witch.FightVarItem
CS.Witch.FightVarItem = Witch.FightVarItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.FightVarItem:OnPointerClick(eventData) end

---@class Witch.VarBless : Witch.UI.Window.ItemNonDrag
Witch.VarBless = {}
---@alias CS.Witch.VarBless Witch.VarBless
CS.Witch.VarBless = Witch.VarBless

---@param item DataConfig
function Witch.VarBless:Init(item) end

---@class Witch.DollItem : UnityEngine.MonoBehaviour
---@field waitTime number
---@field mul number
---@field isRight boolean
Witch.DollItem = {}
---@alias CS.Witch.DollItem Witch.DollItem
CS.Witch.DollItem = Witch.DollItem

function Witch.DollItem:Running() end
function Witch.DollItem:EndRunning() end

---@class Witch.HouseDialogueManager : UnityEngine.MonoBehaviour
---@field Type string
---@field ItemParent UnityEngine.Transform
---@field MyItem UnityEngine.Transform
---@field OtherItem UnityEngine.Transform
---@field nowData DataConfig
---@field DialogueScrollRect UnityEngine.UI.ScrollRect
Witch.HouseDialogueManager = {}
---@alias CS.Witch.HouseDialogueManager Witch.HouseDialogueManager
CS.Witch.HouseDialogueManager = Witch.HouseDialogueManager

function Witch.HouseDialogueManager:OnEnable() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.HouseDialogueManager:OnPointerClick(eventData) end

---@class Witch.KeyItem : UnityEngine.MonoBehaviour
---@field msg string
---@field islow boolean
Witch.KeyItem = {}
---@alias CS.Witch.KeyItem Witch.KeyItem
CS.Witch.KeyItem = Witch.KeyItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.KeyItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.KeyItem:OnPointerExit(eventData) end

---@class Witch.CoinItem : Witch.UI.Window.Item
---@field animationController CardAnimationController
---@field index number
---@field initPosition UnityEngine.Vector2
---@field initAngle UnityEngine.Vector3
---@field draging boolean
---@field initScale number
---@field selectScale number
---@field isReverse boolean
---@field ignore boolean
Witch.CoinItem = {}
---@alias CS.Witch.CoinItem Witch.CoinItem
CS.Witch.CoinItem = Witch.CoinItem

function Witch.CoinItem:Awake() end
---@param data DataConfig
function Witch.CoinItem:Init(data) end
function Witch.CoinItem:DataUpdate() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.CoinItem:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.CoinItem:OnPointerExit(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.CoinItem:OnPointerClick(eventData) end
function Witch.CoinItem:UseSc() end
---@param index number
function Witch.CoinItem:SetIndex(index) end

---@class Witch.SlotMachSlotItem : UnityEngine.MonoBehaviour
---@field type string
---@field canClick boolean
---@field itemicon UnityEngine.Sprite
---@field backgroundRoot UnityEngine.GameObject
Witch.SlotMachSlotItem = {}
---@alias CS.Witch.SlotMachSlotItem Witch.SlotMachSlotItem
CS.Witch.SlotMachSlotItem = Witch.SlotMachSlotItem

---@param ui Witch.UI.Window.SlotMachUI
---@param hazardLane boolean
function Witch.SlotMachSlotItem:BindLane(ui, hazardLane) end
function Witch.SlotMachSlotItem:ResetVisual() end
---@param ui Witch.UI.Window.SlotMachUI
---@param hazardLane boolean
function Witch.SlotMachSlotItem:ShowBackgroundOnly(ui, hazardLane) end
---@param delay number
function Witch.SlotMachSlotItem:PlayEnter(delay) end
---@param enabled boolean
function Witch.SlotMachSlotItem:SetClickEnabled(enabled) end
---@param ui Witch.UI.Window.SlotMachUI
---@param item System.Collections.Generic.Dictionary
---@param isSelfLane boolean
---@param hazardLane boolean
---@param draftDice Dice
function Witch.SlotMachSlotItem:InitializeFromRule(ui, item, isSelfLane, hazardLane, draftDice) end
---@param ui Witch.UI.Window.SlotMachUI
---@param config DataConfig
---@param hazardLane boolean
function Witch.SlotMachSlotItem:InitializeFromDataConfig(ui, config, hazardLane) end
function Witch.SlotMachSlotItem:OnClicked() end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.SlotMachSlotItem:OnPointerClick(eventData) end
---@return DataConfig
function Witch.SlotMachSlotItem:GetDataConfig() end
---@return boolean
function Witch.SlotMachSlotItem:IsHazardLane() end
---@param delay number
function Witch.SlotMachSlotItem:FadeOut(delay) end
---@param stagingParent UnityEngine.RectTransform
function Witch.SlotMachSlotItem:PrepareForHandCarry(stagingParent) end
---@param handCarryAnchor UnityEngine.RectTransform
---@param anchoredOffset UnityEngine.Vector2
---@param rotationZ number
---@param duration number
---@param ease DG.Tweening.Ease
---@return DG.Tweening.Tween
function Witch.SlotMachSlotItem:AttachToHand(handCarryAnchor, anchoredOffset, rotationZ, duration, ease) end
---@overload fun(self: Witch.SlotMachSlotItem, targetParent: UnityEngine.RectTransform, targetAnchoredPosition: UnityEngine.Vector2, onComplete: System.Action | function, duration: number, ease: DG.Tweening.Ease) : DG.Tweening.Tween
---@param targetParent UnityEngine.RectTransform
---@param onComplete System.Action | function
---@param duration number
---@param ease DG.Tweening.Ease
---@return DG.Tweening.Tween
function Witch.SlotMachSlotItem:SettleToAccumulated(targetParent, onComplete, duration, ease) end
---@param targetParent UnityEngine.RectTransform
---@param targetAnchoredPosition UnityEngine.Vector2
---@param onComplete System.Action | function
---@param duration number
---@param ease DG.Tweening.Ease
---@return DG.Tweening.Tween
function Witch.SlotMachSlotItem:ReleaseFromHandToTarget(targetParent, targetAnchoredPosition, onComplete, duration, ease) end
---@param targetParent UnityEngine.RectTransform
---@param onComplete System.Action | function
function Witch.SlotMachSlotItem:MoveToAccumulated(targetParent, onComplete) end

---@class Witch.ModItem : UnityEngine.MonoBehaviour
---@field modManager Witch.UI.Window.ModManagerUI
---@field data Witch.UI.Window.SteamWorkshopModInfo
---@field mainSprite UnityEngine.Sprite
---@field DownButton Michsky.MUIP.ButtonManager
---@field LocalEnableToggle UnityEngine.UI.Toggle
---@field InShopList boolean
Witch.ModItem = {}
---@alias CS.Witch.ModItem Witch.ModItem
CS.Witch.ModItem = Witch.ModItem

---@param info Witch.UI.Window.SteamWorkshopModInfo
---@param out_displayText string
---@return boolean,string
function Witch.ModItem.TryGetConfigurationDisplayText(info, out_displayText) end
---@param fromdata Witch.UI.Window.SteamWorkshopModInfo
---@param inShopList boolean
function Witch.ModItem:Init(fromdata, inShopList) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.ModItem:OnPointerClick(eventData) end
function Witch.ModItem:OnClickDownloadButton() end
function Witch.ModItem:RefreshActionButtonText() end
---@param isOn boolean
function Witch.ModItem:OnLocalEnableToggleChanged(isOn) end

---@class Witch.ModeManager : Mirror.NetworkBehaviour
---@field ModeMapManager Witch.IModeManager
Witch.ModeManager = {}
---@alias CS.Witch.ModeManager Witch.ModeManager
CS.Witch.ModeManager = Witch.ModeManager

---@return boolean
function Witch.ModeManager:Weaved() end

---@class Witch.ModeUseButton : UnityEngine.MonoBehaviour
---@field whiteBack UnityEngine.Transform
---@field Hlight UnityEngine.Transform
---@field Normal UnityEngine.Transform
Witch.ModeUseButton = {}
---@alias CS.Witch.ModeUseButton Witch.ModeUseButton
CS.Witch.ModeUseButton = Witch.ModeUseButton

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.ModeUseButton:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.ModeUseButton:OnPointerExit(eventData) end

---@class Witch.FoodItem : UnityEngine.MonoBehaviour
---@field spriteRenderer UnityEngine.SpriteRenderer
---@field button UnityEngine.UI.Button
---@field SceneItem UnityEngine.GameObject
---@field dataConfig DataConfig
---@field BaseId string
Witch.FoodItem = {}
---@alias CS.Witch.FoodItem Witch.FoodItem
CS.Witch.FoodItem = Witch.FoodItem

function Witch.FoodItem:Start() end
---@param fromData DataConfig
function Witch.FoodItem:Init(fromData) end
---@param pos UnityEngine.Vector3
function Witch.FoodItem:Setposition(pos) end
function Witch.FoodItem:EatFood() end

---@class Witch.MapRole : AnimatorRole
---@field SceneItem UnityEngine.GameObject
Witch.MapRole = {}
---@alias CS.Witch.MapRole Witch.MapRole
CS.Witch.MapRole = Witch.MapRole

---@param index number
---@param fromData DataConfig
---@param instanceId string
---@param needDialogueBox boolean
function Witch.MapRole:Init(index, fromData, instanceId, needDialogueBox) end
---@param pos UnityEngine.Vector3
function Witch.MapRole:Setposition(pos) end

---@class Witch.SceneRole : AnimatorRole
---@field SceneItem UnityEngine.GameObject
Witch.SceneRole = {}
---@alias CS.Witch.SceneRole Witch.SceneRole
CS.Witch.SceneRole = Witch.SceneRole

---@param index number
---@param fromData DataConfig
---@param instanceId string
---@param needDialogueBox boolean
function Witch.SceneRole:Init(index, fromData, instanceId, needDialogueBox) end
---@param pos UnityEngine.Vector3
function Witch.SceneRole:Setposition(pos) end

---@class Witch.TaskItem : Witch.UI.Window.ItemNonDrag
---@field taskUI Witch.TaskUI
Witch.TaskItem = {}
---@alias CS.Witch.TaskItem Witch.TaskItem
CS.Witch.TaskItem = Witch.TaskItem

---@param dataConfig DataConfig
function Witch.TaskItem:Init(dataConfig) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.TaskItem:OnPointerClick(eventData) end
function Witch.TaskItem:DataUpdate() end

---@class Witch.TaskUI : Witch.UI.UIBase
---@field firstShow boolean
Witch.TaskUI = {}
---@alias CS.Witch.TaskUI Witch.TaskUI
CS.Witch.TaskUI = Witch.TaskUI

function Witch.TaskUI:OnEnable() end
function Witch.TaskUI:Init() end
function Witch.TaskUI:DataUpdate() end
---@param dataConfig DataConfig
function Witch.TaskUI:ShowTaskDetail(dataConfig) end
function Witch.TaskUI:ClaimReward() end

---@class Witch.TypeItem : UnityEngine.MonoBehaviour
---@field IsOpen boolean
---@field TypeName string
Witch.TypeItem = {}
---@alias CS.Witch.TypeItem Witch.TypeItem
CS.Witch.TypeItem = Witch.TypeItem

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.TypeItem:OnPointerClick(eventData) end

---@class Witch.Mod.ModHookAttribute : System.Attribute
---@field TypeName string
---@field MethodName string
Witch.Mod.ModHookAttribute = {}
---@alias CS.Witch.Mod.ModHookAttribute Witch.Mod.ModHookAttribute
CS.Witch.Mod.ModHookAttribute = Witch.Mod.ModHookAttribute


---@class Witch.Mod.HookBeforeAttribute : Witch.Mod.ModHookAttribute
Witch.Mod.HookBeforeAttribute = {}
---@alias CS.Witch.Mod.HookBeforeAttribute Witch.Mod.HookBeforeAttribute
CS.Witch.Mod.HookBeforeAttribute = Witch.Mod.HookBeforeAttribute

---@param type System.Type
---@param methodName string
---@return Witch.Mod.HookBeforeAttribute
function Witch.Mod.HookBeforeAttribute.New(type, methodName) end

---@class Witch.Mod.HookAfterAttribute : Witch.Mod.ModHookAttribute
Witch.Mod.HookAfterAttribute = {}
---@alias CS.Witch.Mod.HookAfterAttribute Witch.Mod.HookAfterAttribute
CS.Witch.Mod.HookAfterAttribute = Witch.Mod.HookAfterAttribute

---@param type System.Type
---@param methodName string
---@return Witch.Mod.HookAfterAttribute
function Witch.Mod.HookAfterAttribute.New(type, methodName) end

---@class Witch.Mod.LuaModHookAdapter : System.Object
Witch.Mod.LuaModHookAdapter = {}
---@alias CS.Witch.Mod.LuaModHookAdapter Witch.Mod.LuaModHookAdapter
CS.Witch.Mod.LuaModHookAdapter = Witch.Mod.LuaModHookAdapter

---@overload fun(fn: XLua.LuaFunction) : System.Action
---@param fn System.Reflection.MethodInfo
---@return System.Action | function
function Witch.Mod.LuaModHookAdapter.ToAction(fn) end

---@class Witch.Mod.ModConfig : System.Object
---@field DirectoryName string
---@field ModName string
---@field ModVersion string
---@field ModAuthor string
---@field ModDescription string
---@field IconPath string
---@field Enabled boolean
---@field Dependencies System.Collections.Generic.List
---@field MustSame boolean
---@field ModId string
Witch.Mod.ModConfig = {}
---@alias CS.Witch.Mod.ModConfig Witch.Mod.ModConfig
CS.Witch.Mod.ModConfig = Witch.Mod.ModConfig

---@return Witch.Mod.ModConfig
function Witch.Mod.ModConfig.New() end
---@param id string
---@param newData System.Collections.Generic.Dictionary
function Witch.Mod.ModConfig:SetDataConfig(id, newData) end
---@param id string
---@param key string
---@param value string
function Witch.Mod.ModConfig:ModifyDataConfig(id, key, value) end
---@param source string
---@param target string
function Witch.Mod.ModConfig:MergeDataConfig(source, target) end
---@param originalPath string
---@param newPath string
function Witch.Mod.ModConfig:RedirectSourcePath(originalPath, newPath) end
---@param methodName string
---@param _function XLua.LuaFunction
function Witch.Mod.ModConfig:AddDynamicMethod(methodName, _function) end
---@overload fun(self: Witch.Mod.ModConfig, typeDotMethod: string, _function: XLua.LuaFunction)
---@overload fun(self: Witch.Mod.ModConfig, typeDotMethod: string, context: System.Action | function)
---@overload fun(self: Witch.Mod.ModConfig, typeName: string, methodName: string, context: System.Action | function)
---@param type System.Type
---@param methodName string
---@param context System.Action | function
function Witch.Mod.ModConfig:AddMethodHookBefore(type, methodName, context) end
---@overload fun(self: Witch.Mod.ModConfig, typeDotMethod: string, _function: XLua.LuaFunction)
---@overload fun(self: Witch.Mod.ModConfig, typeDotMethod: string, context: System.Action | function)
---@overload fun(self: Witch.Mod.ModConfig, typeName: string, methodName: string, context: System.Action | function)
---@param type System.Type
---@param methodName string
---@param context System.Action | function
function Witch.Mod.ModConfig:AddMethodHookAfter(type, methodName, context) end

---@class Witch.Mod.ModConfigurationData : System.Object
---@field Readme string
---@field ExampleBool System.Nullable
---@field ExampleNumber System.Nullable
---@field ExampleString string
---@field ExtensionData System.Collections.Generic.Dictionary
Witch.Mod.ModConfigurationData = {}
---@alias CS.Witch.Mod.ModConfigurationData Witch.Mod.ModConfigurationData
CS.Witch.Mod.ModConfigurationData = Witch.Mod.ModConfigurationData

---@return Witch.Mod.ModConfigurationData
function Witch.Mod.ModConfigurationData.New() end

---@class Witch.Mod.ModConfigurationFile : System.Object
---@field FileName string
Witch.Mod.ModConfigurationFile = {}
---@alias CS.Witch.Mod.ModConfigurationFile Witch.Mod.ModConfigurationFile
CS.Witch.Mod.ModConfigurationFile = Witch.Mod.ModConfigurationFile

---@param modRootDirectory string
---@return string
function Witch.Mod.ModConfigurationFile.GetPath(modRootDirectory) end
---@param modRootDirectory string
---@return boolean
function Witch.Mod.ModConfigurationFile.Exists(modRootDirectory) end
---@param modRootDirectory string
---@param out_data Witch.Mod.ModConfigurationData
---@param out_error string
---@return boolean,Witch.Mod.ModConfigurationData,string
function Witch.Mod.ModConfigurationFile.TryRead(modRootDirectory, out_data, out_error) end
---@param modRootDirectory string
---@param data Witch.Mod.ModConfigurationData
---@param out_error string
---@return boolean,string
function Witch.Mod.ModConfigurationFile.TrySave(modRootDirectory, data, out_error) end
---@param modRootDirectory string
---@param out_displayText string
---@return boolean,string
function Witch.Mod.ModConfigurationFile.TryGetDisplayText(modRootDirectory, out_displayText) end
---@param modRootDirectory string
---@param out_json Newtonsoft.Json.Linq.JObject
---@param out_error string
---@return boolean,Newtonsoft.Json.Linq.JObject,string
function Witch.Mod.ModConfigurationFile.TryLoadJsonObject(modRootDirectory, out_json, out_error) end

---@class Witch.Mod.ModInitializeAttribute : System.Attribute
Witch.Mod.ModInitializeAttribute = {}
---@alias CS.Witch.Mod.ModInitializeAttribute Witch.Mod.ModInitializeAttribute
CS.Witch.Mod.ModInitializeAttribute = Witch.Mod.ModInitializeAttribute

---@return Witch.Mod.ModInitializeAttribute
function Witch.Mod.ModInitializeAttribute.New() end

---@class Witch.UI.ConsoleUI : Witch.UI.UIBase
---@field Instance Witch.UI.ConsoleUI
Witch.UI.ConsoleUI = {}
---@alias CS.Witch.UI.ConsoleUI Witch.UI.ConsoleUI
CS.Witch.UI.ConsoleUI = Witch.UI.ConsoleUI

function Witch.UI.ConsoleUI:OnEnable() end
function Witch.UI.ConsoleUI:OnDisable() end
---@param outputer string
---@param output string
function Witch.UI.ConsoleUI:Output(outputer, output) end

---@class Witch.UI.UIManager : UnityEngine.MonoBehaviour
---@field Instance Witch.UI.UIManager
---@field canvasTf UnityEngine.Transform
---@field upperCanvasTf UnityEngine.Transform
---@field effectContent UnityEngine.Transform
---@field WindowObj UnityEngine.GameObject
---@field InputObj UnityEngine.GameObject
Witch.UI.UIManager = {}
---@alias CS.Witch.UI.UIManager Witch.UI.UIManager
CS.Witch.UI.UIManager = Witch.UI.UIManager

function Witch.UI.UIManager:Awake() end
---@param uiName string
function Witch.UI.UIManager:HideUI(uiName) end
function Witch.UI.UIManager:CloseAllUI() end
---@param uiName string
function Witch.UI.UIManager:CloseUI(uiName) end
---@param uiName string
---@return Witch.UI.UIBase
function Witch.UI.UIManager:Find(uiName) end
---@param uiName string
function Witch.UI.UIManager:RemoveUI(uiName) end
---@return System.Collections.Generic.IEnumerable
function Witch.UI.UIManager:GetAllUI() end
---@param button Witch.UI.ExitButton
function Witch.UI.UIManager:RegisterExitButton(button) end
---@param button Witch.UI.ExitButton
function Witch.UI.UIManager:UnregisterExitButton(button) end
---@return System.Collections.Generic.List
function Witch.UI.UIManager:GetAllExitButtons() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateActionIcon() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateActionContent() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateEffectList() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateHPItem() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateBuffBarItem() end
---@return UnityEngine.GameObject
function Witch.UI.UIManager:CreateStatusBarItem() end
---@return DialogueBox
function Witch.UI.UIManager:CreateDialogueBox() end
function Witch.UI.UIManager:CheckUI() end
---@param msg string
---@param callback System.Action | function
function Witch.UI.UIManager:ShowTip(msg, callback) end
function Witch.UI.UIManager:PopUpTextInit() end
---@param TextType string
---@param val string
---@param pos UnityEngine.Vector2
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.UIManager:ShowPopUpText(TextType, val, pos) end
---@param TextType string
---@param baseDamage string
---@param status StatusManager
---@param pos UnityEngine.Vector2
---@param realDamage string
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.UIManager:ShowPopUpDamage(TextType, baseDamage, status, pos, realDamage) end
---@param id string
function Witch.UI.UIManager:ShowEventUI(id) end
---@param action System.Action | function
function Witch.UI.UIManager:DoWithTurn(action) end
---@param title string
---@param text string
---@param onConfirm UnityEngine.Events.UnityAction
---@param typeSpeed number
---@param onCancel UnityEngine.Events.UnityAction
---@param hasConfirm boolean
---@param hasCancel boolean
---@param confirmText string
---@param cancelText string
---@param mustChoose boolean
---@return Michsky.MUIP.ModalWindowManager
function Witch.UI.UIManager:ShowModalWindow(title, text, onConfirm, typeSpeed, onCancel, hasConfirm, hasCancel, confirmText, cancelText, mustChoose) end
---@param title string
---@param text string
---@param onConfirm UnityEngine.Events.UnityAction
---@param typeSpeed number
---@param onCancel UnityEngine.Events.UnityAction
---@param hasConfirm boolean
---@param hasCancel boolean
---@param confirmText string
---@param cancelText string
---@param mustChoose boolean
---@return Witch.InputWIndow
function Witch.UI.UIManager:ShowInputWindow(title, text, onConfirm, typeSpeed, onCancel, hasConfirm, hasCancel, confirmText, cancelText, mustChoose) end
---@param title string
---@param text string
---@param cancelCondition System.Func
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.UIManager:ShowWaitingUI(title, text, cancelCondition) end
---@param title string
---@param text string
---@param cancelCondition System.Func
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.UIManager:ShowInputUI(title, text, cancelCondition) end
---@overload fun(self: Witch.UI.UIManager, iconPath: string, title: string, description: string, tips: string)
---@param icon UnityEngine.Sprite
---@param title string
---@param description string
---@param tips string
function Witch.UI.UIManager:ShowItemShowUI(icon, title, description, tips) end
---@return Tooltip
function Witch.UI.UIManager:GetTooltip() end
---@return Michsky.MUIP.ProgressBar
function Witch.UI.UIManager:GetProgressBar() end
---@param Title string
---@param Description string
---@param delay number
function Witch.UI.UIManager:ShowNotification(Title, Description, delay) end
function Witch.UI.UIManager:EndNotification() end
function Witch.UI.UIManager:HideFloatingWindow() end
---@return FloatingWindow
function Witch.UI.UIManager:GetFloatingWindow() end
---@return AnimationManager
function Witch.UI.UIManager:GetAnimationManage() end

---@class Witch.UI.UIManager.PopupDamageContext : System.Object
---@field CurrentDamage number
Witch.UI.UIManager.PopupDamageContext = {}
---@alias CS.Witch.UI.UIManager.PopupDamageContext Witch.UI.UIManager.PopupDamageContext
CS.Witch.UI.UIManager.PopupDamageContext = Witch.UI.UIManager.PopupDamageContext

---@return Witch.UI.UIManager.PopupDamageContext
function Witch.UI.UIManager.PopupDamageContext.New() end

---@class Witch.UI.ButtonSound : UnityEngine.MonoBehaviour
---@field metal boolean
---@field useDownSound boolean
---@field enterSound boolean
---@field isPure boolean
Witch.UI.ButtonSound = {}
---@alias CS.Witch.UI.ButtonSound Witch.UI.ButtonSound
CS.Witch.UI.ButtonSound = Witch.UI.ButtonSound

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.ButtonSound:OnPointerDown(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.ButtonSound:OnPointerEnter(eventData) end

---@class Witch.UI.HouseButtonUse : UnityEngine.MonoBehaviour
Witch.UI.HouseButtonUse = {}
---@alias CS.Witch.UI.HouseButtonUse Witch.UI.HouseButtonUse
CS.Witch.UI.HouseButtonUse = Witch.UI.HouseButtonUse

---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.HouseButtonUse:OnPointerDown(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.HouseButtonUse:OnPointerEnter(eventData) end

---@class Witch.UI.ExitButton : UnityEngine.MonoBehaviour
Witch.UI.ExitButton = {}
---@alias CS.Witch.UI.ExitButton Witch.UI.ExitButton
CS.Witch.UI.ExitButton = Witch.UI.ExitButton

---@return boolean
function Witch.UI.ExitButton:OnCancelKey() end

---@class Witch.UI.KeywordDisplay : UnityEngine.MonoBehaviour
---@field keyWords System.Collections.Generic.List
---@field text string
---@field title string
---@field msg string
---@field icon UnityEngine.Sprite
---@field type string
---@field isHover boolean
Witch.UI.KeywordDisplay = {}
---@alias CS.Witch.UI.KeywordDisplay Witch.UI.KeywordDisplay
CS.Witch.UI.KeywordDisplay = Witch.UI.KeywordDisplay

---@param title string
---@param text string
---@param keyWords System.Collections.Generic.List
---@param msg string
---@param icon UnityEngine.Sprite
---@param type string
function Witch.UI.KeywordDisplay:SetText(title, text, keyWords, msg, icon, type) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.KeywordDisplay:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.KeywordDisplay:OnPointerExit(eventData) end
function Witch.UI.KeywordDisplay:OnDestroy() end
---@param localiedTitle System.Func
---@param localizedContent System.Func
---@param keywords System.Collections.Generic.List
function Witch.UI.KeywordDisplay:SetLocalizedText(localiedTitle, localizedContent, keywords) end

---@class Witch.UI.UIBase : UnityEngine.MonoBehaviour
---@field animationType Witch.UI.UIBase.AnimationType
---@field fadeInAnim UnityEngine.AnimationClip
---@field fadeOutAnim UnityEngine.AnimationClip
---@field IsUpperUI boolean
---@field isScene boolean
Witch.UI.UIBase = {}
---@alias CS.Witch.UI.UIBase Witch.UI.UIBase
CS.Witch.UI.UIBase = Witch.UI.UIBase

function Witch.UI.UIBase:Show() end
function Witch.UI.UIBase:UpperBlock() end
function Witch.UI.UIBase:CancelUpperBlock() end
function Witch.UI.UIBase:FadeIn() end
---@param callback System.Action | function
function Witch.UI.UIBase:FadeOut(callback) end
function Witch.UI.UIBase:Hide() end
function Witch.UI.UIBase:Close() end
---@param callback System.Action | function
function Witch.UI.UIBase:CloseWithCallback(callback) end
function Witch.UI.UIBase:OnEnable() end
function Witch.UI.UIBase:Help() end
function Witch.UI.UIBase:DataUpdate() end
function Witch.UI.UIBase:RegisterEvent() end
function Witch.UI.UIBase:ClearEvent() end
function Witch.UI.UIBase:OnDisable() end
function Witch.UI.UIBase:OnDestroy() end

---@class Witch.UI.UIBase.AnimationType
---@field Fade Witch.UI.UIBase.AnimationType
---@field None Witch.UI.UIBase.AnimationType
---@field WaitCurtain Witch.UI.UIBase.AnimationType
---@field Custom Witch.UI.UIBase.AnimationType
Witch.UI.UIBase.AnimationType = {}
---@alias CS.Witch.UI.UIBase.AnimationType Witch.UI.UIBase.AnimationType
CS.Witch.UI.UIBase.AnimationType = Witch.UI.UIBase.AnimationType


---@class Witch.UI.UIEventTrigger : UnityEngine.MonoBehaviour
---@field onClick System.Action | function
---@field EnterPoint System.Action | function
---@field ExitPoint System.Action | function
Witch.UI.UIEventTrigger = {}
---@alias CS.Witch.UI.UIEventTrigger Witch.UI.UIEventTrigger
CS.Witch.UI.UIEventTrigger = Witch.UI.UIEventTrigger

---@param obj UnityEngine.GameObject
---@return Witch.UI.UIEventTrigger
function Witch.UI.UIEventTrigger.Get(obj) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.UIEventTrigger:OnPointerClick(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.UIEventTrigger:OnPointerEnter(eventData) end
---@param eventData UnityEngine.EventSystems.PointerEventData
function Witch.UI.UIEventTrigger:OnPointerExit(eventData) end

---@class Witch.UI.UpperCanvasController : UnityEngine.MonoBehaviour
Witch.UI.UpperCanvasController = {}
---@alias CS.Witch.UI.UpperCanvasController Witch.UI.UpperCanvasController
CS.Witch.UI.UpperCanvasController = Witch.UI.UpperCanvasController


---@class Witch.UI.UpperCanvasController.ChildMonitor : UnityEngine.MonoBehaviour
Witch.UI.UpperCanvasController.ChildMonitor = {}
---@alias CS.Witch.UI.UpperCanvasController.ChildMonitor Witch.UI.UpperCanvasController.ChildMonitor
CS.Witch.UI.UpperCanvasController.ChildMonitor = Witch.UI.UpperCanvasController.ChildMonitor

---@param controller Witch.UI.UpperCanvasController
function Witch.UI.UpperCanvasController.ChildMonitor:Init(controller) end

---@class Witch.UI.SceneType
---@field Road Witch.UI.SceneType
---@field Castle Witch.UI.SceneType
---@field PuppetTheater Witch.UI.SceneType
---@field Forest Witch.UI.SceneType
---@field Chessboard Witch.UI.SceneType
---@field Courtyard Witch.UI.SceneType
---@field SlotMachScene Witch.UI.SceneType
---@field Curia Witch.UI.SceneType
---@field DollFairyTale Witch.UI.SceneType
---@field BalancedHolySee Witch.UI.SceneType
---@field DemonKing Witch.UI.SceneType
Witch.UI.SceneType = {}
---@alias CS.Witch.UI.SceneType Witch.UI.SceneType
CS.Witch.UI.SceneType = Witch.UI.SceneType


---@class Witch.UI.Component.RevealPlaybackMode
---@field Manual Witch.UI.Component.RevealPlaybackMode
---@field Loop Witch.UI.Component.RevealPlaybackMode
---@field PingPong Witch.UI.Component.RevealPlaybackMode
Witch.UI.Component.RevealPlaybackMode = {}
---@alias CS.Witch.UI.Component.RevealPlaybackMode Witch.UI.Component.RevealPlaybackMode
CS.Witch.UI.Component.RevealPlaybackMode = Witch.UI.Component.RevealPlaybackMode


---@class Witch.UI.Component.DiagonalRevealMask : UnityEngine.UI.MaskableGraphic
---@field Progress number
---@field PlaybackMode Witch.UI.Component.RevealPlaybackMode
---@field AutoPlay boolean
---@field Duration number
---@field StripeWidth number
---@field StripeSoftness number
---@field StripeIntensity number
---@field StripeColor UnityEngine.Color
---@field mainTexture UnityEngine.Texture
Witch.UI.Component.DiagonalRevealMask = {}
---@alias CS.Witch.UI.Component.DiagonalRevealMask Witch.UI.Component.DiagonalRevealMask
CS.Witch.UI.Component.DiagonalRevealMask = Witch.UI.Component.DiagonalRevealMask

---@param value number
function Witch.UI.Component.DiagonalRevealMask:SetProgress(value) end
function Witch.UI.Component.DiagonalRevealMask:Play() end
function Witch.UI.Component.DiagonalRevealMask:Stop() end
function Witch.UI.Component.DiagonalRevealMask:ResetProgress() end

---@class Witch.UI.Component.DiagonalRevealStripeOverlay : UnityEngine.UI.MaskableGraphic
---@field mainTexture UnityEngine.Texture
Witch.UI.Component.DiagonalRevealStripeOverlay = {}
---@alias CS.Witch.UI.Component.DiagonalRevealStripeOverlay Witch.UI.Component.DiagonalRevealStripeOverlay
CS.Witch.UI.Component.DiagonalRevealStripeOverlay = Witch.UI.Component.DiagonalRevealStripeOverlay

---@param revealMask Witch.UI.Component.DiagonalRevealMask
function Witch.UI.Component.DiagonalRevealStripeOverlay:Initialize(revealMask) end
function Witch.UI.Component.DiagonalRevealStripeOverlay:SyncRectTransform() end
function Witch.UI.Component.DiagonalRevealStripeOverlay:EnsureDrawOrder() end
---@param progress number
---@param stripeColor UnityEngine.Color
---@param stripeWidth number
---@param stripeSoftness number
---@param stripeIntensity number
function Witch.UI.Component.DiagonalRevealStripeOverlay:ApplyState(progress, stripeColor, stripeWidth, stripeSoftness, stripeIntensity) end

---@class Witch.UI.Component.LocalizedTMPFontSize : UnityEngine.MonoBehaviour
---@field Rules System.Collections.Generic.IReadOnlyList
---@field PreviewInEditMode boolean
---@field PreviewLocaleCode string
Witch.UI.Component.LocalizedTMPFontSize = {}
---@alias CS.Witch.UI.Component.LocalizedTMPFontSize Witch.UI.Component.LocalizedTMPFontSize
CS.Witch.UI.Component.LocalizedTMPFontSize = Witch.UI.Component.LocalizedTMPFontSize

---@param expression string
---@param out_error string
---@return boolean,string
function Witch.UI.Component.LocalizedTMPFontSize.IsValidFontSizeExpression(expression, out_error) end
---@param expression string
---@param out_tagExpression string
---@param out_error string
---@return boolean,string,string
function Witch.UI.Component.LocalizedTMPFontSize.TryGetFontSizeTagExpression(expression, out_tagExpression, out_error) end
---@return boolean
function Witch.UI.Component.LocalizedTMPFontSize:AutoInjectTargets() end
---@return boolean
function Witch.UI.Component.LocalizedTMPFontSize:SyncLocaleRules() end
function Witch.UI.Component.LocalizedTMPFontSize:ApplyCurrentLocale() end
---@param localeCode string
function Witch.UI.Component.LocalizedTMPFontSize:ApplyLocaleCode(localeCode) end
function Witch.UI.Component.LocalizedTMPFontSize:RefreshSize() end
---@param text string
---@return string
function Witch.UI.Component.LocalizedTMPFontSize:PreprocessText(text) end

---@class Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding : System.ValueType
---@field Target TMPro.TMP_Text
---@field Previous TMPro.ITextPreprocessor
---@field Preprocessor TMPro.ITextPreprocessor
Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding = {}
---@alias CS.Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding
CS.Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding = Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding

---@param target TMPro.TMP_Text
---@param previous TMPro.ITextPreprocessor
---@param preprocessor TMPro.ITextPreprocessor
---@return Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding
function Witch.UI.Component.LocalizedTMPFontSize.PreprocessorBinding.New(target, previous, preprocessor) end

---@class Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor : System.Object
Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor = {}
---@alias CS.Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor
CS.Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor = Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor

---@param owner Witch.UI.Component.LocalizedTMPFontSize
---@param previous TMPro.ITextPreprocessor
---@return Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor
function Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor.New(owner, previous) end
---@param text string
---@return string
function Witch.UI.Component.LocalizedTMPFontSize.FontSizePreprocessor:PreprocessText(text) end

---@class Witch.UI.Component.LocalizedTMPFontSizeRule : System.Object
---@field localeCode string
---@field localeName string
---@field fontSizeExpression string
Witch.UI.Component.LocalizedTMPFontSizeRule = {}
---@alias CS.Witch.UI.Component.LocalizedTMPFontSizeRule Witch.UI.Component.LocalizedTMPFontSizeRule
CS.Witch.UI.Component.LocalizedTMPFontSizeRule = Witch.UI.Component.LocalizedTMPFontSizeRule

---@overload fun() : Witch.UI.Component.LocalizedTMPFontSizeRule
---@param localeCode string
---@param localeName string
---@param fontSizeExpression string
---@return Witch.UI.Component.LocalizedTMPFontSizeRule
function Witch.UI.Component.LocalizedTMPFontSizeRule.New(localeCode, localeName, fontSizeExpression) end

---@class Witch.UI.Component.TMPAutoNumberShortener : UnityEngine.MonoBehaviour
Witch.UI.Component.TMPAutoNumberShortener = {}
---@alias CS.Witch.UI.Component.TMPAutoNumberShortener Witch.UI.Component.TMPAutoNumberShortener
CS.Witch.UI.Component.TMPAutoNumberShortener = Witch.UI.Component.TMPAutoNumberShortener

---@param text string
---@return string
function Witch.UI.Component.TMPAutoNumberShortener:PreprocessText(text) end

---@class Witch.UI.Component.TMPNumberToSprite : System.Object
Witch.UI.Component.TMPNumberToSprite = {}
---@alias CS.Witch.UI.Component.TMPNumberToSprite Witch.UI.Component.TMPNumberToSprite
CS.Witch.UI.Component.TMPNumberToSprite = Witch.UI.Component.TMPNumberToSprite

---@param tmp TMPro.TMP_Text
---@param text string
function Witch.UI.Component.TMPNumberToSprite.SetDigitText(tmp, text) end
---@param tmp TMPro.TMP_Text
---@param text string
function Witch.UI.Component.TMPNumberToSprite.SetCardCostText(tmp, text) end

---@class Witch.UI.Automation.RuntimePlayCardRequest : System.Object
---@field CardInstanceId System.Nullable
---@field CardId string
---@field CardIndex System.Nullable
---@field TargetInstanceId System.Nullable
---@field TargetName string
---@field TargetIndex System.Nullable
Witch.UI.Automation.RuntimePlayCardRequest = {}
---@alias CS.Witch.UI.Automation.RuntimePlayCardRequest Witch.UI.Automation.RuntimePlayCardRequest
CS.Witch.UI.Automation.RuntimePlayCardRequest = Witch.UI.Automation.RuntimePlayCardRequest

---@return Witch.UI.Automation.RuntimePlayCardRequest
function Witch.UI.Automation.RuntimePlayCardRequest.New() end

---@class Witch.UI.Automation.RuntimePlayCardResult : System.Object
---@field Success boolean
---@field Message string
---@field CardInstanceId System.Nullable
---@field CardType string
---@field CardId string
---@field TargetInstanceId System.Nullable
---@field TargetName string
---@field TargetHpBefore System.Nullable
---@field TargetHpAfter System.Nullable
---@field HandCountBefore System.Nullable
---@field HandCountAfter System.Nullable
Witch.UI.Automation.RuntimePlayCardResult = {}
---@alias CS.Witch.UI.Automation.RuntimePlayCardResult Witch.UI.Automation.RuntimePlayCardResult
CS.Witch.UI.Automation.RuntimePlayCardResult = Witch.UI.Automation.RuntimePlayCardResult

---@return Witch.UI.Automation.RuntimePlayCardResult
function Witch.UI.Automation.RuntimePlayCardResult.New() end

---@class Witch.UI.Automation.RuntimeBattleAutomationFacade : System.Object
Witch.UI.Automation.RuntimeBattleAutomationFacade = {}
---@alias CS.Witch.UI.Automation.RuntimeBattleAutomationFacade Witch.UI.Automation.RuntimeBattleAutomationFacade
CS.Witch.UI.Automation.RuntimeBattleAutomationFacade = Witch.UI.Automation.RuntimeBattleAutomationFacade

---@param request Witch.UI.Automation.RuntimePlayCardRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeBattleAutomationFacade:PlayCardAsync(request) end

---@class Witch.UI.Automation.RuntimeBattleAutomationService : System.Object
---@field Facade Witch.UI.Automation.RuntimeBattleAutomationFacade
Witch.UI.Automation.RuntimeBattleAutomationService = {}
---@alias CS.Witch.UI.Automation.RuntimeBattleAutomationService Witch.UI.Automation.RuntimeBattleAutomationService
CS.Witch.UI.Automation.RuntimeBattleAutomationService = Witch.UI.Automation.RuntimeBattleAutomationService

---@param out_fightUi Witch.UI.Window.FightUI
---@param out_error string
---@return boolean,Witch.UI.Window.FightUI,string
function Witch.UI.Automation.RuntimeBattleAutomationService.TryGetContext(out_fightUi, out_error) end
---@param request Witch.UI.Automation.RuntimePlayCardRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeBattleAutomationService.PlayCardAsync(request) end
---@param cardItem CardItem
---@param out_reason string
---@return boolean,string
function Witch.UI.Automation.RuntimeBattleAutomationService.CanPlayCardLegally(cardItem, out_reason) end

---@class Witch.UI.Automation.RuntimeLegalAction : System.Object
---@field Id string
---@field Kind string
---@field Label string
---@field Description string
---@field Parameters System.Collections.Generic.Dictionary
Witch.UI.Automation.RuntimeLegalAction = {}
---@alias CS.Witch.UI.Automation.RuntimeLegalAction Witch.UI.Automation.RuntimeLegalAction
CS.Witch.UI.Automation.RuntimeLegalAction = Witch.UI.Automation.RuntimeLegalAction

---@return Witch.UI.Automation.RuntimeLegalAction
function Witch.UI.Automation.RuntimeLegalAction.New() end

---@class Witch.UI.Automation.RuntimeLegalActionsSnapshot : System.Object
---@field Phase string
---@field Actions System.Collections.Generic.List
Witch.UI.Automation.RuntimeLegalActionsSnapshot = {}
---@alias CS.Witch.UI.Automation.RuntimeLegalActionsSnapshot Witch.UI.Automation.RuntimeLegalActionsSnapshot
CS.Witch.UI.Automation.RuntimeLegalActionsSnapshot = Witch.UI.Automation.RuntimeLegalActionsSnapshot

---@return Witch.UI.Automation.RuntimeLegalActionsSnapshot
function Witch.UI.Automation.RuntimeLegalActionsSnapshot.New() end

---@class Witch.UI.Automation.RuntimePerformActionRequest : System.Object
---@field ActionId string
Witch.UI.Automation.RuntimePerformActionRequest = {}
---@alias CS.Witch.UI.Automation.RuntimePerformActionRequest Witch.UI.Automation.RuntimePerformActionRequest
CS.Witch.UI.Automation.RuntimePerformActionRequest = Witch.UI.Automation.RuntimePerformActionRequest

---@return Witch.UI.Automation.RuntimePerformActionRequest
function Witch.UI.Automation.RuntimePerformActionRequest.New() end

---@class Witch.UI.Automation.RuntimePerformActionResult : System.Object
---@field Success boolean
---@field ActionId string
---@field Message string
---@field Data System.Object
Witch.UI.Automation.RuntimePerformActionResult = {}
---@alias CS.Witch.UI.Automation.RuntimePerformActionResult Witch.UI.Automation.RuntimePerformActionResult
CS.Witch.UI.Automation.RuntimePerformActionResult = Witch.UI.Automation.RuntimePerformActionResult

---@return Witch.UI.Automation.RuntimePerformActionResult
function Witch.UI.Automation.RuntimePerformActionResult.New() end

---@class Witch.UI.Automation.RuntimeGameplayAutomationFacade : System.Object
Witch.UI.Automation.RuntimeGameplayAutomationFacade = {}
---@alias CS.Witch.UI.Automation.RuntimeGameplayAutomationFacade Witch.UI.Automation.RuntimeGameplayAutomationFacade
CS.Witch.UI.Automation.RuntimeGameplayAutomationFacade = Witch.UI.Automation.RuntimeGameplayAutomationFacade

---@return Witch.UI.Automation.RuntimeLegalActionsSnapshot
function Witch.UI.Automation.RuntimeGameplayAutomationFacade:GetLegalActions() end
---@param request Witch.UI.Automation.RuntimePerformActionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeGameplayAutomationFacade:PerformActionAsync(request) end

---@class Witch.UI.Automation.RuntimeGameplayAutomationService : System.Object
---@field Facade Witch.UI.Automation.RuntimeGameplayAutomationFacade
Witch.UI.Automation.RuntimeGameplayAutomationService = {}
---@alias CS.Witch.UI.Automation.RuntimeGameplayAutomationService Witch.UI.Automation.RuntimeGameplayAutomationService
CS.Witch.UI.Automation.RuntimeGameplayAutomationService = Witch.UI.Automation.RuntimeGameplayAutomationService

---@return Witch.UI.Automation.RuntimeLegalActionsSnapshot
function Witch.UI.Automation.RuntimeGameplayAutomationService.GetLegalActions() end
---@param request Witch.UI.Automation.RuntimePerformActionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeGameplayAutomationService.PerformActionAsync(request) end

---@class Witch.UI.Automation.RuntimeSceneSnapshotRequest : System.Object
---@field IncludeInactive boolean
---@field OnlyInteractive boolean
Witch.UI.Automation.RuntimeSceneSnapshotRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneSnapshotRequest Witch.UI.Automation.RuntimeSceneSnapshotRequest
CS.Witch.UI.Automation.RuntimeSceneSnapshotRequest = Witch.UI.Automation.RuntimeSceneSnapshotRequest

---@return Witch.UI.Automation.RuntimeSceneSnapshotRequest
function Witch.UI.Automation.RuntimeSceneSnapshotRequest.New() end

---@class Witch.UI.Automation.RuntimeSceneObjectSelector : System.Object
---@field ObjectId string
---@field InstanceId System.Nullable
---@field TransformPath string
---@field Name string
---@field IsEmpty boolean
Witch.UI.Automation.RuntimeSceneObjectSelector = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneObjectSelector Witch.UI.Automation.RuntimeSceneObjectSelector
CS.Witch.UI.Automation.RuntimeSceneObjectSelector = Witch.UI.Automation.RuntimeSceneObjectSelector

---@return Witch.UI.Automation.RuntimeSceneObjectSelector
function Witch.UI.Automation.RuntimeSceneObjectSelector.New() end

---@class Witch.UI.Automation.RuntimeSceneObjectInfo : System.Object
---@field ObjectId string
---@field InstanceId number
---@field Name string
---@field TransformPath string
---@field SceneName string
---@field Tag string
---@field Layer number
---@field LayerName string
---@field ActiveSelf boolean
---@field ActiveInHierarchy boolean
---@field Visible boolean
---@field HasCollider3D boolean
---@field HasCollider2D boolean
---@field HasPointerHandler boolean
---@field ScreenPoint Witch.UI.Automation.RuntimeUiPoint
---@field ScreenRect Witch.UI.Automation.RuntimeUiRect
---@field ComponentTypes System.Collections.Generic.List
---@field SupportedActions System.Collections.Generic.List
Witch.UI.Automation.RuntimeSceneObjectInfo = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneObjectInfo Witch.UI.Automation.RuntimeSceneObjectInfo
CS.Witch.UI.Automation.RuntimeSceneObjectInfo = Witch.UI.Automation.RuntimeSceneObjectInfo

---@return Witch.UI.Automation.RuntimeSceneObjectInfo
function Witch.UI.Automation.RuntimeSceneObjectInfo.New() end

---@class Witch.UI.Automation.RuntimeSceneSnapshot : System.Object
---@field CapturedAtUtc string
---@field SceneName string
---@field CameraName string
---@field Objects System.Collections.Generic.List
---@field TotalObjects number
---@field ScreenshotPath string
---@field ScreenshotFullPath string
---@field ScreenshotIsAsync boolean
---@field ScreenshotError string
Witch.UI.Automation.RuntimeSceneSnapshot = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneSnapshot Witch.UI.Automation.RuntimeSceneSnapshot
CS.Witch.UI.Automation.RuntimeSceneSnapshot = Witch.UI.Automation.RuntimeSceneSnapshot

---@return Witch.UI.Automation.RuntimeSceneSnapshot
function Witch.UI.Automation.RuntimeSceneSnapshot.New() end

---@class Witch.UI.Automation.RuntimeSceneRaycastRequest : System.Object
---@field X number
---@field Y number
---@field Distance number
Witch.UI.Automation.RuntimeSceneRaycastRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneRaycastRequest Witch.UI.Automation.RuntimeSceneRaycastRequest
CS.Witch.UI.Automation.RuntimeSceneRaycastRequest = Witch.UI.Automation.RuntimeSceneRaycastRequest

---@return Witch.UI.Automation.RuntimeSceneRaycastRequest
function Witch.UI.Automation.RuntimeSceneRaycastRequest.New() end

---@class Witch.UI.Automation.RuntimeSceneRaycastHitInfo : System.Object
---@field Object Witch.UI.Automation.RuntimeSceneObjectInfo
---@field Distance number
---@field Point Witch.UI.Automation.RuntimeUiPoint
---@field Normal Witch.UI.Automation.RuntimeUiPoint
---@field HitType string
Witch.UI.Automation.RuntimeSceneRaycastHitInfo = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneRaycastHitInfo Witch.UI.Automation.RuntimeSceneRaycastHitInfo
CS.Witch.UI.Automation.RuntimeSceneRaycastHitInfo = Witch.UI.Automation.RuntimeSceneRaycastHitInfo

---@return Witch.UI.Automation.RuntimeSceneRaycastHitInfo
function Witch.UI.Automation.RuntimeSceneRaycastHitInfo.New() end

---@class Witch.UI.Automation.RuntimeSceneRaycastResult : System.Object
---@field ScreenPoint Witch.UI.Automation.RuntimeUiPoint
---@field Hits3D System.Collections.Generic.List
---@field Hits2D System.Collections.Generic.List
Witch.UI.Automation.RuntimeSceneRaycastResult = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneRaycastResult Witch.UI.Automation.RuntimeSceneRaycastResult
CS.Witch.UI.Automation.RuntimeSceneRaycastResult = Witch.UI.Automation.RuntimeSceneRaycastResult

---@return Witch.UI.Automation.RuntimeSceneRaycastResult
function Witch.UI.Automation.RuntimeSceneRaycastResult.New() end

---@class Witch.UI.Automation.RuntimeSceneInteractionRequest : System.Object
---@field Action string
---@field Selector Witch.UI.Automation.RuntimeSceneObjectSelector
---@field TargetSelector Witch.UI.Automation.RuntimeSceneObjectSelector
---@field ScreenPoint Witch.UI.Automation.RuntimeUiPoint
---@field TargetPoint Witch.UI.Automation.RuntimeUiPoint
---@field Button string
---@field ScrollX number
---@field ScrollY number
---@field Steps number
---@field FramesPerStep number
Witch.UI.Automation.RuntimeSceneInteractionRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneInteractionRequest Witch.UI.Automation.RuntimeSceneInteractionRequest
CS.Witch.UI.Automation.RuntimeSceneInteractionRequest = Witch.UI.Automation.RuntimeSceneInteractionRequest

---@return Witch.UI.Automation.RuntimeSceneInteractionRequest
function Witch.UI.Automation.RuntimeSceneInteractionRequest.New() end

---@class Witch.UI.Automation.RuntimeSceneInteractionResult : System.Object
---@field Success boolean
---@field Action string
---@field Message string
---@field Object Witch.UI.Automation.RuntimeSceneObjectInfo
---@field FinalPointerPosition Witch.UI.Automation.RuntimeUiPoint
Witch.UI.Automation.RuntimeSceneInteractionResult = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneInteractionResult Witch.UI.Automation.RuntimeSceneInteractionResult
CS.Witch.UI.Automation.RuntimeSceneInteractionResult = Witch.UI.Automation.RuntimeSceneInteractionResult

---@return Witch.UI.Automation.RuntimeSceneInteractionResult
function Witch.UI.Automation.RuntimeSceneInteractionResult.New() end

---@class Witch.UI.Automation.RuntimeSceneAutomationFacade : System.Object
Witch.UI.Automation.RuntimeSceneAutomationFacade = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneAutomationFacade Witch.UI.Automation.RuntimeSceneAutomationFacade
CS.Witch.UI.Automation.RuntimeSceneAutomationFacade = Witch.UI.Automation.RuntimeSceneAutomationFacade

---@param request Witch.UI.Automation.RuntimeSceneSnapshotRequest
---@return Witch.UI.Automation.RuntimeSceneSnapshot
function Witch.UI.Automation.RuntimeSceneAutomationFacade:Snapshot(request) end
---@param request Witch.UI.Automation.RuntimeSceneRaycastRequest
---@return Witch.UI.Automation.RuntimeSceneRaycastResult
function Witch.UI.Automation.RuntimeSceneAutomationFacade:Raycast(request) end
---@param request Witch.UI.Automation.RuntimeSceneInteractionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeSceneAutomationFacade:InteractAsync(request) end

---@class Witch.UI.Automation.RuntimeSceneAutomationService : System.Object
---@field Facade Witch.UI.Automation.RuntimeSceneAutomationFacade
Witch.UI.Automation.RuntimeSceneAutomationService = {}
---@alias CS.Witch.UI.Automation.RuntimeSceneAutomationService Witch.UI.Automation.RuntimeSceneAutomationService
CS.Witch.UI.Automation.RuntimeSceneAutomationService = Witch.UI.Automation.RuntimeSceneAutomationService

---@param out_camera UnityEngine.Camera
---@param out_eventSystem UnityEngine.EventSystems.EventSystem
---@param out_error string
---@return boolean,UnityEngine.Camera,UnityEngine.EventSystems.EventSystem,string
function Witch.UI.Automation.RuntimeSceneAutomationService.TryGetContext(out_camera, out_eventSystem, out_error) end
---@param request Witch.UI.Automation.RuntimeSceneSnapshotRequest
---@return Witch.UI.Automation.RuntimeSceneSnapshot
function Witch.UI.Automation.RuntimeSceneAutomationService.CaptureSnapshot(request) end
---@param request Witch.UI.Automation.RuntimeSceneRaycastRequest
---@return Witch.UI.Automation.RuntimeSceneRaycastResult
function Witch.UI.Automation.RuntimeSceneAutomationService.Raycast(request) end
---@param request Witch.UI.Automation.RuntimeSceneInteractionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeSceneAutomationService.InteractAsync(request) end

---@class Witch.UI.Automation.RuntimeUiSnapshotRequest : System.Object
---@field IncludeHidden boolean
---@field Scope string
Witch.UI.Automation.RuntimeUiSnapshotRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeUiSnapshotRequest Witch.UI.Automation.RuntimeUiSnapshotRequest
CS.Witch.UI.Automation.RuntimeUiSnapshotRequest = Witch.UI.Automation.RuntimeUiSnapshotRequest

---@return Witch.UI.Automation.RuntimeUiSnapshotRequest
function Witch.UI.Automation.RuntimeUiSnapshotRequest.New() end

---@class Witch.UI.Automation.RuntimeUiNodeSelector : System.Object
---@field NodeId string
---@field InstanceId System.Nullable
---@field WindowName string
---@field TransformPath string
---@field Label string
---@field IsEmpty boolean
Witch.UI.Automation.RuntimeUiNodeSelector = {}
---@alias CS.Witch.UI.Automation.RuntimeUiNodeSelector Witch.UI.Automation.RuntimeUiNodeSelector
CS.Witch.UI.Automation.RuntimeUiNodeSelector = Witch.UI.Automation.RuntimeUiNodeSelector

---@return Witch.UI.Automation.RuntimeUiNodeSelector
function Witch.UI.Automation.RuntimeUiNodeSelector.New() end

---@class Witch.UI.Automation.RuntimeUiPoint : System.Object
---@field X number
---@field Y number
Witch.UI.Automation.RuntimeUiPoint = {}
---@alias CS.Witch.UI.Automation.RuntimeUiPoint Witch.UI.Automation.RuntimeUiPoint
CS.Witch.UI.Automation.RuntimeUiPoint = Witch.UI.Automation.RuntimeUiPoint

---@overload fun() : Witch.UI.Automation.RuntimeUiPoint
---@param x number
---@param y number
---@return Witch.UI.Automation.RuntimeUiPoint
function Witch.UI.Automation.RuntimeUiPoint.New(x, y) end

---@class Witch.UI.Automation.RuntimeUiRect : System.Object
---@field X number
---@field Y number
---@field Width number
---@field Height number
Witch.UI.Automation.RuntimeUiRect = {}
---@alias CS.Witch.UI.Automation.RuntimeUiRect Witch.UI.Automation.RuntimeUiRect
CS.Witch.UI.Automation.RuntimeUiRect = Witch.UI.Automation.RuntimeUiRect

---@return Witch.UI.Automation.RuntimeUiRect
function Witch.UI.Automation.RuntimeUiRect.New() end

---@class Witch.UI.Automation.RuntimeUiCanvasInfo : System.Object
---@field Name string
---@field InstanceId number
---@field TransformPath string
---@field ActiveInHierarchy boolean
---@field Enabled boolean
---@field RenderMode string
---@field SortingOrder number
Witch.UI.Automation.RuntimeUiCanvasInfo = {}
---@alias CS.Witch.UI.Automation.RuntimeUiCanvasInfo Witch.UI.Automation.RuntimeUiCanvasInfo
CS.Witch.UI.Automation.RuntimeUiCanvasInfo = Witch.UI.Automation.RuntimeUiCanvasInfo

---@return Witch.UI.Automation.RuntimeUiCanvasInfo
function Witch.UI.Automation.RuntimeUiCanvasInfo.New() end

---@class Witch.UI.Automation.RuntimeUiWindowInfo : System.Object
---@field WindowName string
---@field InstanceId number
---@field NodeId string
---@field TransformPath string
---@field ActiveInHierarchy boolean
---@field Visible boolean
---@field SiblingIndex number
Witch.UI.Automation.RuntimeUiWindowInfo = {}
---@alias CS.Witch.UI.Automation.RuntimeUiWindowInfo Witch.UI.Automation.RuntimeUiWindowInfo
CS.Witch.UI.Automation.RuntimeUiWindowInfo = Witch.UI.Automation.RuntimeUiWindowInfo

---@return Witch.UI.Automation.RuntimeUiWindowInfo
function Witch.UI.Automation.RuntimeUiWindowInfo.New() end

---@class Witch.UI.Automation.RuntimeUiNode : System.Object
---@field NodeId string
---@field WindowName string
---@field TransformPath string
---@field InstanceId number
---@field Name string
---@field Label string
---@field Text string
---@field ActiveSelf boolean
---@field ActiveInHierarchy boolean
---@field Visible boolean
---@field Interactable boolean
---@field Clickable boolean
---@field BlocksRaycasts boolean
---@field Depth number
---@field ParentNodeId string
---@field ChildNodeIds System.Collections.Generic.List
---@field ComponentTypes System.Collections.Generic.List
---@field SupportedActions System.Collections.Generic.List
---@field ScreenRect Witch.UI.Automation.RuntimeUiRect
---@field PreferredClickPoint Witch.UI.Automation.RuntimeUiPoint
Witch.UI.Automation.RuntimeUiNode = {}
---@alias CS.Witch.UI.Automation.RuntimeUiNode Witch.UI.Automation.RuntimeUiNode
CS.Witch.UI.Automation.RuntimeUiNode = Witch.UI.Automation.RuntimeUiNode

---@return Witch.UI.Automation.RuntimeUiNode
function Witch.UI.Automation.RuntimeUiNode.New() end

---@class Witch.UI.Automation.RuntimeUiSnapshot : System.Object
---@field Scope string
---@field IncludeHidden boolean
---@field CapturedAtUtc string
---@field Canvases System.Collections.Generic.List
---@field Windows System.Collections.Generic.List
---@field Nodes System.Collections.Generic.List
---@field TotalNodes number
---@field LayoutSignature string
---@field ScreenshotPath string
---@field ScreenshotFullPath string
---@field ScreenshotIsAsync boolean
---@field ScreenshotError string
Witch.UI.Automation.RuntimeUiSnapshot = {}
---@alias CS.Witch.UI.Automation.RuntimeUiSnapshot Witch.UI.Automation.RuntimeUiSnapshot
CS.Witch.UI.Automation.RuntimeUiSnapshot = Witch.UI.Automation.RuntimeUiSnapshot

---@return Witch.UI.Automation.RuntimeUiSnapshot
function Witch.UI.Automation.RuntimeUiSnapshot.New() end

---@class Witch.UI.Automation.RuntimeUiInteractionRequest : System.Object
---@field Action string
---@field Selector Witch.UI.Automation.RuntimeUiNodeSelector
---@field TargetSelector Witch.UI.Automation.RuntimeUiNodeSelector
---@field TargetPoint Witch.UI.Automation.RuntimeUiPoint
---@field Text string
---@field Submit boolean
---@field RequireClickable boolean
---@field Button string
---@field DeltaX number
---@field DeltaY number
---@field Steps number
---@field FramesPerStep number
---@field IncludePostSnapshot boolean
Witch.UI.Automation.RuntimeUiInteractionRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeUiInteractionRequest Witch.UI.Automation.RuntimeUiInteractionRequest
CS.Witch.UI.Automation.RuntimeUiInteractionRequest = Witch.UI.Automation.RuntimeUiInteractionRequest

---@return Witch.UI.Automation.RuntimeUiInteractionRequest
function Witch.UI.Automation.RuntimeUiInteractionRequest.New() end

---@class Witch.UI.Automation.RuntimeUiInteractionResult : System.Object
---@field Success boolean
---@field Action string
---@field Message string
---@field MatchedNode Witch.UI.Automation.RuntimeUiNode
---@field PreNode Witch.UI.Automation.RuntimeUiNode
---@field PostNode Witch.UI.Automation.RuntimeUiNode
---@field PostSnapshot Witch.UI.Automation.RuntimeUiSnapshot
---@field FinalPointerPosition Witch.UI.Automation.RuntimeUiPoint
---@field HorizontalNormalizedPosition System.Nullable
---@field VerticalNormalizedPosition System.Nullable
---@field HoveredNodeId string
Witch.UI.Automation.RuntimeUiInteractionResult = {}
---@alias CS.Witch.UI.Automation.RuntimeUiInteractionResult Witch.UI.Automation.RuntimeUiInteractionResult
CS.Witch.UI.Automation.RuntimeUiInteractionResult = Witch.UI.Automation.RuntimeUiInteractionResult

---@return Witch.UI.Automation.RuntimeUiInteractionResult
function Witch.UI.Automation.RuntimeUiInteractionResult.New() end

---@class Witch.UI.Automation.RuntimeUiWaitRequest : System.Object
---@field Condition string
---@field Selector Witch.UI.Automation.RuntimeUiNodeSelector
---@field WindowName string
---@field ExpectedText string
Witch.UI.Automation.RuntimeUiWaitRequest = {}
---@alias CS.Witch.UI.Automation.RuntimeUiWaitRequest Witch.UI.Automation.RuntimeUiWaitRequest
CS.Witch.UI.Automation.RuntimeUiWaitRequest = Witch.UI.Automation.RuntimeUiWaitRequest

---@return Witch.UI.Automation.RuntimeUiWaitRequest
function Witch.UI.Automation.RuntimeUiWaitRequest.New() end

---@class Witch.UI.Automation.RuntimeUiWaitCheckResult : System.Object
---@field Satisfied boolean
---@field Message string
---@field Node Witch.UI.Automation.RuntimeUiNode
---@field Window Witch.UI.Automation.RuntimeUiWindowInfo
---@field LayoutSignature string
Witch.UI.Automation.RuntimeUiWaitCheckResult = {}
---@alias CS.Witch.UI.Automation.RuntimeUiWaitCheckResult Witch.UI.Automation.RuntimeUiWaitCheckResult
CS.Witch.UI.Automation.RuntimeUiWaitCheckResult = Witch.UI.Automation.RuntimeUiWaitCheckResult

---@return Witch.UI.Automation.RuntimeUiWaitCheckResult
function Witch.UI.Automation.RuntimeUiWaitCheckResult.New() end

---@class Witch.UI.Automation.RuntimeUiAutomationFacade : System.Object
Witch.UI.Automation.RuntimeUiAutomationFacade = {}
---@alias CS.Witch.UI.Automation.RuntimeUiAutomationFacade Witch.UI.Automation.RuntimeUiAutomationFacade
CS.Witch.UI.Automation.RuntimeUiAutomationFacade = Witch.UI.Automation.RuntimeUiAutomationFacade

---@param request Witch.UI.Automation.RuntimeUiSnapshotRequest
---@return Witch.UI.Automation.RuntimeUiSnapshot
function Witch.UI.Automation.RuntimeUiAutomationFacade:Snapshot(request) end
---@param request Witch.UI.Automation.RuntimeUiInteractionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeUiAutomationFacade:InteractAsync(request) end
---@param snapshot Witch.UI.Automation.RuntimeUiSnapshot
---@param request Witch.UI.Automation.RuntimeUiWaitRequest
---@return Witch.UI.Automation.RuntimeUiWaitCheckResult
function Witch.UI.Automation.RuntimeUiAutomationFacade:EvaluateWait(snapshot, request) end
---@param snapshot Witch.UI.Automation.RuntimeUiSnapshot
---@return string
function Witch.UI.Automation.RuntimeUiAutomationFacade:LayoutSignature(snapshot) end

---@class Witch.UI.Automation.RuntimeUiAutomationService : System.Object
---@field Facade Witch.UI.Automation.RuntimeUiAutomationFacade
Witch.UI.Automation.RuntimeUiAutomationService = {}
---@alias CS.Witch.UI.Automation.RuntimeUiAutomationService Witch.UI.Automation.RuntimeUiAutomationService
CS.Witch.UI.Automation.RuntimeUiAutomationService = Witch.UI.Automation.RuntimeUiAutomationService

---@overload fun(out_error: string) : boolean, string
---@param out_context Witch.UI.Automation.RuntimeUiContext
---@param out_error string
---@return boolean,Witch.UI.Automation.RuntimeUiContext,string
function Witch.UI.Automation.RuntimeUiAutomationService.TryGetContext(out_context, out_error) end
---@param request Witch.UI.Automation.RuntimeUiSnapshotRequest
---@return Witch.UI.Automation.RuntimeUiSnapshot
function Witch.UI.Automation.RuntimeUiAutomationService.CaptureSnapshot(request) end
---@param snapshot Witch.UI.Automation.RuntimeUiSnapshot
---@param request Witch.UI.Automation.RuntimeUiWaitRequest
---@return Witch.UI.Automation.RuntimeUiWaitCheckResult
function Witch.UI.Automation.RuntimeUiAutomationService.EvaluateWaitCondition(snapshot, request) end
---@param request Witch.UI.Automation.RuntimeUiInteractionRequest
---@return Cysharp.Threading.Tasks.UniTask
function Witch.UI.Automation.RuntimeUiAutomationService.InteractAsync(request) end
---@param snapshot Witch.UI.Automation.RuntimeUiSnapshot
---@return string
function Witch.UI.Automation.RuntimeUiAutomationService.CreateLayoutSignature(snapshot) end
