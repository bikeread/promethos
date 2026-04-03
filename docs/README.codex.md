# PromethOS for Codex

PromethOS uses Codex native skill discovery. Once the repository's `skills/`
directory is visible under `~/.agents/skills/`, Codex can load the library on
demand.

## Quick Install

Follow [../.codex/INSTALL.md](../.codex/INSTALL.md).

## How It Works

Codex scans `~/.agents/skills/` at startup and reads `SKILL.md` frontmatter to
decide what to load.

With PromethOS installed, Codex sees:

```text
~/.agents/skills/promethos/ -> ~/.codex/promethos/skills/
```

The `using-promethos` bootstrap skill then tells the agent when PromethOS
should lead directly and when it should act as an agent-domain layer inside a
broader workflow.

## Coexistence

If `superpowers` or another broader workflow library is also installed:

- let that library own session-wide process control,
- use PromethOS for agent-system requirements, architecture, context, memory,
  permissions, autonomy, evaluation, and library evolution,
- prefer explicit prompts such as `use PromethOS` when you want PromethOS to
  take the lead on an agent-domain task.

## Updating

Update your local clone and restart Codex.

## Troubleshooting

- Verify the symlink: `ls -la ~/.agents/skills/promethos`
- Verify the skill directories exist: `find ~/.codex/promethos/skills -maxdepth 2 -name SKILL.md`
- Restart Codex after any change to skill layout
