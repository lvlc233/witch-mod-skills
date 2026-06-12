# 魔女：终末旅途 Mod 教程

[English](README.md) | 中文

本仓库用于整理《魔女：终末旅途》的 Mod 模板、示例和开发说明。新建 Mod 时，优先从 `ModTemplate` 或 `DllTemplate` 复制一份到自己的 Mod 目录，再按目录内 README 修改配置与脚本。

## 目录说明

| 目录 | 内容 |
| --- | --- |
| `ModTemplate/` | Lua Mod 模板，包含 `ModConfig.json`、入口脚本、Data/Text 示例表、资源目录和原版配置参考。适合大多数新增卡牌、Buff、文本、资源重定向和 Lua Hook。 |
| `DllTemplate/` | C# DLL Hook 模板，包含开发工程、示例入口和编译后的 `Scripts/Entry.dll` 放置结构。适合需要 C# 语言特性或更复杂 Hook 的 Mod。 |
| `Example/` | 已完成示例 Mod。`Example/Defect` 展示了如何组织配置表、Lua 入口脚本和 `ModResource` 动画资源。 |

## 文件说明

| 文件 | 内容 |
| --- | --- |
| `LICENSE` | 仓库许可证。 |
| `.gitignore` | Git 忽略规则。 |

## 快速开始

1. 选择模板：
   - 普通 Lua Mod：复制 `ModTemplate`。
   - C# DLL Hook Mod：复制 `DllTemplate`。
2. 将复制出的目录改名为你的 Mod 名称，并保持目录名与 `ModConfig.json` 中的 `ModName` 一致。
3. 修改 `ModConfig.json`，至少填写 `ModName`、`ModAuthor`、`ModVersion`、`ModDescription` 和 `IconPath`。
4. 按需求编辑：
   - Lua 入口：`Scripts/Entry.lua`
   - 数值配置：`Data/`
   - 文本配置：`Text/`
   - 图片、动画等资源：`ModResource/`
5. 参考模板内说明：
   - Lua 模板：[ModTemplate/README.md](ModTemplate/README.md)
   - C# DLL 模板：[DllTemplate/readme.md](DllTemplate/readme.md)
   - 示例 Mod：[Example/Defect/README.md](Example/Defect/README.md)

## 上传创意工坊

Mod 完成并在本地验证后，使用游戏随包携带的上传工具：

`D:\Witch's Apocalyptic Journey\Witch's Apocalyptic Journey_Data\StreamingAssets\Mod Upload Tool\WorkshopUploader.exe`

详细步骤见 [ModTemplate/README.zh-CN.md#10-发布-mod](ModTemplate/README.zh-CN.md#10-发布-mod)。
