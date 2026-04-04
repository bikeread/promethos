# Claude Code Design Principles

## Purpose

PromethOS is downstream of Claude Code.

Its job is to extract the reusable agent-development principles that Claude
Code made visible, then express those principles in a form that can survive
outside a single runtime.

This document defines that abstraction boundary.

## What PromethOS Should Preserve

PromethOS should preserve the stable design pressures that appear in real agent
systems:

- work moves through recurring decision points, not one giant playbook
- context, memory, permissions, and delegation need separate ownership
- verification must be tied to evidence rather than optimistic claims
- risky behavior should be governed explicitly, not hidden in general guidance
- the library should evolve from failures, review, and repeated use

## What PromethOS Should Not Preserve Literally

PromethOS should not treat Claude Code implementation details as public
taxonomy by default.

These stay out of ordinary skills unless they already have a stable,
provider-neutral abstraction:

- product UI and onboarding flows
- auth, telemetry, and feature gates
- exact permission mode names
- exact command names or slash commands
- mailbox, bridge, or transport implementation
- provider-specific rollout mechanics

## Core Abstraction Principles

### 1. Split by decision points, not product features

Claude Code makes many agent concerns visible at once, but PromethOS should
only promote stable decision points into skills.

A good skill answers one repeatable question such as:

- what should this agent do
- how should this subsystem be designed
- where must the agent stop and ask
- how do we verify that this claim is real

### 2. Keep flow separate from subsystem design

Claude Code exposes both phase control and subsystem constraints. PromethOS
should keep those distinct:

- `flow-*` owns what happens next
- `cap-*` owns how a subsystem should be designed well

This prevents planning, context design, memory design, and permission design
from collapsing into one oversized skill.

### 3. Separate autonomy policy from permission mechanics

Claude Code shows both high-level approval boundaries and concrete permission
configuration. PromethOS should preserve that split:

- `guard-*` decides what the agent may do on its own
- `cap-*` decides how that policy becomes concrete mechanics

This keeps risk philosophy separate from runtime enforcement detail.

### 4. Separate active context from durable memory

Claude Code makes it obvious that "what the agent reads now" and "what it
remembers later" are different problems.

PromethOS should keep those as separate design surfaces:

- `cap-context-engineering` owns current working context
- `cap-memory-strategy-design` owns persistence, freshness, and recall layers

### 5. Treat delegation as conditional, not default

Claude Code has real coordinator-worker behavior, but the reusable principle is
not "always use subagents." The reusable principle is:

- decide architecture first
- delegate only when it creates leverage
- design handoff, ownership, and merge rules explicitly

That is why architecture and orchestration stay in separate skills.

### 6. Require evidence before completion

One of the strongest Claude Code design lessons is that verification is not a
nice-to-have polish step. It is a governance rule.

PromethOS should keep "evidence before claims" as a first-class behavior across
flow, eval, and library review work.

### 7. Put runtime detail in references, not taxonomy

When a Claude Code mechanism explains why a boundary matters, PromethOS should
usually capture it as a `reference` rather than inflating a skill body with
provider-specific detail.

Examples:

- plan mode behavior
- permission mode examples
- memory freshness constraints
- coordinator-worker lifecycle details

### 8. Evolve the library from evidence

Claude Code's strongest patterns did not come from taxonomy purity alone. They
came from repeated failures, corrections, and observed runtime pressure.

PromethOS should therefore evolve through:

- worked examples
- eval scenarios
- runtime-grounded references
- postmortem-driven library maintenance

## Claude Code Signals And Their PromethOS Landing Zone

| Claude Code signal | Reusable principle | PromethOS landing zone |
|---|---|---|
| Plan-mode phases and interview flow | Agent work benefits from inspectable phases and explicit artifacts | `flow-*` skills plus runtime `references` |
| Permission modes, rules, and approval paths | Autonomy policy and concrete permission mechanics are separate decisions | `guard-*`, `cap-*`, and `references` |
| Memory taxonomy and freshness caveats | Durable memory needs ownership and freshness rules | `cap-memory-strategy-design` plus `references` |
| Context pressure and compaction behavior | Current working context must be curated independently of memory | `cap-context-engineering` plus `references` |
| Coordinator-worker runtime | Delegation requires explicit ownership and merge discipline | `flow-agent-architecture-design`, `cap-subagent-orchestration`, and `references` |
| Verification discipline before claims | Completion claims require fresh proof | `flow-verification-before-completion` and `eval-*` |
| Internal skill library maintenance | The library itself needs governance and pruning | `meta-*` skills plus evaluator docs |

## Consequences For PromethOS

- PromethOS should describe generalized agent-design decisions, not Claude Code
  product behavior.
- Claude Code should remain a primary upstream source of evidence, not the
  literal vocabulary of every taxonomy skill.
- When a concept only makes sense with Claude Code's exact runtime names, it
  should default to `reference`, not `skill`.
- The public library should stay small and decision-oriented even when the
  upstream runtime is large.
