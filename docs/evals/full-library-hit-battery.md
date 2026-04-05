# Full-Library Hit Battery

## Purpose

This battery extends the first-wave front-door eval pack into a **full-library
PromethOS hit-testing matrix**.

The goal is to answer four different questions without collapsing them into one
ambiguous score:

1. Can ordinary language reach the right PromethOS skill when PromethOS is the
   only skill library in play?
2. In coexistence mode, does PromethOS appear where it should without fighting a
   broader workflow library for generic process control?
3. Are second-hop and maintainer skills reachable from the correct owning path?
4. For each skill, is the next improvement **repo-local**, **docs-only**, or
   blocked by an **external constraint**?

## Run Modes

### 1. `standalone-natural`
Use the repo-local harness in
[`promethos-standalone-codex-harness.md`](promethos-standalone-codex-harness.md)
plus [`scripts/run-promethos-standalone-codex.sh`](../../scripts/run-promethos-standalone-codex.sh)
to expose only this worktree's `skills/` directory to Codex.

### 2. `coexistence-natural`
Use the repo-local coexistence harness in
[`promethos-coexistence-codex-harness.md`](promethos-coexistence-codex-harness.md)
plus [`scripts/run-promethos-coexistence-codex.sh`](../../scripts/run-promethos-coexistence-codex.sh)
to expose this worktree's PromethOS skills alongside the currently installed
broader workflow libraries such as `superpowers`.

### 3. `coexistence-explicit-PromethOS`
Use the same coexistence harness, but explicitly ask for PromethOS to lead the
agent-domain decision.

## Scoring Dimensions

Each executed scenario should record:

- **Target skill** or expected non-PromethOS handoff
- **Hit verdict**: `pass` / `concerns` / `fail` / `blocked`
- **Ownership verdict**: `correct` / `ambiguous` / `incorrect`
- **Fixability**: `repo-local` / `docs-only` / `external-constraint`
- **Evidence source**: fresh run, prior prompt battery, or skill-body review

## Reachability Classes

- **Front-door**: should be reachable directly from ordinary user language.
- **Second-hop**: should appear after the correct PromethOS owning skill is
  already active.
- **Maintainer / rare-path**: should be reachable from explicit library
  maintenance, postmortem, or taxonomy-evolution prompts.

## Skill Matrix

| Skill | Layer | Reachability | Primary prompt family | Neighbor confusion to test | Modes | Initial rewrite hypothesis |
| --- | --- | --- | --- | --- | --- | --- |
| `route-agent-design` | Core entry | front-door | "use PromethOS", "which PromethOS skill should own this" | direct jump to `define-agent-requirements`, `build-agent-evals`, `set-agent-autonomy-boundaries` | coexistence-natural, coexistence-explicit-PromethOS | Add explicit trigger signals section and sharper coexistence examples |
| `define-agent-requirements` | Core entry | front-door | vague agent idea, no clear `v1`, no success criteria | `choose-agent-architecture`, `trim-agent-scope` | standalone-natural, coexistence-natural, coexistence-explicit-PromethOS | Expand ordinary-language triggers and stronger "not architecture yet" boundary |
| `set-agent-autonomy-boundaries` | Core entry | front-door | risky agent capabilities, unclear checkpoints, production/external actions | `design-agent-permissions`, `design-agent-tools` | standalone-natural, coexistence-natural, coexistence-explicit-PromethOS | Strengthen policy-vs-permission examples and explicit production-risk phrasing |
| `build-agent-evals` | Core entry | front-door | no tests/evals, smallest eval pack, safety/honesty checks | `verify-agent-readiness` | standalone-natural, coexistence-natural, coexistence-explicit-PromethOS | Tighten "smallest eval pack" cues and refusal/negative-case wording |
| `debug-agent-failures` | Core entry | front-door | repeated failures, loops, degraded agent output | `turn-postmortem-to-improvement` | standalone-natural, coexistence-natural | Add more symptom-first triggers and explicit local-evidence boundary |
| `verify-agent-readiness` | Core entry | front-door (standalone) / overlap-prone (coexistence) | ready-to-merge / ready-to-ship / confirm readiness | superpowers `verification-before-completion` | standalone-natural, coexistence-natural, coexistence-explicit-PromethOS | Clarify coexistence expectations and add explicit "PromethOS-only readiness" examples |
| `choose-agent-architecture` | Design deepening | second-hop | one agent or many, clear job but unclear structure | `define-agent-requirements`, `orchestrate-agent-subagents` | coexistence-explicit-PromethOS, second-hop prompts | Add stronger precondition language: only after requirements stabilize |
| `design-agent-context` | Design deepening | second-hop | loads too much, misses right files, eager vs deferred context | `design-agent-memory` | coexistence-explicit-PromethOS, second-hop prompts | Add concrete long-running maintenance examples |
| `design-agent-memory` | Design deepening | second-hop | forgetting preferences, multi-session memory, stale recall | `design-agent-context` | coexistence-explicit-PromethOS, second-hop prompts | Sharpen distinction between project truth and user preferences |
| `design-agent-permissions` | Design deepening | second-hop | approval modes after policy exists | `set-agent-autonomy-boundaries` | coexistence-explicit-PromethOS, second-hop prompts | Add stronger "not the policy layer" guardrail wording |
| `design-agent-tools` | Design deepening | second-hop | tool misuse, unclear contract, vague tool errors | `design-agent-permissions` | coexistence-explicit-PromethOS, second-hop prompts | Add examples where tool contracts fail without changing autonomy policy |
| `orchestrate-agent-subagents` | Design deepening | second-hop | how to split subagents, ownership boundaries, merge contracts | `choose-agent-architecture` | coexistence-explicit-PromethOS, second-hop prompts | Emphasize that architecture choice must already be made |
| `plan-agent-implementation` | Design deepening | second-hop | architecture approved, what do we build first | `choose-agent-architecture`, `trim-agent-scope` | coexistence-explicit-PromethOS, second-hop prompts | Add more concrete build-order trigger language |
| `trim-agent-scope` | Design deepening | second-hop | plan keeps growing, scope creep, too many side quests | `define-agent-requirements`, `plan-agent-implementation` | coexistence-explicit-PromethOS, second-hop prompts | Add more prompt-like examples of overgrowth / side-quest detection |
| `evolve-skill-library` | Maintainer | maintainer/rare-path | library overlap, stale skills, confusion, repeated pattern may deserve promotion, keep/merge/split/archive | `turn-postmortem-to-improvement` | coexistence-explicit-PromethOS, maintainer prompts | Add clearer trigger language for inventory/coherence reviews and new-skill promotion |
| `turn-postmortem-to-improvement` | Maintainer | maintainer/rare-path | incident fixed, how to prevent recurrence, convert into reusable update | `debug-agent-failures`, `evolve-skill-library` | coexistence-explicit-PromethOS, maintainer prompts | Clarify postmortem vs immediate debugging handoff |

## Minimum Executed Coverage

To treat a baseline as minimally credible:

- Every skill must have a row in the rewrite ledger.
- Every **front-door** skill should have at least one fresh executed scenario.
- Every **second-hop** and **maintainer** skill should have at least one prompt
  family specified even if fresh execution is temporarily blocked.
- If live execution is blocked by account/runtime limits, mark the scenario as
  `blocked` with the exact constraint and keep the rewrite direction explicit.

## Verification Notes

After any repo-local wording change:

1. rerun the changed skill's primary scenario,
2. rerun at least one neighboring-skill scenario,
3. update the results file with before/after verdicts,
4. run:
   - `./scripts/validate-skills.sh`
   - `python3 ./scripts/check-repo-docs.py`
