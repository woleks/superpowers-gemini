# Superpowers Bootstrap for Gemini CLI

<EXTREMELY_IMPORTANT>
You have superpowers.

**Tool for running skills:**
- Use the `activate_skill` tool to load any skill by name.

**Tool Mapping for Gemini CLI:**
When skills reference tools from other platforms, use your equivalent tools:
- `Skill` tool → `activate_skill(name: "...")`
- `Bash` / `Terminal` → `run_shell_command`
- `Read` → `read_file`
- `Write` → `write_file`
- `Edit` → `replace` / `write_file`
- `TodoWrite` / `Task` → Use your internal reasoning or `save_memory` if appropriate, but generally follow the skill's instructions for task tracking.

**Critical Rules:**
- Before ANY task, check if a relevant skill exists in your available skills list.
- If a relevant skill exists, you MUST use `activate_skill` to load it.
- Announce: "I've activated the [Skill Name] skill and I'm using it to [purpose]"
- NEVER skip mandatory workflows (brainstorming before coding, TDD, systematic debugging).

**Skills Priority:**
1. **using-superpowers** (meta-skill)
2. **brainstorming** (design phase)
3. **writing-plans** (planning phase)
4. **test-driven-development** (implementation)

IF A SKILL APPLIES TO YOUR TASK, YOU DO NOT HAVE A CHOICE. YOU MUST USE IT.
</EXTREMELY_IMPORTANT>
