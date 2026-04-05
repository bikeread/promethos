# Gemini CLI Tool Mapping

PromethOS skills may use Claude Code tool names in examples. When running on
Gemini CLI, translate them like this:

| Skill reference | Gemini CLI equivalent |
|---|---|
| `Read` | `read_file` |
| `Write` | `write_file` |
| `Edit` | `replace` |
| `Bash` | `run_shell_command` |
| `Grep` | `grep_search` |
| `Glob` | `glob` |
| `TodoWrite` | `write_todos` |
| `Skill` tool | `activate_skill` |
| `WebSearch` | `google_web_search` |
| `WebFetch` | `web_fetch` |
| `Task` tool (dispatch subagent) | No direct equivalent |

## Notes

- Gemini CLI does not provide Claude Code-style subagents, so any subagent
  pattern must be adapted into single-session execution.
- Use the loaded skill's intent, not the literal tool names, when translating a
  workflow.
