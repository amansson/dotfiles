# Tools Guide

Command reference for the tools installed by [brewfile](brewfile).

## Setup

```sh
xcode-select --install
brew bundle --file=brewfile
./install.sh
```

`install.sh` installs Homebrew packages, links configuration files, updates the Dock, and applies macOS preferences. It is intended for Apple Silicon Macs.

After setup, restart Ghostty so its font and Tokyo Night theme settings are loaded.

## Shell

Ghostty is the terminal application. Fish is the shell running inside it. Starship is the prompt renderer used by Fish.

| Tool | Commands |
|---|---|
| `fish` | `fish`, `fish_config` |
| `starship` | `starship prompt`, `starship timings`, `starship print-config` |
| `zoxide` | `z project`, `zi` for an interactive directory picker |
| `fnm` | `fnm install --lts`, `fnm list`, `fnm use 22`, `fnm default 22` |

Fish initializes `fnm` automatically and changes Node versions when a project contains a supported version file.

## Files and Search

| Tool | Replaces | Useful commands |
|---|---|---|
| `eza` | `ls` | `ls`, `ll`, `eza --tree --level=2` |
| `fd` | `find` | `fd config`, `fd -e ts`, `fd -H .gitignore` |
| `rg` | `grep` | `rg "TODO"`, `rg "functionName" src/` |
| `fzf` | interactive filtering | `fzf`, `history \| fzf`, `vim $(fzf)` |
| `bat` | `cat` | `bat file.ts`, `bat -n file.ts` |
| `jq` | manual JSON reading | `cat data.json \| jq .`, `jq '.items[]' data.json` |
| `wget` | file downloads | `wget https://example.com/file.zip` |

Fish aliases:

```fish
ls      # eza
ll      # eza -la
lg      # lazygit
ld      # lazydocker
```

## Git

| Command | Purpose |
|---|---|
| `git s` | Short status |
| `git sw branch` | Switch branches |
| `git go branch` | Create a branch, or switch if it already exists |
| `git am` | Amend the latest commit |
| `git unstage file` | Remove a file from the staging area |
| `git last` | Show the latest commit |
| `git status -sb` | Show branch and working-tree status |
| `git switch -c branch` | Create and switch to a branch |
| `git fetch --prune` | Update remote references and remove deleted ones |
| `git pull --rebase` | Update without creating a merge commit |
| `git log --oneline --graph --decorate` | Compact history graph |
| `git diff` | Show changes through Delta |
| `git restore file` | Discard unstaged changes to a file; use carefully |

`git-delta` formats `git diff` output. `gh` handles GitHub workflows:

```sh
gh auth login
gh repo clone OWNER/REPOSITORY
gh pr create
gh pr status
gh issue list
```

GPG signing is enabled globally. Commits require a configured signing key on the new Mac.

## Docker and Colima

Colima provides the Docker runtime; Docker Desktop is not installed.

```sh
colima start
colima status
colima stop
docker version
docker ps
docker compose up -d
docker compose down
lazydocker
```

Useful Colima options:

```sh
colima start --cpu 4 --memory 8 --disk 60
colima delete
```

Run `colima start` before using Docker after a restart. `lazydocker` is available through the `ld` Fish alias.

## Node.js

```sh
node --version
fnm install --lts
fnm use --install-if-missing 22
npm --version
npx <package> 
```

Use a project version file such as `.node-version` when a project needs a specific Node release.

## Shell Scripts

```sh
bash -n install.sh scripts/*.sh
shellcheck install.sh scripts/*.sh
```

The scripts are Bash scripts even though Fish is the interactive shell.

## API and Desktop Apps

| App | Use |
|---|---|
| Ghostty | Terminal emulator |
| Brave Browser | Web browser |
| Visual Studio Code | Code editor; Git uses `code --wait` |
| Hoppscotch | API development and testing |
| Slack | Team communication |
| Spotify | Music |
| 1Password | Password manager; `op` is its CLI |
| Rectangle | Window management |
| Maccy | Clipboard history |

## Maintenance

```sh
brew update
brew upgrade
brew bundle check --file=brewfile
brew cleanup
```

Check installed packages:

```sh
brew list
brew list --cask
brew outdated
```
