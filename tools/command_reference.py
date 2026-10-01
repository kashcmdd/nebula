#!/usr/bin/env python3
"""Generate a command reference for the cogs this deployment loads.

Introspects the installed cogs (and Red's Core / CogManagerUI) for their
registered commands, so the reference can never drift from what is actually
running. Writes docs/commands.md and prints a compact summary.

Run with the deployment venv:
    .venv\\Scripts\\python.exe tools\\command_reference.py
"""
from __future__ import annotations

import importlib
import pkgutil
import sys
from datetime import date
from pathlib import Path

from discord.ext import commands

import redbot.cogs

REPO_ROOT = Path(__file__).resolve().parent.parent
OUT_PATH = REPO_ROOT / "docs" / "commands.md"

# Cogs that live in redbot.core rather than redbot.cogs.
CORE_COGS = [
    ("Core", "redbot.core.core_commands"),
    ("CogManagerUI", "redbot.core._cog_manager"),
]


def find_cog_classes(module):
    found = []
    for obj in vars(module).values():
        if (
            isinstance(obj, type)
            and issubclass(obj, commands.Cog)
            and obj is not commands.Cog
            and getattr(obj, "__module__", "") == module.__name__
        ):
            found.append(obj)
    return found


def walk(prefix, command):
    """Yield (qualified_path, command) for a command and its subcommands."""
    name = f"{prefix}{command.name}"
    yield name, command
    if isinstance(command, commands.Group):
        for sub in command.commands:
            yield from walk(f"{name} ", sub)


def collect(module_name):
    module = importlib.import_module(module_name)
    entries = []
    seen = set()
    for cls in find_cog_classes(module):
        for command in getattr(cls, "__cog_commands__", []):
            # Subcommands are also class attributes; only start from top-level.
            if getattr(command, "parent", None) is not None:
                continue
            for path, cmd in walk("", command):
                if path in seen:
                    continue
                seen.add(path)
                entries.append((path, cmd))
    return entries


def first_line(text):
    if not text:
        return ""
    for line in text.strip().splitlines():
        line = line.strip()
        if line:
            return line
    return ""


def invocation(path, command):
    parts = ["!" + path]
    sig = getattr(command, "signature", "") or ""
    if sig:
        parts.append(sig)
    return " ".join(parts)


def bundled_cogs():
    for mod in pkgutil.iter_modules(redbot.cogs.__path__):
        name = mod.name
        if name.startswith("_") or name == "locales":
            continue
        yield name, f"redbot.cogs.{name}.{name}"


def main():
    groups = []  # (label, [(path, cmd)])

    for name, module_name in bundled_cogs():
        try:
            entries = collect(module_name)
        except Exception as exc:  # noqa: BLE001
            print(f"skip {name}: {exc}", file=sys.stderr)
            continue
        if entries:
            groups.append((name, entries))

    for label, module_name in CORE_COGS:
        try:
            entries = collect(module_name)
        except Exception as exc:  # noqa: BLE001
            print(f"skip {label}: {exc}", file=sys.stderr)
            continue
        if entries:
            groups.append((label, entries))

    total = sum(len(entries) for _, entries in groups)
    top_level = sum(
        1 for _, entries in groups for path, _ in entries if " " not in path
    )

    lines = [
        "# Command reference",
        "",
        f"Auto-generated from the installed cogs by `tools/command_reference.py` "
        f"on {date.today().isoformat()}.",
        "",
        f"**{total} commands across {len(groups)} cogs.** Prefix is `!` (shown as-is).",
        "",
        "`!help` and `!help <command>` are always available (Red's help command) "
        "and are not listed per-cog below.",
        "",
    ]

    for label, entries in groups:
        lines.append(f"## {label} ({len(entries)})")
        lines.append("")
        lines.append("| Command | Aliases | What it does |")
        lines.append("| --- | --- | --- |")
        for path, cmd in entries:
            aliases = ", ".join(f"`{a}`" for a in getattr(cmd, "aliases", [])) or "—"
            desc = first_line(getattr(cmd, "help", None) or getattr(cmd, "short_doc", ""))
            desc = desc.replace("|", "\\|")
            inv = invocation(path, cmd).replace("|", "\\|")
            lines.append(f"| `{inv}` | {aliases} | {desc} |")
        lines.append("")

    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUT_PATH}: {len(groups)} cogs, {top_level} top-level commands, "
          f"{total} including subcommands")

    for label, entries in groups:
        names = ", ".join(path for path, _ in entries if " " not in path)
        print(f"  {label} ({len(entries)}): {names}")


if __name__ == "__main__":
    main()
