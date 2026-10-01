# Setup

Reproducing this deployment from scratch on Windows.

## 0. Prerequisites

- **Python 3.11** (not 3.12+). Red declares `python_requires = ">=3.8.1,<3.12"`.
  `uv` can provide one: `uv python install 3.11`.
- **Git**.

## 1. Create the environment

```powershell
./scripts/install.ps1
```

Creates `.venv` (Python 3.11) and installs `Red-DiscordBot`.

## 2. Create the Discord application

1. <https://discord.com/developers/applications> → **New Application**.
2. **Bot** → **Add Bot** → **Reset Token** → copy the token.
3. Enable all three **Privileged Gateway Intents**: Presence, Server Members,
   Message Content. Red needs all three.
4. **OAuth2 → URL Generator**: scopes `bot` + `applications.commands`,
   permissions `Administrator`. Open the URL to invite the bot.

Get your **owner ID**: Discord → Settings → Advanced → Developer Mode → right
click your avatar → Copy User ID.

## 3. Create the instance

```powershell
./scripts/new-instance.ps1 -InstanceName nebula
```

Creates the instance with its data directory at `./data` (gitignored).

## 4. Configure owner, prefix and token

```powershell
# owner + prefix
./scripts/configure.ps1 -Instance nebula -Owner <YOUR_ID> -Prefix "!"

# token (hidden prompt — never written to shell history)
./scripts/configure.ps1 -Instance nebula -Token
```

## 5. Load the cogs

Red ships **every cog unloaded**; only `Core` and `CogManagerUI` run by a
default. `config/cogs.txt` lists the cogs this deployment loads:

```powershell
./scripts/load-cogs.ps1
```

The equivalent in Discord is a single command:
`!load admin alias cleanup customcom downloader economy filter general image mod modlog mutes permissions reports streams trivia warnings`

## 6. Run it

```powershell
./scripts/start.ps1          # foreground
./scripts/run-loop.ps1       # supervised: restarts on crash, logs to logs/
```

## 7. Branding

Apply the embed colour, description and help tagline:

```powershell
./scripts/brand.ps1
```

Discord-side branding (set in the Developer Portal, since it needs the app, not
the instance):

1. **Avatar** — Developer Portal → General Information → App Icon → upload
   `assets/nebula-avatar.png`. Regenerate it any time with
   `./scripts/make-avatar.ps1`.
2. **Username** — Developer Portal → Bot → Username.

The script writes the same values as the in-Discord commands
`!set colour #7C3AED`, `!set description <text>` and `!helpset tagline <text>`.

## Running unattended

Two options, in order of robustness:

**A. Windows service (NSSM).** Starts at boot, no login required, restarts on
crash. Install NSSM (`winget install NSSM.NSSM`) and register the bot's
`.venv\Scripts\redbot.exe` with argument `nebula`.

> **Important:** Red locates the instance through a registry file under
> `%LOCALAPPDATA%\Red-DiscordBot`. A service running as a *different* account
> (e.g. `LocalSystem`) will not find it. Run the service **as your own user**,
> or set `LOCALAPPDATA` in the service environment to your own profile.

**B. Logon task / startup folder.** No extra tools, no stored password, but the
bot only runs while you are logged in. Put a shortcut to `scripts/run-loop.ps1`
in `shell:startup`.

## Backups

```powershell
./scripts/backup.ps1          # timestamped copy into backups/, keeps the last 14
```

Prefer running it while the bot is stopped for a consistent snapshot.

## Updating

```powershell
./scripts/update.ps1          # reinstall the latest Red
```

Then restart. Third-party cogs update separately: `[p]cog update`.
