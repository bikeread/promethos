# PromethOS Skill Library Restructure Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace PromethOS's taxonomy-first skill naming with a task-first library shape that is easier to discover, trigger, and use from day one, without carrying compatibility shims for the old names.

**Architecture:** Keep the repository's one-skill-per-top-level-directory structure, but rename every public skill to a verb-led, user-language-oriented name. Move taxonomy from skill ids into supporting docs, examples, and framework material. Keep `SKILL.md` bodies concise per `skill-creator`, push detail into `references/`, and rewrite routing/docs around a three-layer model: core entry, design deepening, maintainer workflows.

**Tech Stack:** Markdown `SKILL.md`, `references/worked-example.md`, repository docs under `docs/`, bootstrap preload files, shell validators.

---

## Skill-Creator Constraints

- Names must use lowercase letters, digits, and hyphens only.
- Prefer short, verb-led names that describe the user task directly.
- Keep `SKILL.md` concise; move long examples and variant detail into `references/`.
- Optimize `name`, `description`, and `when_to_use` for triggerability in plain language.
- Do not add auxiliary documentation files that are not directly needed for skill execution, discovery, or validation.
- Validate with raw prompt drills and inspectable artifacts, not with hidden expected answers.

## Target Library Shape

### Core Entry Layer

- `route-agent-design`
- `define-agent-requirements`
- `set-agent-autonomy-boundaries`
- `build-agent-evals`
- `debug-agent-failures`
- `verify-agent-readiness`

### Design Deepening Layer

- `choose-agent-architecture`
- `plan-agent-implementation`
- `design-agent-context`
- `design-agent-memory`
- `design-agent-permissions`
- `design-agent-tools`
- `orchestrate-agent-subagents`
- `trim-agent-scope`

### Maintainer Layer

- `author-skill`
- `evolve-skill-library`
- `turn-postmortem-to-improvement`

## Rename Map

- `using-promethos` -> `route-agent-design`
- `flow-agent-requirements-clarification` -> `define-agent-requirements`
- `flow-agent-architecture-design` -> `choose-agent-architecture`
- `flow-agent-implementation-planning` -> `plan-agent-implementation`
- `flow-systematic-agent-debugging` -> `debug-agent-failures`
- `flow-verification-before-completion` -> `verify-agent-readiness`
- `guard-safe-autonomy-guardrails` -> `set-agent-autonomy-boundaries`
- `guard-anti-bloat-scope-control` -> `trim-agent-scope`
- `cap-context-engineering` -> `design-agent-context`
- `cap-memory-strategy-design` -> `design-agent-memory`
- `cap-permission-model-design` -> `design-agent-permissions`
- `cap-tool-contract-design` -> `design-agent-tools`
- `cap-subagent-orchestration` -> `orchestrate-agent-subagents`
- `eval-agent-evaluation-harness` -> `build-agent-evals`
- `eval-postmortem-to-skill` -> `turn-postmortem-to-improvement`
- `meta-skill-authoring` -> `author-skill`
- `meta-skill-evolution` -> `evolve-skill-library`

### Task 1: Freeze The New Public Vocabulary And Repository Contract

**Files:**
- Modify: `AGENTS.md`
- Modify: `CONTRIBUTING.md`
- Modify: `README.md`
- Modify: `README.zh-CN.md`
- Modify: `docs/ROADMAP.md`
- Modify: `docs/COMPATIBILITY.md`
- Modify: `docs/framework/skill-alignment-matrix.md`
- Modify: `docs/framework/claude-code-design-principles.md`
- Modify: `docs/framework/extraction-governance.md`

- [ ] **Step 1: Replace prefix-based governance language**

Rewrite `AGENTS.md` and `CONTRIBUTING.md` so they no longer prescribe `flow-`,
`cap-`, `guard-`, `eval-`, and `meta-` prefixes as repository policy.

- [ ] **Step 2: Declare the new three-layer model**

Update `README.md`, `README.zh-CN.md`, and `docs/COMPATIBILITY.md` so they
present the library as:
- core entry skills,
- design deepening skills,
- maintainer skills.

- [ ] **Step 3: Reframe framework docs around user-task naming**

Update the framework docs so they preserve decision boundaries while dropping
the assumption that taxonomy prefixes should remain public identifiers.

- [ ] **Step 4: Rewrite the roadmap pressure**

Adjust `docs/ROADMAP.md` so future work assumes the renamed library shape and
does not refer to old prefixes as the main organizing principle.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass before directory moves begin.

### Task 2: Rename And Rewrite The Core Entry Layer

**Files:**
- Move: `skills/using-promethos` -> `skills/route-agent-design`
- Move: `skills/flow-agent-requirements-clarification` -> `skills/define-agent-requirements`
- Move: `skills/guard-safe-autonomy-guardrails` -> `skills/set-agent-autonomy-boundaries`
- Move: `skills/eval-agent-evaluation-harness` -> `skills/build-agent-evals`
- Move: `skills/flow-systematic-agent-debugging` -> `skills/debug-agent-failures`
- Move: `skills/flow-verification-before-completion` -> `skills/verify-agent-readiness`
- Modify: `docs/examples/README.md`
- Modify: `docs/evals/README.md`
- Modify: `docs/evals/normal-design-task.md`
- Modify: `docs/evals/permission-sensitive-task.md`
- Modify: `docs/evals/minimal-eval-pack-task.md`

- [ ] **Step 1: Rename the six core skill directories**

Move each directory to its new task-first name and update frontmatter
`name` values to match the new directory name exactly.

- [ ] **Step 2: Rewrite metadata for triggerability**

For each renamed core skill, rewrite:
- `description`
- `when_to_use`
- trigger examples

Use direct user language such as:
- "I want an agent that..."
- "it keeps doing risky things"
- "how do we know it works"
- "I think it's ready; verify it"

- [ ] **Step 3: Keep bodies concise and move detail outward**

If any rewritten `SKILL.md` starts becoming bulky, move examples or variant
detail into `references/` instead of bloating the body.

- [ ] **Step 4: Align public examples and evals with the new names**

Update `docs/examples/README.md` and the `docs/evals/*.md` files listed above
so all skill references use the new names and reinforce the core entry layer.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: validators pass after the core layer rename.

### Task 3: Rename And Rewrite The Design Deepening Layer

**Files:**
- Move: `skills/flow-agent-architecture-design` -> `skills/choose-agent-architecture`
- Move: `skills/flow-agent-implementation-planning` -> `skills/plan-agent-implementation`
- Move: `skills/cap-context-engineering` -> `skills/design-agent-context`
- Move: `skills/cap-memory-strategy-design` -> `skills/design-agent-memory`
- Move: `skills/cap-permission-model-design` -> `skills/design-agent-permissions`
- Move: `skills/cap-tool-contract-design` -> `skills/design-agent-tools`
- Move: `skills/cap-subagent-orchestration` -> `skills/orchestrate-agent-subagents`
- Move: `skills/guard-anti-bloat-scope-control` -> `skills/trim-agent-scope`
- Modify: `docs/references/context-pressure-and-compaction.md`
- Modify: `docs/references/memory-layering-and-freshness.md`
- Modify: `docs/references/permission-modes-and-approvals.md`
- Modify: `docs/references/plan-mode-and-approval-flow.md`
- Modify: `docs/evals/ambiguity-heavy-task.md`
- Modify: `docs/evals/context-pressure-task.md`

- [ ] **Step 1: Rename the eight design-deepening directories**

Move each directory and update frontmatter names to the new ids.

- [ ] **Step 2: Rewrite descriptions to match user questions**

Use names and metadata that answer questions users actually ask:
- "how should it remember things"
- "what should it read now vs later"
- "which actions need approval"
- "should this be one agent or several"

- [ ] **Step 3: Keep boundary discipline intact**

Do not let the clearer names blur boundaries. For example:
- `set-agent-autonomy-boundaries` decides checkpoint philosophy
- `design-agent-permissions` maps that policy into enforceable defaults

- [ ] **Step 4: Update references and eval prompts**

Rewrite all docs listed above to use the new names while preserving the same
decision boundaries and inspectable artifacts.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: validators pass after the design layer rename.

### Task 4: Rename The Maintainer Layer And Reposition It As Advanced

**Files:**
- Move: `skills/meta-skill-authoring` -> `skills/author-skill`
- Move: `skills/meta-skill-evolution` -> `skills/evolve-skill-library`
- Move: `skills/eval-postmortem-to-skill` -> `skills/turn-postmortem-to-improvement`
- Modify: `README.md`
- Modify: `README.zh-CN.md`
- Modify: `docs/framework/skill-alignment-matrix.md`

- [ ] **Step 1: Rename the maintainer directories**

Move the three maintainer skills and update frontmatter names.

- [ ] **Step 2: Make the maintainer layer clearly non-primary**

Rewrite README and framework text so these skills remain visible but are no
longer presented as part of the main first-run path for typical users.

- [ ] **Step 3: Update metadata for actual maintainer jobs**

Ensure their `description` and `when_to_use` speak in clear maintainer tasks:
- author a new skill
- reshape the library
- turn an incident into a reusable improvement

- [ ] **Step 4: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: validators pass after the maintainer layer rename.

### Task 5: Update Bootstrap, Install Paths, And Cross-References

**Files:**
- Modify: `GEMINI.md`
- Modify: `.codex/INSTALL.md`
- Modify: `docs/README.codex.md`
- Modify: `docs/README.claude-code.md`
- Modify: `docs/README.gemini.md`
- Modify: every renamed `SKILL.md` and `references/worked-example.md`

- [ ] **Step 1: Update bootstrap preload paths**

Change `GEMINI.md` to preload `route-agent-design` instead of
`using-promethos`, and update any linked reference paths accordingly.

- [ ] **Step 2: Update install and verification docs**

Rewrite install docs so every example path, verification command, and “ask
about this skill” instruction points to the renamed bootstrap or hero skills.

- [ ] **Step 3: Rewrite cross-skill references**

Update all renamed `SKILL.md` files and `references/worked-example.md` files so
they refer only to the new names.

- [ ] **Step 4: Remove stale prefix language**

Search for `flow-`, `cap-`, `guard-`, `eval-`, `meta-`, and
`using-promethos`. Remove or replace every public-facing use unless it remains
only in historical explanation that is still intentional.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: validators pass after all bootstrap and cross-reference updates.

### Task 6: Run A Fresh Triggerability And Boundary Verification Pass

**Files:**
- Modify: `docs/evals/README.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: Run the full validators**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass with the fully renamed library.

- [ ] **Step 2: Run a fresh prompt battery in clean sessions**

Use raw prompts such as:
```text
I want an agent that triages incidents, but I don't know what the first version should do.
```
```text
This bot keeps doing risky things on its own. Help me set the right boundaries.
```
```text
We built an agent, but we still do not know how to evaluate it properly.
```
```text
I think the agent is ready. Verify that claim before we say it's done.
```
Expected: the renamed skills are easier to select from ordinary language and
still preserve the intended boundaries.

- [ ] **Step 3: Record pass/concerns/fail by renamed skill**

For each prompt, capture:
- first chosen skill,
- artifact produced,
- whether a neighboring skill should have owned the task instead,
- any naming confusion that still remains.

- [ ] **Step 4: Tighten only where evidence points**

If prompts still miss, change `description`, `when_to_use`, or example wording
first. Do not add new skills unless repeated evidence shows a real missing
decision point.

- [ ] **Step 5: Commit the restructure**

```bash
git add AGENTS.md CONTRIBUTING.md README.md README.zh-CN.md \
  docs/ROADMAP.md docs/COMPATIBILITY.md docs/framework/skill-alignment-matrix.md \
  docs/framework/claude-code-design-principles.md docs/framework/extraction-governance.md \
  docs/examples/README.md docs/evals/README.md docs/evals/*.md \
  .codex/INSTALL.md docs/README.codex.md docs/README.claude-code.md docs/README.gemini.md GEMINI.md \
  skills
git commit -m "Restructure PromethOS skill library around task-first names"
```
