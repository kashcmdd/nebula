#!/usr/bin/env python3
"""Set a Red shared API token directly in an instance's config.

Uses Red's own config driver, so the value is written in exactly the shape
`[p]set api` would produce — without the key passing through Discord.

Run with the deployment venv while the bot is stopped:

    .venv\\Scripts\\python.exe tools\\set_api_key.py <instance> <service> [token_name]

The key is read from the prompt (hidden), never from the command line.
"""
from __future__ import annotations

import asyncio
import getpass
import sys

from redbot.core import data_manager
from redbot.core.config import Config

SHARED_API_TOKENS = "SHARED_API_TOKENS"


def _read_secret(service: str, token_name: str) -> str:
    """Read the secret; hidden prompt when interactive, stdin otherwise."""
    if sys.stdin.isatty():
        return getpass.getpass(f"Paste the {service} {token_name} (hidden): ").strip()
    return sys.stdin.readline().strip()


async def main(instance: str, service: str, token_name: str) -> None:
    secret = _read_secret(service, token_name)
    if not secret:
        print("No value entered; nothing changed.")
        return

    data_manager.load_basic_configuration(instance)
    core_conf = Config.get_core_conf(force_registration=True)
    core_conf.init_custom(SHARED_API_TOKENS, 2)

    async with core_conf.custom(SHARED_API_TOKENS, service).all() as group:
        group[token_name] = secret

    print(f"Stored {service}.{token_name} for instance '{instance}'.")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("usage: set_api_key.py <instance> <service> [token_name]")
        raise SystemExit(2)
    instance = sys.argv[1]
    service = sys.argv[2]
    token_name = sys.argv[3] if len(sys.argv) > 3 else "api_key"
    asyncio.run(main(instance, service, token_name))
