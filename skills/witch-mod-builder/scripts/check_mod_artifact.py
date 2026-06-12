#!/usr/bin/env python3
"""Static checks for Witch mod artifacts produced from official templates."""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from pathlib import Path


PLACEHOLDERS = [
    "YourModName",
    "OriginalRole",
    "YourRole",
    "ModTemplate",
]

FORBIDDEN_PATTERNS = [
    ("C# generic event syntax", re.compile(r"AddEvent\s*<")),
    ("C# dictionary index syntax Vars[", re.compile(r"\bVars\s*\[")),
    ("C# foreach syntax", re.compile(r"\bforeach\s*\(")),
    ("C# new Dictionary", re.compile(r"new\s+Dictionary\s*<")),
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[3]


def official_root() -> Path:
    return repo_root() / "resources" / "official"


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(2)


def is_inside(path: Path, parent: Path) -> bool:
    path = path.resolve()
    parent = parent.resolve()
    return path == parent or parent in path.parents


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8-sig", errors="replace")


def check_csv_rows(path: Path) -> list[str]:
    issues: list[str] = []
    try:
        with path.open("r", encoding="utf-8-sig", newline="") as handle:
            rows = list(csv.reader(handle))
    except Exception as exc:  # noqa: BLE001 - report file-specific issue
        return [f"{path}: cannot parse csv: {exc}"]
    if len(rows) < 2:
        issues.append(f"{path}: CSV must keep row 1 header and row 2 note")
    if rows and "Id" not in rows[0]:
        issues.append(f"{path}: header row does not contain Id")
    return issues


def collect_csv_pairs(mod_root: Path) -> list[str]:
    issues: list[str] = []
    data_root = mod_root / "Data"
    text_root = mod_root / "Text"
    if not data_root.exists() and not text_root.exists():
        return issues
    for data_file in data_root.rglob("*.csv") if data_root.exists() else []:
        rel = data_file.relative_to(data_root)
        if not (text_root / rel.parts[0]).exists():
            continue
        text_file = text_root / rel
        if not text_file.exists():
            issues.append(f"{data_file}: missing paired Text/{rel}")
    for text_file in text_root.rglob("*.csv") if text_root.exists() else []:
        rel = text_file.relative_to(text_root)
        if not (data_root / rel.parts[0]).exists():
            continue
        data_file = data_root / rel
        if not data_file.exists():
            issues.append(f"{text_file}: missing paired Data/{rel}")
    return issues


def scan_text_files(mod_root: Path) -> list[str]:
    issues: list[str] = []
    for path in mod_root.rglob("*"):
        if not path.is_file() or path.suffix.lower() in {".png", ".dll", ".zip"}:
            continue
        rel = path.relative_to(mod_root)
        if rel.parts[:2] == ("Scripts", "Lib"):
            continue
        text = read_text(path)
        for placeholder in PLACEHOLDERS:
            if placeholder in text:
                issues.append(f"{rel}: placeholder remains: {placeholder}")
        for label, pattern in FORBIDDEN_PATTERNS:
            if pattern.search(text):
                issues.append(f"{rel}: possible Lua-incompatible pattern: {label}")
        if re.search(r'["\']\*[^"\']+["\']', text):
            issues.append(f"{rel}: possible runtime reference still uses local *Id")
    return issues


def check_mod_config(mod_root: Path) -> list[str]:
    config = mod_root / "ModConfig.json"
    if not config.exists():
        return [f"{mod_root}: missing ModConfig.json"]
    try:
        data = json.loads(read_text(config))
    except Exception as exc:  # noqa: BLE001
        return [f"{config}: invalid json: {exc}"]
    issues: list[str] = []
    for key in ["ModName", "ModAuthor", "ModVersion", "ModDescription", "IconPath"]:
        if not data.get(key):
            issues.append(f"{config}: missing or empty {key}")
    if data.get("Enabled") is not True:
        issues.append(f"{config}: Enabled is not true")
    return issues


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mod_root", help="target mod directory")
    args = parser.parse_args(argv)

    mod_root = Path(args.mod_root).expanduser().resolve()
    if not mod_root.exists():
        fail(f"target does not exist: {mod_root}")
    if is_inside(mod_root, official_root()):
        fail("refusing to check a target inside resources/official")

    issues: list[str] = []
    issues.extend(check_mod_config(mod_root))
    issues.extend(collect_csv_pairs(mod_root))
    for csv_path in sorted((mod_root / "Data").rglob("*.csv")) if (mod_root / "Data").exists() else []:
        issues.extend(check_csv_rows(csv_path))
    for csv_path in sorted((mod_root / "Text").rglob("*.csv")) if (mod_root / "Text").exists() else []:
        issues.extend(check_csv_rows(csv_path))
    issues.extend(scan_text_files(mod_root))

    if issues:
        print("FAILED")
        for issue in issues:
            print(f"- {issue}")
        return 1
    print("OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
