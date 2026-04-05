# Repository Guidelines

## Project Structure & Module Organization
`skills/` is the canonical library. Each skill lives in
`skills/<skill-name>/SKILL.md`; supporting files should stay beside it,
typically in `references/`. Name skills with short, task-first, verb-led ids
using lowercase letters, digits, and hyphens only. Keep bootstrap and
harness-mapping material under the routing/bootstrap skill directory rather
than scattering it across the library. Contributor and platform docs live in
`docs/`, `CONTRIBUTING.md`, `.codex/INSTALL.md`, `GEMINI.md`, and
`gemini-extension.json`. Automation lives in `scripts/` and
`.github/workflows/`.

## Build, Test, and Development Commands
There is no compiled build or local server in this repository. The required
validation commands are:

```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```

This checks for exactly one `SKILL.md` per top-level skill directory, required
frontmatter, required headings, duplicate skill names, and bootstrap reference
files, plus required public-facing docs and local Markdown links. If you change
install or platform docs, also run a harness-specific smoke check, for example
`ls -la ~/.agents/skills/promethos` for Codex.

## Coding Style & Naming Conventions
Keep content portable across harnesses. Do not fork the same skill body per
provider; put tool-mapping notes in the routing/bootstrap skill's
`references/` directory. Every `SKILL.md` must define `name` and
`description`. Keep `name` + `description` at 250 characters or less, and put
trigger language in `description` instead of a separate `when_to_use` field.
Then include the exact headings enforced by the validator: `# Goal`,
`## Inputs`, `## Non-Goals`, `## Workflow`, `## Output Contract`,
`## Escalation`, and `## Common Failure Modes`. Keep `SKILL.md` concise and
move long examples or variant-specific detail into `references/`. Follow the
existing Markdown style: short paragraphs, direct bullets, and wrapped lines.
Shell scripts should remain Bash with `set -euo pipefail`.

## Testing Guidelines
Validation is the test gate for this repo. Run both
`./scripts/validate-skills.sh` and `python3 ./scripts/check-repo-docs.py`
before every PR. There is no numeric coverage target yet, but new or renamed
skills must pass all structural checks. When changing harness docs or install
flows, note the manual verification you performed.

## Commit & Pull Request Guidelines
`main` currently has no commit history, so there is no established subject-line
pattern to copy. Use short imperative commits such as
`Add evolve-skill-library guidance`. Keep PRs narrow and explicit. Include the
affected paths, why the change is needed, validator results, and any manual
smoke checks for Codex, Claude Code, or Gemini. Screenshots are usually not
needed; command output and linked docs are more useful.

## Security & Portability
Do not add private paths, internal organization names, or undocumented runtime
dependencies. If behavior only works on one harness, document that in the
compatibility docs instead of assuming it applies everywhere.
