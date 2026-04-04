# Skill Alignment Matrix

## Status Meanings

- `Keep`: the skill already captures a reusable agent-design decision.
- `Keep, narrow`: keep the skill, but move Claude Code runtime specifics into
  `references` or `evals`.
- `Keep, rename follow-up`: the decision is real, but the name or framing may
  still drift.

## Bootstrap

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `using-promethos` | Detect agent-design intent and route to the right methodology layer | Keep | Must stay a bootstrap and compatibility layer, not a generic workflow owner |

## Meta

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `meta-skill-authoring` | Turn a repeated decision point into a well-bounded skill | Keep | Generalizes well beyond Claude Code |
| `meta-skill-evolution` | Prune and reshape the library based on evidence | Keep | Should stay evidence-driven, not theory-driven |

## Flow

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `flow-agent-requirements-clarification` | Turn a vague agent idea into an explicit brief | Keep | Core first-hop design skill |
| `flow-agent-architecture-design` | Choose the right agent structure and boundaries | Keep | Architecture pressure is portable across runtimes |
| `flow-agent-implementation-planning` | Turn an approved design into executable tasks | Keep, narrow | Plan-mode specifics belong in references, not the core skill |
| `flow-systematic-agent-debugging` | Move from symptom to root cause before changing behavior | Keep | Portable diagnostic discipline |
| `flow-verification-before-completion` | Require fresh evidence before success claims | Keep | One of the strongest reusable governance rules |

## Capability

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `cap-tool-contract-design` | Define safe, legible tool contracts for agents | Keep | Portable across tool surfaces |
| `cap-context-engineering` | Decide what the agent should read now vs later | Keep | Claude Code provides strong source pressure, but the principle is general |
| `cap-memory-strategy-design` | Decide what persists and how freshness is maintained | Keep, narrow | Concrete memory taxonomies and storage modes belong in references |
| `cap-permission-model-design` | Translate policy into enforceable permission mechanics | Keep, narrow | Exact runtime mode names and approval mechanics belong in references |
| `cap-subagent-orchestration` | Design delegated ownership, context handoff, and merge behavior | Keep, narrow | Coordinator-worker runtime details should stay outside the taxonomy body |

## Guard

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `guard-safe-autonomy-guardrails` | Set stop conditions and autonomous action boundaries | Keep | High-value reusable design guard |
| `guard-anti-bloat-scope-control` | Keep plans, agents, and skills from expanding uncontrollably | Keep | Stable and provider-neutral |

## Eval

| Skill | Generalized responsibility | Decision | Notes |
|---|---|---|---|
| `eval-agent-evaluation-harness` | Build a small, meaningful evaluation set | Keep | Needed to keep the framework honest |
| `eval-postmortem-to-skill` | Turn incidents into reusable improvements | Keep, rename follow-up | The body already spans skill, rule, guardrail, and eval outcomes; a later rename to `...-to-improvement` is plausible |

## Framework Gaps To Fill With References Or Evals

These do not currently justify new taxonomy skills. They are better treated as
supporting material:

- subagent lifecycle and merge hygiene
- worktree and session isolation patterns
- harness smoke-test expectations
- portability limits when a source behavior only exists in one runtime

These gaps match the current roadmap pressure and should default to
`references` or `evals` before any new taxonomy expansion.
