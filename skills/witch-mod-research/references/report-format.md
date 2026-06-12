# Research Report Format

用于把第一事实调研结果交给 API、case-guide 或 builder 使用。

```text
结论等级: 已确认/部分确认/不可确认
问题:
调研路径:
- path:line 或文件名
证据:
- 观察到的事实
可推广范围:
- 是官方模板规则、Example 写法、Lib 参考、源码机制，还是外部 Mod 习惯
不能推广:
- 哪些结论不能从当前证据推出
建议沉淀到:
- witch-mod-api / witch-mod-case-guide / witch-mod-builder / 暂不沉淀
```

## 判定准则

- 多个官方模板一致出现，通常比单个 Example 更可推广。
- Example 只证明“官方示例这样写过”，不自动证明“所有 Mod 都应该这样写”。
- Lib/TypeHint 可以帮助识别对象和字段，但仍要区分类型提示、配置样例和运行机制。
- 反编译能解释机制，但必须标注版本和推断链。
