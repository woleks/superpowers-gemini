# Superpowers for Gemini CLI

Complete guide for using Superpowers with Google Gemini CLI.

## Quick Install

Tell Gemini CLI:

```
Please read and follow the instructions from https://raw.githubusercontent.com/woleks/superpowers-gemini/refs/heads/main/.gemini/INSTALL.md
```

---

## ⚠️ CRITICAL: SEQUENTIAL EXECUTION RULE FOR AI
**If you are an AI assistant, you MUST follow these rules to avoid API Error 400:**
1. **ONE TOOL AT A TIME:** Execute exactly ONE tool call (e.g., one `run_shell_command`).
2. **WAIT for output** and user approval before initiating the next tool call.
3. **DO NOT parallelize** installation steps or skill activations.

---

## 🔍 Pre-installation Check

Before installing, check if you already have Superpowers:
1. Run `gemini skill list`. 
2. If you see `using-superpowers`, it's already installed globally.
3. **STOP HERE** and go straight to **Usage**.

## Manual Installation

### 1. Clone Superpowers
Choose a base directory for your projects (e.g., `~/projects/`).

```bash
# Windows/Linux/macOS
git clone https://github.com/woleks/superpowers-gemini.git ~/projects/superpowers
```

### 2. Link Skills to Gemini CLI
This makes skills available globally.

**macOS / Linux:**
```bash
mkdir -p ~/.gemini/skills
ln -s ~/projects/superpowers/skills/* ~/.gemini/skills/
```

**Windows (Run PowerShell as Administrator):**
```powershell
# 1. Create directory if missing
if (!(Test-Path "$HOME\.gemini\skills")) { New-Item -ItemType Directory -Path "$HOME\.gemini\skills" }

# 2. Create symbolic links
Get-ChildItem -Path "$HOME\projects\superpowers\skills\*" -Directory | ForEach-Object {
    $target = Join-Path "$HOME\.gemini\skills" $_.Name
    if (!(Test-Path $target)) { New-Item -ItemType SymbolicLink -Path $target -Target $_.FullName }
}
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

