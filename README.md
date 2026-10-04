# Nebula — Discord Bot Deployment

A self-hosted, reproducible deployment of a modular Discord bot built on
[Red-DiscordBot](https://github.com/Cog-Creators/Red-DiscordBot) (GPLv3).

This repository is the **deployment layer**: environment setup, cog selection,
runtime and backups. It does **not** vendor or fork Red — Red is installed as a
pinned dependency, so upstream fixes flow in for free and there is no fork to
merge. Custom cogs authored for this deployment live in a separate repository.

> **Scope, honestly stated.** The bot engine, its bundled cogs and its features
> are the Red project's work, not mine. What I built and operate is the layer
> around it: the reproducible environment, the deterministic cog configuration,
> the backup and update tooling, the branding, and the documentation you are
> reading.

## The Nebula project

Nebula is split across two repositories that belong together:

| Repository | Role |
| --- | --- |
| **nebula** (this repo) | Deployment layer: environment, config, scripts, docs, branding. |
| **[nebula-cogs](https://github.com/kashcmdd/nebula-cogs)** | The original cogs written for Nebula (the `deepseek` AI assistant). |

Local working copies are the folders `discord-bot-deploy` (this repo) and
`discord-bot-cogs` (the cogs). This repo installs and runs Red and loads the
cogs from the other.

## Status

- [x] Python 3.11 virtualenv + Red 3.5.24
- [x] Instance `nebula` (owner, prefix `!`, token) — connects to the Gateway
- [x] 17 feature cogs loaded via `config/cogs.txt` (19 total with Core + CogManagerUI)
- [x] Backup, update, run and supervise scripts, plus docs
- [x] Branding: violet `#7C3AED` embed colour, description, help tagline, generated avatar
- [x] Custom cog: `deepseek` AI assistant (`discord-bot-cogs` repo) — `!ai`, mentions, reply, AI channel
- [ ] Unattended service (see `docs/setup.md`)
- [ ] Music / Lavalink (deferred)

## Layout

```
discord-bot-deploy/
├── assets/                # generated brand assets (avatar)
├── config/
│   ├── cogs.txt           # source of truth for loaded cogs
│   └── branding.json      # colour / description / help tagline
├── docs/
│   ├── architecture.md    # diagram + decisions + failure/recovery
│   └── setup.md           # reproduce from scratch
├── scripts/
│   ├── install.ps1        # create venv + install Red
│   ├── new-instance.ps1   # create the instance
│   ├── configure.ps1      # owner / prefix / token
│   ├── load-cogs.ps1      # apply config/cogs.txt
│   ├── add-cog-path.ps1   # register a local cog path (like [p]addpath)
│   ├── set-api-key.ps1    # store a shared API token (hidden prompt)
│   ├── brand.ps1          # apply config/branding.json
│   ├── make-avatar.ps1    # generate assets/nebula-avatar.png
│   ├── start.ps1          # run in foreground
│   ├── run-loop.ps1       # supervised: restart on crash
│   ├── backup.ps1         # redbot-setup backup + prune
│   └── update.ps1         # upgrade Red
├── tools/
│   ├── command_reference.py  # generate docs/commands.md
│   └── set_api_key.py        # write a shared API token via Red's config
├── data/                  # gitignored — token, config, databases
├── backups/               # gitignored
└── logs/                  # gitignored
```

## Quick start

See [`docs/setup.md`](docs/setup.md). In short:

```powershell
./scripts/install.ps1
./scripts/new-instance.ps1 -InstanceName nebula
./scripts/configure.ps1 -Instance nebula -Owner <YOUR_ID> -Prefix "!"
./scripts/configure.ps1 -Instance nebula -Token
./scripts/load-cogs.ps1
./scripts/start.ps1
```

## Design notes

See [`docs/architecture.md`](docs/architecture.md) for the system diagram and the
reasoning behind each choice (Python pin, venv over pipx, explicit cog list,
JSON backend).

## License

This deployment layer is MIT (see `LICENSE`). It orchestrates
[Red-DiscordBot](https://github.com/Cog-Creators/Red-DiscordBot), distributed
under the GNU GPL v3. Red is **not** included in this repository; it is installed
from PyPI at deploy time. All credit for the bot engine and its bundled cogs
belongs to the Red project and its contributors.
