# PromethOS Hero Skill Optimization Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Strengthen PromethOS's front-door experience by improving the four highest-leverage skills and adding matching examples and evals that prove the changes are useful.

**Architecture:** Keep the current library shape and taxonomy. Improve trigger clarity, output artifacts, and skill boundaries in `SKILL.md`, while moving longer examples into `references/` to stay aligned with `skill-creator` guidance on concision and progressive disclosure. Validate changes with repo validators and raw prompt drills from `docs/evals/`.

**Tech Stack:** Markdown `SKILL.md` files, `references/worked-example.md`, `docs/evals/*.md`, shell validation scripts.

---

## Skill-Creator Constraints

- Keep each `SKILL.md` concise; move long examples and reusable artifacts into `references/`.
- Use real user language in `when_to_use`, trigger signals, and examples.
- Preserve clear degrees of freedom: rigid boundaries and output contracts, flexible wording where multiple good phrasings are acceptable.
- Avoid creating auxiliary docs that do not directly support skill execution or evaluation.
- Validate with raw prompts and inspectable artifacts, not with preloaded intended answers.

### Task 1: Define The First-Wave Prompt Battery And Acceptance Checks

**Files:**
- Modify: `docs/evals/README.md`
- Modify: `docs/evals/normal-design-task.md`
- Modify: `docs/evals/permission-sensitive-task.md`
- Create: `docs/evals/minimal-eval-pack-task.md`

- [ ] **Step 1: Tighten the first-wave behavior scope**

Decide that the first optimization wave is only responsible for:
- routing agent-design questions cleanly,
- turning vague agent ideas into usable briefs,
- defining safe autonomy boundaries,
- producing a small eval harness with negative cases.

- [ ] **Step 2: Update existing eval scenarios to match the first-wave goals**

Revise `docs/evals/normal-design-task.md` and `docs/evals/permission-sensitive-task.md` so they test the exact front-door behaviors the revised skills are supposed to improve.

- [ ] **Step 3: Add one targeted eval-harness scenario**

Create `docs/evals/minimal-eval-pack-task.md` for the prompt shape:
`We have an agent design, but no tests. Build the smallest eval pack that would catch unsafe or dishonest behavior.`

- [ ] **Step 4: Update the eval index**

Edit `docs/evals/README.md` so the scenario inventory and scoring guidance explicitly cover the first-wave prompt battery.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass before any skill-body work continues.

### Task 2: Reshape `using-promethos` Into A Real Front-Door Router

**Files:**
- Modify: `skills/using-promethos/SKILL.md`

- [ ] **Step 1: Capture the target routing modes**

Limit the front-door behavior to three primary paths:
- vague agent idea -> `flow-agent-requirements-clarification`
- risky autonomy or boundary confusion -> `guard-safe-autonomy-guardrails`
- "how do we know it works" -> `eval-agent-evaluation-harness` or `flow-verification-before-completion`

- [ ] **Step 2: Replace abstract examples with concrete user language**

Rewrite the example block to include plain-language prompts such as:
- "帮我搞个会自动审 PR 的 agent"
- "这个 bot 老是做不该做的事"
- "它差不多能用了，但我不知道怎么验"
- "我想让它能自己跑，但别乱动生产"

- [ ] **Step 3: Tighten ownership and non-goals**

Make it explicit that `using-promethos` is a routing and boundary skill, not a substitute for architecture, implementation planning, or generic workflow control.

- [ ] **Step 4: Strengthen the output contract**

Change the output contract so it recommends:
- which PromethOS skill(s) own the task,
- why they own it,
- whether PromethOS should lead or act as an overlay,
- what gap or ambiguity still blocks the next step.

- [ ] **Step 5: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass after the routing skill rewrite.

### Task 3: Upgrade `flow-agent-requirements-clarification` Into The Hero Entry Skill

**Files:**
- Modify: `skills/flow-agent-requirements-clarification/SKILL.md`
- Modify: `skills/flow-agent-requirements-clarification/references/worked-example.md`
- Modify: `docs/evals/normal-design-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: Rewrite triggers in real prompt language**

Expand `when_to_use` and trigger signals to capture vague user requests such as:
- "I want an assistant that..."
- "帮我做个 bot"
- "想做个 agent，能自动处理这些事"

- [ ] **Step 2: Make the output artifact more reusable**

Revise the output contract so it yields a requirements brief with stable sections:
- job,
- operator and beneficiary,
- primary artifact,
- acceptance criteria,
- tool/context surface,
- non-goals,
- minimum useful `v1`,
- risks and open questions.

- [ ] **Step 3: Keep SKILL.md lean and move weight into the example**

Update `references/worked-example.md` to show a better before/after brief without turning the main `SKILL.md` into a long template dump.

- [ ] **Step 4: Align the public example index**

Update `docs/examples/README.md` so this skill is clearly positioned as one of the primary worked examples.

- [ ] **Step 5: Re-run the design-task eval manually**

Prompt to run in a clean session:
```text
I want an agent that helps my team triage incident reports and draft follow-up tasks, but I'm not sure what the first version should actually do.
```
Expected: the run produces a requirements brief before architecture or implementation planning.

- [ ] **Step 6: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass after the hero entry skill update.

### Task 4: Strengthen The Safe-Autonomy Path Without Blurring Permission Mechanics

**Files:**
- Modify: `skills/guard-safe-autonomy-guardrails/SKILL.md`
- Create: `skills/guard-safe-autonomy-guardrails/references/worked-example.md`
- Modify: `skills/cap-permission-model-design/SKILL.md`
- Modify: `docs/evals/permission-sensitive-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: Make the guard skill operationally sharper**

Rewrite the risk discussion around concrete side effects:
- read-only work,
- local reversible edits,
- destructive local changes,
- external side effects,
- privacy-sensitive actions,
- financial or production-impacting actions.

- [ ] **Step 2: Tighten the boundary with permission mechanics**

Edit both `guard-safe-autonomy-guardrails/SKILL.md` and `cap-permission-model-design/SKILL.md` so the split is unmistakable:
- guardrails decide checkpoint philosophy,
- permission-model maps that policy into enforceable defaults.

- [ ] **Step 3: Add one worked example at the guard layer**

Create `skills/guard-safe-autonomy-guardrails/references/worked-example.md` showing a policy for an agent that can edit configs, run commands, and contact external services.

- [ ] **Step 4: Make the eval inspect the boundary**

Update `docs/evals/permission-sensitive-task.md` so it explicitly checks whether the run separates autonomy policy from permission classes.

- [ ] **Step 5: Re-run the permission-sensitive eval manually**

Prompt to run in a clean session:
```text
Design safety boundaries for an agent that can edit production config, run deployment commands, browse the web, and message external services.
```
Expected: the run produces a checkpoint policy first, then permission mechanics only if the policy is already set.

- [ ] **Step 6: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass after the autonomy-path update.

### Task 5: Turn `eval-agent-evaluation-harness` Into A Reusable Proof Engine

**Files:**
- Modify: `skills/eval-agent-evaluation-harness/SKILL.md`
- Create: `skills/eval-agent-evaluation-harness/references/worked-example.md`
- Modify: `docs/evals/README.md`
- Create: `docs/evals/minimal-eval-pack-task.md`
- Modify: `docs/examples/README.md`

- [ ] **Step 1: Make the eval artifact explicit**

Revise the output contract so it clearly produces:
- prioritized behaviors,
- scenario inventory,
- scoring rubric,
- inspectable artifacts,
- rerun procedure.

- [ ] **Step 2: Emphasize negative cases**

Strengthen the workflow so it explicitly requires refusal, checkpoint, escalation, or approval-compliance cases when the agent can take consequential actions.

- [ ] **Step 3: Add one worked example**

Create `skills/eval-agent-evaluation-harness/references/worked-example.md` that shows a compact eval pack for a risky agent workflow.

- [ ] **Step 4: Align the eval docs with the revised skill**

Update `docs/evals/README.md` and `docs/evals/minimal-eval-pack-task.md` so the public eval pack reflects the revised artifact shape.

- [ ] **Step 5: Re-run the eval-harness prompt manually**

Prompt to run in a clean session:
```text
We built an agent that drafts refund decisions and can message customers. We do not have tests yet. Build the smallest eval pack that would catch unsafe or misleading behavior.
```
Expected: the run defines a compact scenario set with at least one negative safety case and a reusable rubric.

- [ ] **Step 6: Run repo validation**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass after the eval-harness update.

### Task 6: Run A Fresh First-Wave Verification Pass

**Files:**
- Modify: `docs/examples/README.md`
- Modify: `docs/evals/README.md`

- [ ] **Step 1: Run the full repo validators**

Run:
```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```
Expected: both commands pass with all new example and eval references in place.

- [ ] **Step 2: Run the first-wave prompt battery in fresh sessions**

Run all three representative prompts from Tasks 3-5 plus the updated `docs/evals/` scenarios.
Expected: each run chooses the intended front-door path and produces the expected artifact type without drifting into generic workflow advice.

- [ ] **Step 3: Record concrete pass/concerns/fail outcomes**

For each prompt, capture:
- selected skills,
- artifact produced,
- boundary mistakes if any,
- whether the revised skill stayed concise and useful.

- [ ] **Step 4: Apply only evidence-backed follow-up edits**

If failures repeat, tighten trigger language, output contracts, or example coverage. Do not add new taxonomy skills during this wave.

- [ ] **Step 5: Commit the first-wave optimization set**

```bash
git add skills/using-promethos/SKILL.md \
  skills/flow-agent-requirements-clarification/SKILL.md \
  skills/flow-agent-requirements-clarification/references/worked-example.md \
  skills/guard-safe-autonomy-guardrails/SKILL.md \
  skills/guard-safe-autonomy-guardrails/references/worked-example.md \
  skills/cap-permission-model-design/SKILL.md \
  skills/eval-agent-evaluation-harness/SKILL.md \
  skills/eval-agent-evaluation-harness/references/worked-example.md \
  docs/examples/README.md \
  docs/evals/README.md \
  docs/evals/normal-design-task.md \
  docs/evals/permission-sensitive-task.md \
  docs/evals/minimal-eval-pack-task.md
git commit -m "Strengthen PromethOS hero skill paths"
```
