---
name: design-agent-tools
description: Design a tool interface an agent can use correctly.
when_to_use: >-
  Use when a tool contract is unclear or an agent misuses a tool because
  the inputs, errors, or side effects are underspecified.
---

# Goal
Define a tool contract that is easy for an agent to use correctly and hard to
misuse silently.

## Inputs
- Tool purpose
- Upstream caller expectations
- Expected failure conditions and side effects

## Non-Goals
- Implementing the tool runtime
- Designing the entire agent around a single tool
- Choosing the approval or autonomy policy that governs the tool

## Workflow

### Trigger signals
- Agent calls a tool with wrong arguments repeatedly
- Tool errors are vague and the agent cannot recover
- User says "it keeps misusing this tool"
- A new tool is being added without a documented contract

### 1. State the job the tool owns
Describe the single job the tool performs and the caller state it expects before
invocation.
**Success criteria**: The tool has one clear purpose and is not acting as a
generic escape hatch.

### 2. Define input and output invariants
Specify what the tool accepts, what shape it returns, and what fields the caller
may depend on every time.
**Success criteria**: The contract is explicit enough to implement and consume
without guessing field meanings.

### 3. Define error classes and retry behavior
Separate validation errors, environmental failures, permission denials, and
transient faults. State what is safe to retry and what is not.
**Success criteria**: The calling agent can distinguish recoverable from
terminal failure paths.

### 4. Decide idempotency and replay behavior
State whether repeated calls with the same intent are safe, unsafe, or
conditionally safe, and describe what the caller must do before retrying a
mutating operation.
**Success criteria**: Retry behavior and idempotency expectations are explicit,
especially for writes and external side effects.

### 5. Make side effects and governing permission references visible
Document whether the tool reads, writes, mutates state, triggers external
effects, and which existing permission or autonomy class the caller should
apply when invoking it.
**Success criteria**: The tool's risk profile is obvious from the contract
without making the tool contract itself the owner of approval policy.

### 6. Check the contract against agent usability
Confirm the contract is structured, narrow, and predictable enough for an agent
to use reliably under pressure.
**Success criteria**: The contract favors correct use over convenience-driven
ambiguity.

## Output Contract
A tool interface specification that includes:
- purpose and preconditions,
- input schema,
- output schema or invariants,
- error taxonomy,
- idempotency and replay rules,
- retry rules,
- side-effect profile,
- any applicable permission-class or checkpoint references.

## Escalation
Pause when:
- the tool is trying to solve multiple unrelated jobs,
- the outputs are not actionable enough for a caller to branch on,
- retry semantics depend on unknown side-effect behavior,
- mutating behavior exists without an idempotency decision,
- a destructive tool lacks an existing governing permission or autonomy class.

## Common Failure Modes
- Returning vague free-form text when structure is needed
- Using one tool as a wrapper around many hidden behaviors
- Hiding side effects
- Letting the tool contract decide approval policy instead of referencing it
- Designing retries without idempotency rules
