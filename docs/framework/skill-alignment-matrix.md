# Skill Alignment Matrix

## Status Meanings

- `Keep boundary`: the decision stays distinct in the library.
- `Rename now`: the decision is real, but the public name should become
  task-first.
- `Keep, narrow`: keep the decision, but move runtime specifics into
  `references` or `evals`.

## Core Entry Layer

| Current skill | Target public name | Generalized responsibility | Decision | Notes |
|---|---|---|---|---|
| `using-promethos` | `route-agent-design` | Detect agent-design intent and route to the right methodology layer | Rename now | Must stay a bootstrap and compatibility layer, not a generic workflow owner |
| `flow-agent-requirements-clarification` | `define-agent-requirements` | Turn a vague agent idea into an explicit brief | Rename now | Core first-hop design skill |
| `guard-safe-autonomy-guardrails` | `set-agent-autonomy-boundaries` | Set stop conditions and autonomous action boundaries | Rename now | High-value reusable design guard |
| `eval-agent-evaluation-harness` | `build-agent-evals` | Build a small, meaningful evaluation set | Rename now | Needed to keep the framework honest |
| `flow-systematic-agent-debugging` | `debug-agent-failures` | Move from symptom to root cause before changing behavior | Rename now | Portable diagnostic discipline |
| `flow-verification-before-completion` | `verify-agent-readiness` | Require fresh evidence before success claims | Rename now | One of the strongest reusable governance rules |

## Design Deepening Layer

| Current skill | Target public name | Generalized responsibility | Decision | Notes |
|---|---|---|---|---|
| `flow-agent-architecture-design` | `choose-agent-architecture` | Choose the right agent structure and boundaries | Rename now | Architecture pressure is portable across runtimes |
| `flow-agent-implementation-planning` | `plan-agent-implementation` | Turn an approved design into executable tasks | Rename now | Plan-mode specifics belong in references, not the core skill |
| `cap-context-engineering` | `design-agent-context` | Decide what the agent should read now vs later | Rename now | Principle is general beyond Claude Code |
| `cap-memory-strategy-design` | `design-agent-memory` | Decide what persists and how freshness is maintained | Rename now | Concrete memory taxonomies belong in references |
| `cap-permission-model-design` | `design-agent-permissions` | Translate policy into enforceable permission mechanics | Rename now | Exact runtime mode names belong in references |
| `cap-tool-contract-design` | `design-agent-tools` | Define safe, legible tool contracts for agents | Rename now | Portable across tool surfaces |
| `cap-subagent-orchestration` | `orchestrate-agent-subagents` | Design delegated ownership, context handoff, and merge behavior | Rename now | Coordinator-worker runtime details stay outside the taxonomy body |
| `guard-anti-bloat-scope-control` | `trim-agent-scope` | Keep plans, agents, and skills from expanding uncontrollably | Rename now | Stable and provider-neutral |

## Maintainer Layer

| Current skill | Target public name | Generalized responsibility | Decision | Notes |
|---|---|---|---|---|
| `meta-skill-authoring` | `author-skill` | Turn a repeated decision point into a well-bounded skill | Rename now | Generalizes well beyond Claude Code |
| `meta-skill-evolution` | `evolve-skill-library` | Prune and reshape the library based on evidence | Rename now | Should stay evidence-driven, not theory-driven |
| `eval-postmortem-to-skill` | `turn-postmortem-to-improvement` | Turn incidents into reusable improvements | Rename now | The body already spans skill, rule, guardrail, and eval outcomes |

## Framework Gaps To Fill With References Or Evals

These do not currently justify new public skills. They are better treated as
supporting material:

- subagent lifecycle and merge hygiene
- worktree and session isolation patterns
- harness smoke-test expectations
- portability limits when a source behavior only exists in one runtime

These gaps match the current roadmap pressure and should default to
`references` or `evals` before any new library expansion.
