# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

PromethOS is a skills-first framework for designing, governing, evaluating, and evolving agent systems. The repository ships reusable `SKILL.md` prompts — no compiled code, no servers, no runtime dependencies. It supports Claude Code, Codex, and Gemini CLI via thin platform-specific entrypoints.

## Validation (the only "test" gate)

```bash
./scripts/validate-skills.sh        # structural checks on all skills
python3 ./scripts/check-repo-docs.py # required files + broken link checks
```

Both must pass before any PR. There is no build step.

`validate-skills.sh` checks: exactly one `SKILL.md` per skill directory, required frontmatter (`name`, `description`, `when_to_use`), required headings, no duplicate skill names, and presence of bootstrap reference files.

`check-repo-docs.py` checks: required repo files exist (README, CONTRIBUTING, AGENTS, LICENSE, SECURITY, CODE_OF_CONDUCT, platform install docs, issue templates, PR template) and all local Markdown links resolve.

## Skill Taxonomy

PromethOS now uses task-first skill ids instead of public prefix groupings.

- Core entry: `route-agent-design`, `define-agent-requirements`,
  `set-agent-autonomy-boundaries`, `build-agent-evals`,
  `debug-agent-failures`, `verify-agent-readiness`
- Design deepening: `choose-agent-architecture`,
  `plan-agent-implementation`, `design-agent-context`,
  `design-agent-memory`, `design-agent-permissions`,
  `design-agent-tools`, `orchestrate-agent-subagents`,
  `trim-agent-scope`
- Maintainer layer: `author-skill`, `evolve-skill-library`,
  `turn-postmortem-to-improvement`

## Skill File Contract

Every `skills/<skill-name>/SKILL.md` must have:

**Frontmatter:** `name`, `description`, `when_to_use`

**Required headings (exact match):**
- `# Goal`
- `## Inputs`
- `## Non-Goals`
- `## Workflow`
- `## Output Contract`
- `## Escalation`
- `## Common Failure Modes`

Supporting material goes in `references/` subdirectory beside the SKILL.md.

## Cross-Platform Rules

- Never fork the same skill body per platform.
- Tool-mapping and harness-specific notes go in
  `skills/route-agent-design/references/` (e.g., `codex-tools.md`,
  `gemini-tools.md`).
- Skills describe intent, not provider-specific tool names.

## Key Directories

- `skills/` — canonical skill library
- `docs/evaluators/` — evaluator specifications for agent quality assessment
- `docs/references/` — deep-dive reference docs (memory, permissions, context, plan mode)
- `docs/evals/` — evaluation task definitions
- `scripts/` — validation scripts
- `.codex/` — Codex install guide
- `GEMINI.md` + `gemini-extension.json` — Gemini CLI entrypoint

## Portability

No private paths, internal org names, or undocumented runtime dependencies. If behavior is harness-specific, document it in `docs/COMPATIBILITY.md` rather than assuming it applies everywhere.
