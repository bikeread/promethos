# PromethOS Coexistence Codex Harness

This repository ships a repo-local helper for running Codex against the current
worktree with:

- this worktree's **PromethOS** skills visible as `~/.agents/skills/promethos`, and
- the currently installed **superpowers** visible as `~/.agents/skills/superpowers`
  when that library exists.

## Why this exists

The normal local install often points Codex at a globally installed PromethOS
copy, which can lag behind the branch under test. The standalone harness solves
that for PromethOS-only runs, but the full-library hit battery also needs a
coexistence mode that preserves the current `superpowers` install while still
forcing PromethOS to come from the current worktree.

## Harness behavior

`scripts/run-promethos-coexistence-codex.sh`:

1. creates a temporary `HOME`,
2. copies `~/.codex/auth.json` and `~/.codex/config.toml`,
3. copies `~/.codex/AGENTS.md` when present,
4. exposes this worktree's `skills/` directory as `~/.agents/skills/promethos`,
5. reuses `~/.agents/skills/superpowers` when it exists,
6. runs `codex exec --ephemeral` by default.

Because the PromethOS symlink points at the current worktree, coexistence eval
runs see the exact PromethOS revision under test rather than a stale globally
installed copy.

## Usage

Basic run:

```bash
./scripts/run-promethos-coexistence-codex.sh   "Use PromethOS. Which skill should own this agent-design task?"
```

JSON output:

```bash
./scripts/run-promethos-coexistence-codex.sh --json   "I updated the evaluator docs and worked examples. Please confirm the repository is ready to merge."
```

Keep the temporary home for inspection:

```bash
PROMETHOS_COHOME_KEEP_HOME=1 ./scripts/run-promethos-coexistence-codex.sh "List installed skill libraries."
```

Debug the visible skill roots before the run:

```bash
PROMETHOS_COHOME_DEBUG=1 ./scripts/run-promethos-coexistence-codex.sh "List installed skill libraries."
```

## Interpretation rule

Use this harness for:

- **coexistence-natural**, and
- **coexistence-explicit-PromethOS**

runs in the full-library hit battery when you want current-branch PromethOS
behavior without mutating the globally installed `superpowers`.
