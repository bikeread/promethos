# Codex Tool Mapping

PromethOS skills may use Claude Code tool names in examples. When running on
Codex, translate them like this:

| Skill reference | Codex equivalent |
|---|---|
| `Task` tool (dispatch subagent) | `spawn_agent` |
| Parallel `Task` calls | Multiple `spawn_agent` calls |
| Wait for subagent result | `wait_agent` |
| Close finished subagent | `close_agent` |
| `TodoWrite` | `update_plan` |
| `Skill` tool | Native skill loading; follow the loaded skill directly |
| `Read`, `Write`, `Edit` | Native file tools |
| `Bash` | Native shell tools |

## Notes

- Codex discovers skills from `~/.agents/skills/`.
- If the harness does not expose a required tool, adapt the workflow instead of
  pretending the tool exists.
