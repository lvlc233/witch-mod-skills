# CSV Authoring

CSV 文件优先从 `../../resources/official/ModTemplate/Data/...` 和 `../../resources/official/ModTemplate/Text/...` 复制同类样例，再在目标 Mod 副本中修改。

不要原地修改 `resources/official`。

## Slots To Fill

- `ModName`
- CSV file base name
- local ID
- runtime full ID
- Data fields
- Text fields
- script fields

## Pairing Rules

- Data/Text 需要同类型目录、同文件名、同局部 `Id` 配对。
- Row 1 是表头，row 2 是备注，数据从 row 3 开始。
- 文件名参与运行时完整 ID，改文件名会改变 runtime ID。
- `*` 可以保留在 CSV 局部 ID 中；runtime ID 去掉 `*`。
- 表头以复制来的目标 CSV 为准，不从其他表机械补列。
- Mod 新增条目通常用 runtime full ID 字符串引用，不用 `DataId.*`。

## Runtime ID Formula

```text
runtime full ID = ModName + "_" + CsvFileNameWithoutExtension + "_" + LocalIdWithoutLeadingStar
```

Example:

```text
ModName: Defect
File: cardsample.csv
Local ID: *defect_discharge
Runtime ID: Defect_cardsample_defect_discharge
```

## CSV Escaping

If a script contains commas, quotes, or multiple statements, wrap the whole cell in double quotes and double internal quotes.

```csv
"self:SetStatus(""Self""); self:AddBuff(""buff_vulnerability"", ""1"");"
```
