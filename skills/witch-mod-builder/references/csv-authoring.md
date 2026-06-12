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
