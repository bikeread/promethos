# PromethOS Standalone Codex Harness

This repository ships a repo-local helper for running Codex against the current
worktree with **PromethOS only** visible under `~/.agents/skills/`.

## Why this exists

The normal local install often exposes both:

- `~/.agents/skills/promethos`
- `~/.agents/skills/superpowers`

That is the correct coexistence setup for everyday use, but it contaminates
standalone hit-testing when the goal is to measure whether natural language can
reach the right PromethOS skill *without* a broader workflow library in play.

## Harness behavior

`scripts/run-promethos-standalone-codex.sh`:

1. creates a temporary `HOME`,
2. copies `~/.codex/auth.json` and `~/.codex/config.toml`,
3. copies `~/.codex/AGENTS.md` when present,
4. exposes only this worktree's `skills/` directory as
   `~/.agents/skills/promethos`,
5. runs `codex exec --ephemeral` by default.

Because the symlink points at the current worktree, standalone eval runs see
the exact PromethOS revision under test, not a stale globally installed copy.

## Usage

Basic run:

```bash
./scripts/run-promethos-standalone-codex.sh \
  "Use PromethOS only. Tell me which skill library names are installed."
```

JSON output:

```bash
./scripts/run-promethos-standalone-codex.sh --json \
  "Route an agent-design task and explain the first PromethOS skill you would use."
```

Keep the temporary home for inspection:

```bash
PROMETHOS_STANDALONE_KEEP_HOME=1 \
./scripts/run-promethos-standalone-codex.sh "List installed skill libraries."
```

Debug the visible skill roots before the run:

```bash
PROMETHOS_STANDALONE_DEBUG=1 \
./scripts/run-promethos-standalone-codex.sh "List installed skill libraries."
```

## Interpretation rule

Use this harness for **standalone-natural** runs in the full-library hit
battery. Keep the regular install for:

- **coexistence-natural**, and
- **coexistence-explicit-PromethOS**

so the results continue to distinguish pure PromethOS reachability from correct
coexistence behavior.
