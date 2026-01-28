# Superpowers for Gemini

This project uses the **Superpowers** skills system to ensure high-quality engineering.

## Critical Instructions

- **Sequential Execution:** You MUST execute only ONE tool call per turn. Wait for the output before initiating the next tool call. This prevents "API Error 400".
- **Always check for skills** before starting any task.
- Use the `activate_skill` tool to load relevant skills.
- The `using-superpowers` skill is the entry point for understanding the system.
- Follow the **Brainstorming -> Planning -> Implementation (TDD)** workflow.

## Skill Locations
Skills are located in the `skills/` directory and should be symlinked to `~/.gemini/skills/` for the CLI to discover them.

## Tool Mappings
- `Skill` tool -> `activate_skill`
- `Bash` -> `run_shell_command`
- `Read` -> `read_file`
- `Write` -> `write_file`
- `Edit` -> `replace`
- `Subagents` -> `delegate_to_agent`

## Workflow Checklist
1. [ ] **Brainstorm**: Run `activate_skill(name: "brainstorming")` for any new feature or non-trivial change.
2. [ ] **Plan**: Run `activate_skill(name: "writing-plans")` after the design is approved.
3. [ ] **Implement**: Run `activate_skill(name: "test-driven-development")` during coding.
4. [ ] **Debug**: Run `activate_skill(name: "systematic-debugging")` for any bugs.
