# Full-Library Hit Results — 2026-04-05

## Scope

This note records the current baseline for the full-library PromethOS hit
battery.

It combines:

- fresh leader-shell runs completed during this session,
- the earlier coexistence-only prompt battery in
  [`2026-04-05-prompt-battery-results.md`](2026-04-05-prompt-battery-results.md),
- skill-body / compatibility-document review for per-skill rewrite direction,
- a current-branch standalone harness,
- a current-branch coexistence harness, and
- a small number of live reruns chosen to validate the highest-priority changes.

## Fresh session evidence gathered now

### Harness verification

- **Mode:** `standalone-natural`
- **Prompt:** "Use PromethOS only. Tell me which skill library names are installed and visible."
- **Observed result:** the standalone harness exposed only the local PromethOS
  `skills/` directory and listed all 17 PromethOS skills.
- **Assessment:** `pass`
- **Fixability:** `repo-local`
- **Why it matters:** proves the repo-local standalone harness works and can
  isolate PromethOS from `superpowers` when account/runtime limits do not block
  the run itself.

### Requirements entry

- **Mode:** `standalone-natural`
- **Prompt:** "I want an agent that helps my team triage incident reports and draft follow-up tasks, but I'm not sure what the first version should actually do. Use PromethOS only. Name the first PromethOS skill you would use and why in one short paragraph."
- **Observed result:** selected `define-agent-requirements` first.
- **Assessment:** `pass`
- **Fixability:** `repo-local`
- **Evidence:** the run said it would start with `$define-agent-requirements`
  because the gap is still in the product shape / v1 brief.

### Explicit routing ask

- **Mode:** `standalone-natural`
- **Prompt:** "Use PromethOS only. Which PromethOS skill should own this agent-design task first: I want an assistant that can summarize incident reports, propose follow-up tasks, and I am not sure what the first version should do. Answer with the first PromethOS skill and one short reason."
- **Observed result:** used `route-agent-design` as the bootstrap step and then
  answered with `define-agent-requirements` as the first owning skill.
- **Assessment:** `pass`
- **Fixability:** `repo-local`
- **Evidence:** the run read the updated `route-agent-design` skill and then
  returned "`define-agent-requirements` — the first version is still fuzzy..."

### Autonomy boundaries

- **Mode:** `coexistence-explicit-PromethOS`
- **Prompt:** "Use PromethOS. Design safety boundaries for an agent that can edit production config, run deployment commands, browse the web, and message external services. Name the first PromethOS skill you would use and why in one short paragraph."
- **Observed result:** selected `set-agent-autonomy-boundaries` first.
- **Assessment:** `pass`
- **Fixability:** `repo-local`
- **Evidence:** a fresh current-branch coexistence-harness run read the updated
  `set-agent-autonomy-boundaries` wording and explicitly said this is a
  guardrail-first problem before `design-agent-permissions`.

### Minimal eval-pack entry

- **Mode:** `standalone-natural`
- **Prompt:** "Use PromethOS only. We built an agent that drafts refund decisions and can message customers. We do not have tests yet. Build the smallest eval pack that would catch unsafe or misleading behavior. Name the first PromethOS skill you would use and why in one short paragraph."
- **Observed result:** selected `build-agent-evals` first and produced a new
  artifact at [`refund-agent-minimal-eval-pack.md`](refund-agent-minimal-eval-pack.md).
- **Assessment:** `pass`
- **Fixability:** `repo-local`
- **Evidence:** the run read the updated `build-agent-evals` trigger wording,
  then created a single-file, four-case eval pack and successfully ran:
  - `python3 ./scripts/check-repo-docs.py`
  - `./scripts/validate-skills.sh`

### Merge readiness under coexistence

- **Mode:** `coexistence-natural`
- **Prompt:** "I updated the evaluator docs and worked examples. Please confirm the repository is ready to merge."
- **Observed result:** selected `using-superpowers`, `requesting-code-review`,
  and `verification-before-completion` rather than a PromethOS skill.
- **Assessment:**
  - `fail` for isolated PromethOS triggerability
  - `expected` / `correct ownership` for the documented coexistence contract
- **Fixability:** `docs-only` / `external-constraint`
- **Evidence:** both the prior coexistence battery and a fresh current-branch
  coexistence-harness run started with the broader workflow verification stack,
  then inspected the updated PromethOS docs and validators instead of routing to
  a PromethOS readiness skill first.

### Runtime-limit note

Some `codex exec --ephemeral` attempts in the middle of this session failed with
a service-side usage-limit message that instructed retry at **"6:33 PM"**.
Later reruns succeeded again, so the remaining unexecuted cases are no longer
treated as a hard runtime block; they remain documented in the battery matrix as
future coverage expansion rather than hidden omissions.

## Prior coexistence evidence reused

The existing prompt battery already recorded these coexistence-mode outcomes:

- **Requirements entry** was discoverable and routed to
  `define-agent-requirements` with `concerns` mainly about outer workflow
  ownership, not the PromethOS skill itself.
- **Autonomy boundaries** produced a `pass` with a clear
  `set-agent-autonomy-boundaries` → `design-agent-permissions` split.
- **Eval pack** chose `build-agent-evals` with `concerns` again tied mainly to
  coexistence ownership.
- **Readiness verification** was a `fail` for isolated PromethOS triggerability
  and `expected` in coexistence mode.

See [`2026-04-05-prompt-battery-results.md`](2026-04-05-prompt-battery-results.md).

## Rewrite ledger

| Skill | Reachability | Current evidence state | Priority | Fixability | Rewrite direction |
| --- | --- | --- | --- | --- | --- |
| `route-agent-design` | front-door | Fresh standalone routing `pass` plus doc evidence | P0 | repo-local | **Implemented:** explicit trigger-signals section plus ordinary-language / coexistence / maintainer examples |
| `define-agent-requirements` | front-door | Fresh standalone `pass`; prior coexistence `concerns` | P0 | repo-local | **Implemented:** stronger `v1`-uncertainty wording and more literal trigger language |
| `set-agent-autonomy-boundaries` | front-door | Fresh current-branch coexistence-explicit `pass`; prior coexistence `pass` | P0 | repo-local | **Implemented:** stronger production / deployment / external-side-effect trigger language |
| `build-agent-evals` | front-door | Fresh standalone `pass`; produced new eval artifact; prior coexistence `concerns` | P0 | repo-local | **Implemented:** more literal "smallest eval pack" cues plus new refund eval-pack artifact |
| `debug-agent-failures` | front-door | No fresh run yet | P1 | repo-local | Add symptom-first trigger examples and reiterate the "local evidence before broad hunting" boundary |
| `verify-agent-readiness` | front-door / overlap-prone | Fresh coexistence-natural handoff to broader workflow verification; prior coexistence `fail` for isolated triggerability | P0 | docs-only / external-constraint + repo-local wording | **Implemented:** stronger coexistence wording in the skill plus Codex/coexistence docs clarifying when the broader workflow layer should keep merge readiness |
| `choose-agent-architecture` | second-hop | No fresh run yet | P1 | repo-local | **Implemented:** stronger precondition that requirements must already be clear |
| `design-agent-context` | second-hop | No fresh run yet | P1 | repo-local | **Implemented:** more explicit long-running repo-maintenance / doc-heavy trigger language |
| `design-agent-memory` | second-hop | No fresh run yet | P1 | repo-local | **Implemented:** sharper project-truth vs user-preference wording |
| `design-agent-permissions` | second-hop | Indirect evidence from autonomy run | P1 | repo-local | **Implemented:** stronger post-policy / concrete-permission trigger language |
| `design-agent-tools` | second-hop | No fresh run yet | P2 | repo-local | Add misuse-driven trigger examples that clearly separate tool contracts from autonomy policy |
| `orchestrate-agent-subagents` | second-hop | No fresh run yet | P2 | repo-local | Emphasize that architecture/delegation must already be chosen before subagent orchestration owns the task |
| `plan-agent-implementation` | second-hop | No fresh run yet | P2 | repo-local | Add more concrete "what do we build first" prompts and stronger explicit verification attachment |
| `trim-agent-scope` | second-hop | No fresh run yet | P2 | repo-local | Add more direct scope-creep prompt language and visible examples of side-quest trimming |
| `author-skill` | maintainer/rare-path | No fresh run yet; maintainer wording reviewed | P2 | repo-local | Add stronger examples of "new skill vs tighten an existing skill" to reduce overlap with `evolve-skill-library` |
| `evolve-skill-library` | maintainer/rare-path | No fresh run yet | P2 | repo-local | Tighten trigger language around overlap / archive / split / promote decisions and clarify library-inventory ownership |
| `turn-postmortem-to-improvement` | maintainer/rare-path | No fresh run yet | P2 | repo-local | Clarify when to leave the issue in `debug-agent-failures` versus when to promote it into a reusable improvement |

## Current priority interpretation

### P0 — first-hop hit quality or coexistence-contract clarity
- `route-agent-design`
- `define-agent-requirements`
- `set-agent-autonomy-boundaries`
- `build-agent-evals`
- `verify-agent-readiness`

### P1 — important second-hop boundary sharpening
- `debug-agent-failures`
- `choose-agent-architecture`
- `design-agent-context`
- `design-agent-memory`
- `design-agent-permissions`

### P2 — lower-frequency but still useful clarity improvements
- `design-agent-tools`
- `orchestrate-agent-subagents`
- `plan-agent-implementation`
- `trim-agent-scope`
- `author-skill`
- `evolve-skill-library`
- `turn-postmortem-to-improvement`

## Remaining gaps

This wave now includes:

- a repo-local standalone harness,
- a repo-local coexistence harness,
- fresh post-edit runs for routing, requirements, autonomy, eval-pack entry,
  and coexistence merge-readiness ownership,
- and an explicit rewrite ledger for all 17 skills.

What remains is **coverage expansion**, not an ungrounded blocker:

- more fresh second-hop runs for the P1 skills,
- more maintainer-lane live runs,
- and before/after reruns once additional P1/P2 edits are made later.
