# Superpowers for Gemini CLI

Complete guide for using Superpowers with Google Gemini CLI.

## Quick Install

Tell Gemini CLI:

```
Please read and follow the instructions from https://raw.githubusercontent.com/woleks/superpowers-gemini/refs/heads/main/.gemini/INSTALL.md
```

## 🔍 Pre-installation Check

Before installing, check if you already have Superpowers:
1. Run `gemini skill list`. 
2. If you see `using-superpowers`, it's already installed globally.
3. **SKIP** the installation steps below and go straight to **Usage**.

## Manual Installation

### 1. Clone Superpowers

```bash
mkdir -p ~/projects/superpowers
git clone https://github.com/woleks/superpowers-gemini.git ~/projects/superpowers
```

### 2. Link Skills to Gemini CLI

Gemini CLI loads skills from `~/.gemini/skills/`. To make Superpowers available:

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

### 3. Verify Installation

Run:
```bash
gemini skill list
```

You should see `using-superpowers`, `brainstorming`, etc., in the list.

## Usage

### Starting a session

Always start your session by activating the `using-superpowers` skill:

```
activate_skill(name: "using-superpowers")
```

This will set the ground rules for the entire session.

### Tool Mapping

Gemini CLI tools are mapped as follows:
- `Skill` tool → `activate_skill`
- `Bash` / `Terminal` → `run_shell_command`
- `Read` → `read_file`
- `Write` → `write_file`
- `Edit` → `replace`
- `Subagents` → `delegate_to_agent(agent_name: "codebase_investigator", ...)` or `delegate_to_agent` in general.

## Why Superpowers?

Superpowers provides a disciplined workflow for:
1. **Brainstorming** before coding.
2. **Test-Driven Development** (TDD).
3. **Systematic Debugging**.
4. **Implementation Planning**.

By following these skills, Gemini CLI becomes much more capable and reliable for complex engineering tasks.

