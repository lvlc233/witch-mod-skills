# Witch Mod Skills Design

本文档记录本仓库的目标设计、当前完成状态和质量检查点。它用于防止 skill 只停留在口头设计。

## 目标

把《Witch's Apocalyptic Journey》Mod 开发相关能力拆成职责清晰的 Codex skills，并把官方模板、Example、Lib、反编译资料放入可调研的 `resources/`。

## 目录设计

```text
skills/
  witch-mod-api/
  witch-mod-research/
  witch-mod-case-guide/
  witch-mod-builder/
resources/
  official/
```

不设置 `tests/skill-checks/`。质量检查以 skill validator、结构检查和人工审查清单为主。

## Skill 职责

| Skill | 职责 | 不做什么 | 状态 |
|---|---|---|---|
| `witch-mod-api` | 只回答整理后的 API references 能确认什么 | 不读取 `resources/`，不做第一事实调研 | 已完成基础版 |
| `witch-mod-research` | 带着 API 结论、用户线索和问题假设调研第一事实 | 不直接写最终 API 文档，不生成 Mod 文件 | 已补强方法版 |
| `witch-mod-case-guide` | 给 agent 用的案例桥梁：把用户目标转成案例、API 查询点、resources 调研点和 builder brief | 不自己翻第一事实，不生产文件，不把案例当权威事实 | 已重设为案例方法版 |
| `witch-mod-builder` | 从官方模板复制并生成/修改 Mod 文件 | 不维护自造模板，不猜复杂机制 | 已补强方法版 |

## 事实层级

| 层级 | 来源 | 用法 |
|---|---|---|
| 第一事实 | `resources/official/ModTemplate`、`DllTemplate`、`Example`、`README.zh-CN.md`、`ModTemplate/Scripts/Lib` | 官方材料观察；区分模板规则、样例现象和 Lib 参考 |
| 1.5 级事实 | 反编译资料、运行观察 | 解释机制；必须标注版本、路径和推断链 |
| 第二事实 | `skills/witch-mod-api/references` | 干净 API 手册；用于快速边界判断 |
| 外部参考 | 用户放入 `resources/` 的其他 Mod 或资料 | 辅助对比；不能覆盖官方事实 |

## 设计原则

- API skill 保持干净，不能因为调研需求而污染事实边界。
- Research skill 是“深度思考和证据收集”入口，必须显式使用用户线索和 API 缺口。
- Case Guide skill 是 agent 的案例桥梁；遇到缺口时生成 research 任务，遇到可实现目标时生成 builder brief。
- Builder skill 以官方模板为起点；所有改动发生在目标 Mod 副本，不改 `resources/official`。
- `resources/` 是可扩展调研材料区，可以包含官方材料、反编译、用户提供的其他 Mod。

## 已完成

- 建立独立 GitHub 仓库。
- 建立 `skills/` 与 `resources/` 结构。
- 放入四个 skill 骨架。
- 放入官方默认资源。
- README 包含安装、使用、官方来源和许可边界。
- `.gitignore` 忽略 `.DS_Store`。
- 四个 skill 基础结构通过 `quick_validate.py`。

## 已补强方法

- `witch-mod-research` 需要能指导 agent：
  - 读取 API 支持度和缺口。
  - 使用用户线索形成调研假设。
  - 在模板、Example、Lib、反编译之间交叉验证。
  - 输出可沉淀、可追溯的结论。
- `witch-mod-case-guide` 需要能指导 agent：
  - 把用户目标归类到具体 Mod 案例。
  - 为案例列出 API 查询点和 resources 调研点。
  - 生成给 builder 的 brief、不可越界项和验证清单。
  - 处理问题表，但重点是路由到 API/research/builder，而不是人类教学。
- `witch-mod-builder` 需要能指导 agent：
  - 选择官方模板。
  - 复制、裁剪、改写模板。
  - 对 ID、CSV、Lua、资源和运行风险做检查。
- `resources/` 需要资源索引，说明每类材料回答什么问题。

上述内容已分别沉淀到：

- `skills/witch-mod-research/references/deep-research-method.md`
- `skills/witch-mod-case-guide/references/case-method.md`
- `skills/witch-mod-builder/references/template-driven-development.md`
- `resources/README.md`

## 后续验证

这些方法文件还需要用真实任务做 forward-test：

- 用 `witch-mod-research` 调研一个 API 不足的问题，例如 `PackBelong` 或 EventList/Dialog 关系。
- 用 `witch-mod-case-guide` 处理“使魔/宠物系统”目标，观察是否能生成 API 查询点、resources 调研点和 builder brief。
- 用 `witch-mod-builder` 从官方模板复制生成一个最小 Lua Mod，观察是否会误改 `resources/official`。

## 质量检查清单

每次修改后至少检查：

- `quick_validate.py` 对四个 skill 全部通过。
- `find . -name .DS_Store -type f` 无输出。
- `git status --short` 只包含预期文件。
- 不存在 `tests/skill-checks/`。
- `skills/witch-mod-builder/assets/templates/` 不存在。
- README 安装说明仍与目录结构一致。
- Research/case-guide/builder 的工作流能对应本文档的职责边界。
