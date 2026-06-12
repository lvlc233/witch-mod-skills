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
