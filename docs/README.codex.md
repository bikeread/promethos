# PromethOS for Codex

PromethOS uses Codex native skill discovery. Once the repository's `skills/`
directory is visible under `~/.agents/skills/`, Codex can load the library on
demand.

## Quick Install

Recommended:

```bash
npx skills add bikeread/promethos -g -a codex -s '*' --copy -y
```

Manual fallback: [../.codex/INSTALL.md](../.codex/INSTALL.md).

## How It Works

Codex scans `~/.agents/skills/` and reads `SKILL.md` frontmatter to decide
what to load. The recommended `skills` CLI command installs PromethOS directly
into that global directory.

With PromethOS installed, Codex sees:

```text
~/.agents/skills/route-agent-design/
~/.agents/skills/define-agent-requirements/
...
```

The `route-agent-design` bootstrap skill then tells the agent when PromethOS
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

- `skills` CLI install: run `npx skills update`
- Manual install: update your local clone and restart Codex

## Troubleshooting

- Verify the installed skills: `npx skills ls -g`
- Verify a PromethOS skill exists on disk: `ls -la ~/.agents/skills/route-agent-design`
- If you installed manually, verify the local clone: `find ~/.codex/promethos/skills -maxdepth 2 -name SKILL.md`
- Restart Codex after any change to skill layout
