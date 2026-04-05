---
name: orchestrate-agent-subagents
description: Use when delegation is already justified and you need safe subagent ownership, context, and merge boundaries.
---

# Goal
Use subagents only when they create real leverage, with clear ownership and safe
integration.

## Inputs
- Main task shape
- Chosen architecture or explicit decision that delegation is warranted
- Available agent capabilities
- Shared context and integration constraints

## Non-Goals
- Making the top-level single-agent vs multi-agent architecture choice
- Using subagents for status or novelty
- Delegating urgent blocking work without a clear handoff

## Workflow

### Trigger signals
- Architecture calls for multiple agents but ownership boundaries are not drawn
- User asks "怎么分工" or "how should we split the work"
- Subagents are being launched without clear context contracts or merge rules

### 1. Restate the delegation boundary
Confirm what part of the system or workflow is already designated for
delegation and what must remain local to the coordinating agent.
**Success criteria**: The orchestration work starts from an explicit delegation
decision instead of reopening the architecture choice.

### 2. Split the work into owned units
Assign each subagent a distinct responsibility, output artifact, and write
scope.
**Success criteria**: Ownership boundaries prevent duplicated work and merge
conflicts.

### 3. Define context and handoff contracts
Specify what context each subagent receives, what it must return, and what it
must not assume.
**Success criteria**: The delegation plan has minimal but sufficient context and
clear artifact expectations.

### 4. Freeze permission, approval, and side-effect inheritance
State which parent-agent permission limits, approval requirements, write scopes,
and side-effect restrictions are inherited by each subagent.
Specify whether a subagent may execute side effects directly or may only return
proposals for the coordinating agent to act on.
**Success criteria**: Delegation does not silently widen autonomy, tool access,
or side-effect authority.

### 5. Define synchronization and merge rules
State when results are needed, how conflicts are resolved, and what main-agent
review is required before integration.
**Success criteria**: The orchestration includes a predictable reintegration path
instead of ad hoc waiting and trust.

### 6. Define interruption and no-delegation rules
Record what kinds of tasks should stay local, what should interrupt a running
subagent, and when delegation should be abandoned.
**Success criteria**: The system knows when not to delegate or when to take work
back.

## Output Contract
A delegation plan that includes:
- the delegated scope,
- per-agent ownership,
- context and artifact contracts,
- inherited permission and approval boundaries,
- merge and review rules,
- explicit no-delegation boundaries.

## Escalation
Pause when:
- subtasks are too interdependent,
- ownership is blurry,
- a subagent would receive broader tool access or side-effect authority than the
  parent agent,
- the very next local step is blocked on delegated results,
- multiple subagents would need to edit the same area without a clear merge
  strategy.

## Common Failure Modes
- Delegating because it feels sophisticated
- Giving subagents too much context and too little ownership
- Silently widening autonomy through delegation
- Giving multiple agents the same responsibility
- Reopening the top-level architecture choice inside an orchestration skill
- Trusting subagent output without integration review
