# Witch Mod Skills

面向《Witch's Apocalyptic Journey》Mod 开发的 Codex skills。

## 结构

```text
skills/
  witch-mod-api/
  witch-mod-research/
  witch-mod-teaching/
  witch-mod-builder/
resources/
  official/
```

## Skill 职责

- `witch-mod-api`：干净 API 边界，只回答整理后的 API references 能确认什么。
- `witch-mod-research`：第一事实调研，读取 `resources/` 中的官方模板、Example、Lib、反编译和其他 Mod。
- `witch-mod-teaching`：中文教学、问题表评估、学习路径，只讲已确认事实。
- `witch-mod-builder`：创建或修改 Mod 文件，优先从 `resources/official` 复制官方模板。

## 安装

先克隆仓库：

```bash
git clone git@github.com:lvlc233/witch-mod-skills.git
cd witch-mod-skills
```

推荐用软链接安装到 Codex skills 目录，这样后续 `git pull` 后 skill 和 `resources/` 会一起更新：

```bash
mkdir -p ~/.codex/skills
ln -s "$(pwd)/skills/witch-mod-api" ~/.codex/skills/witch-mod-api
ln -s "$(pwd)/skills/witch-mod-research" ~/.codex/skills/witch-mod-research
ln -s "$(pwd)/skills/witch-mod-teaching" ~/.codex/skills/witch-mod-teaching
ln -s "$(pwd)/skills/witch-mod-builder" ~/.codex/skills/witch-mod-builder
```

如果不想用软链接，也可以复制：

```bash
mkdir -p ~/.codex/skills
cp -R skills/witch-mod-api ~/.codex/skills/
cp -R skills/witch-mod-research ~/.codex/skills/
cp -R skills/witch-mod-teaching ~/.codex/skills/
cp -R skills/witch-mod-builder ~/.codex/skills/
```

复制安装时要注意：`witch-mod-research` 和 `witch-mod-builder` 默认按 skill 目录相对路径读取 `../../resources/`。如果只复制 `skills/*` 而不复制 `resources/`，调研和官方模板复制能力会缺失。需要保持如下相对结构：

```text
<some-root>/
  skills/
    witch-mod-api/
    witch-mod-research/
    witch-mod-teaching/
    witch-mod-builder/
  resources/
    official/
```

软链接安装不需要额外处理，因为 skill 仍然指向本仓库内的真实目录。

## 使用

在 Codex 中直接描述任务即可触发对应 skill，例如：

```text
用 Witch Mod API 检查这个问题是否能确认：PackBelong 怎么生效？
```

```text
用 Witch Mod Research 从 resources 里调研 EventList 和 Dialogue 的关系，给出来源路径和可推广范围。
```

```text
用 Witch Mod Builder 基于官方 ModTemplate 创建一个最小 Lua Mod。
```

```text
用 Witch Mod Teaching 解释局部 ID、运行时完整 ID、ModId、DataId 的区别。
```

推荐职责拆分：

- API 支持度判断：用 `witch-mod-api`。
- 第一事实调研：用 `witch-mod-research`。
- 学习解释和问题表：用 `witch-mod-teaching`。
- 写 Mod 文件：用 `witch-mod-builder`。

## Resources

`resources/official` 默认存放用户提供的官方材料：

- `ModTemplate/`
- `DllTemplate/`
- `Example/`
- `README.zh-CN.md`
- 反编译资料

Skill 不使用环境变量，默认按仓库相对路径查找 `resources/`。

## 官方来源

参考官方教程仓库：

- https://github.com/meowalive/apocalyptic-journey-mod-tutorial.git
- https://github.com/meowalive/apocalyptic-journey-mod-tutorial#

## License

Skill 指令和本仓库自写内容按 MIT License 发布。`resources/` 中的官方材料、反编译材料和用户提供材料保留其原始来源和许可边界。
