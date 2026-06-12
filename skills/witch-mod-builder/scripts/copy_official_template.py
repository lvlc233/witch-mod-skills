#!/usr/bin/env python3
"""Copy official Witch mod templates into a target mod workspace."""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path


def repo_root() -> Path:
    return Path(__file__).resolve().parents[3]


def official_root() -> Path:
    return repo_root() / "resources" / "official"


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(1)


def ensure_safe_target(target: Path) -> Path:
    target = target.expanduser().resolve()
    official = official_root().resolve()
    if target == official or official in target.parents:
        fail("target must not be inside resources/official")
    return target


def copy_dir(src: Path, dst: Path, overwrite: bool) -> list[Path]:
    if not src.exists():
        fail(f"missing source: {src}")
    if dst.exists() and any(dst.iterdir()) and not overwrite:
        fail(f"target exists and is not empty: {dst} (use --overwrite)")
    if dst.exists() and overwrite:
        shutil.rmtree(dst)
    shutil.copytree(src, dst, ignore=shutil.ignore_patterns(".DS_Store"))
    return [p for p in dst.rglob("*") if p.is_file()]


def copy_file(src: Path, dst: Path, overwrite: bool) -> Path:
    if not src.exists():
        fail(f"missing source: {src}")
    if dst.exists() and not overwrite:
        fail(f"target file exists: {dst} (use --overwrite)")
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
    return dst


def find_sample(kind: str, table_type: str, sample_name: str | None) -> Path:
    base = official_root() / "ModTemplate" / kind / table_type
    if not base.exists():
        fail(f"unknown {kind} type: {table_type}")
    if sample_name:
        name = sample_name if sample_name.endswith(".csv") else f"{sample_name}.csv"
        return base / name
    matches = sorted(base.glob("*sample.csv"))
    if len(matches) == 1:
        return matches[0]
    if not matches:
        fail(f"no sample csv found under {base}")
    fail(f"multiple sample files under {base}; pass --sample")


def command_lua_mod(args: argparse.Namespace) -> None:
    target = ensure_safe_target(Path(args.to))
    copied = copy_dir(official_root() / "ModTemplate", target, args.overwrite)
    print(f"copied Lua Mod template to {target}")
    print(f"files: {len(copied)}")
    print("next: edit ModConfig.json, Data/Text CSV, Scripts/Entry.lua, and resource paths")


def command_dll_mod(args: argparse.Namespace) -> None:
    target = ensure_safe_target(Path(args.to))
    copied = copy_dir(official_root() / "DllTemplate", target, args.overwrite)
    print(f"copied C# DLL Hook template to {target}")
    print(f"files: {len(copied)}")
    print("next: edit ModConfig.json and Dev/Entry.cs, then rebuild Entry.dll")


def command_csv(args: argparse.Namespace) -> None:
    target = ensure_safe_target(Path(args.to))
    table_type = args.type
    data_src = find_sample("Data", table_type, args.sample)
    text_src = find_sample("Text", table_type, args.sample)
    output_name = args.name or data_src.name
    if not output_name.endswith(".csv"):
        output_name = f"{output_name}.csv"
    data_dst = target / "Data" / table_type / output_name
    text_dst = target / "Text" / table_type / output_name
    copied = [
        copy_file(data_src, data_dst, args.overwrite),
        copy_file(text_src, text_dst, args.overwrite),
    ]
    print(f"copied {table_type} Data/Text templates to {target}")
    for path in copied:
        print(f"- {path}")
    print("next: keep row 1/2, fill local Ids, and compute runtime IDs from ModName + file name + local Id")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)

    lua = sub.add_parser("lua-mod", help="copy official ModTemplate")
    lua.add_argument("--to", required=True, help="target mod directory")
    lua.add_argument("--overwrite", action="store_true", help="replace target directory if it exists")
    lua.set_defaults(func=command_lua_mod)

    dll = sub.add_parser("dll-mod", help="copy official DllTemplate")
    dll.add_argument("--to", required=True, help="target mod directory")
    dll.add_argument("--overwrite", action="store_true", help="replace target directory if it exists")
    dll.set_defaults(func=command_dll_mod)

    csv = sub.add_parser("csv", help="copy paired Data/Text CSV samples")
    csv.add_argument("type", help="CSV type such as Card, Buff, Partner, PartnerCard")
    csv.add_argument("--to", required=True, help="target mod directory")
    csv.add_argument("--sample", help="source sample file name; defaults to the only *sample.csv")
    csv.add_argument("--name", help="output csv file name; defaults to the source sample name")
    csv.add_argument("--overwrite", action="store_true", help="replace target files if they exist")
    csv.set_defaults(func=command_csv)

    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    args.func(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
