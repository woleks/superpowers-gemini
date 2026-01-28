# Superpowers for Gemini CLI

Complete guide for using Superpowers with Google Gemini CLI.

## Quick Install

Tell Gemini CLI:

```
Please read and follow the instructions from https://raw.githubusercontent.com/woleks/superpowers-gemini/refs/heads/main/.gemini/INSTALL.md
```

## Manual Installation

### Prerequisites

- Gemini CLI installed (`npm install -g @google/gemini-cli`)
- Access to the internet for initial setup

### Installation Steps

#### 1. Clone Superpowers

```bash
mkdir -p ~/projects/superpowers
git clone https://github.com/woleks/superpowers-gemini.git ~/projects/superpowers
```

#### 2. Link Skills

Gemini CLI loads skills from `~/.gemini/skills/`. You can symlink the superpowers skills there:

**macOS / Linux:**
```bash
ln -s ~/projects/superpowers/skills/* ~/.gemini/skills/
```

**Windows (PowerShell as Administrator):**
```powershell
Get-ChildItem -Path "C:\path\to\superpowers\skills\*" -Directory | ForEach-Object {
    New-Item -ItemType SymbolicLink -Path "$HOME\.gemini\skills\$($_.Name)" -Target $_.FullName
}
```

#### 3. Verify Installation

Run:
```bash
gemini skill list
```

You should see the list of superpowers skills.

## Usage

### Starting a Session

Always start by activating the `using-superpowers` skill. You can also use the bootstrap file:

```
Please follow instructions in .gemini/superpowers-bootstrap.md
```

### Loading a Skill

```
activate_skill(name: "brainstorming")
```

### Common Tools Mapping

- `Skill` tool → `activate_skill`
- `Bash` / `Terminal` → `run_shell_command`
- `Read` → `read_file`
- `Write` → `write_file`
- `Edit` → `replace`
- `Subagents` → `delegate_to_agent`

## Architecture

Gemini CLI has a native skill system. Superpowers leverages this by providing a set of compatible `SKILL.md` files. 

Unlike Claude Code, which uses a plugin system, Gemini CLI integration is focused on:
1. **Skill discovery**: Ensuring the CLI can find the skill files.
2. **Context priming**: Using a bootstrap prompt to set the expectations for the agent.

## Updating

```bash
cd ~/projects/superpowers
git pull
```

Since the skills are symlinked, they will update automatically.
