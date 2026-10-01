#!/usr/bin/env python3
"""Ping the DeepSeek API using the key stored in an instance's config.

Reads the shared `deepseek.api_key` token and sends one small request, so you
can confirm the key and model work without going through Discord.

    .venv\\Scripts\\python.exe tools\\check_deepseek.py [model]
"""
from __future__ import annotations

import asyncio
import json
import sys
from pathlib import Path

import aiohttp

API_URL = "https://api.deepseek.com/chat/completions"
SETTINGS = Path(__file__).resolve().parent.parent / "data" / "core" / "settings.json"


def load_key() -> str:
    data = json.loads(SETTINGS.read_text(encoding="utf-8"))
    return data["0"]["SHARED_API_TOKENS"]["deepseek"]["api_key"]


async def main(model: str) -> None:
    key = load_key()
    payload = {
        "model": model,
        "messages": [
            {"role": "system", "content": "You are terse."},
            {"role": "user", "content": "Reply with exactly: OK"},
        ],
        "max_tokens": 32,
        "stream": False,
        "thinking": {"type": "disabled"},
    }
    headers = {"Authorization": f"Bearer {key}", "Content-Type": "application/json"}
    async with aiohttp.ClientSession() as session:
        async with session.post(
            API_URL, json=payload, headers=headers, timeout=aiohttp.ClientTimeout(total=120)
        ) as resp:
            data = await resp.json(content_type=None)

    print(f"HTTP {resp.status}")
    if resp.status != 200:
        print("error:", json.dumps(data)[:500])
        raise SystemExit(1)
    print("model returned:", data.get("model"))
    print("reply:", data["choices"][0]["message"]["content"].strip())


if __name__ == "__main__":
    model = sys.argv[1] if len(sys.argv) > 1 else "deepseek-flash"
    asyncio.run(main(model))
