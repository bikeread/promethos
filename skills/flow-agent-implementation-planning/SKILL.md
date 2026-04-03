---
name: flow-agent-implementation-planning
description: Turn an approved agent design into a concrete, ordered implementation plan with checkpoints and validation.
when_to_use: >-
  Use when architecture is approved and work needs to be broken into executable tasks. Examples: "write the build plan", "turn this design into steps", "what order should we implement this agent"
---

# Goal
Produce a clear implementation sequence that can be executed incrementally and
verified along the way.

## Inputs
- Approved architecture
- Relevant codebase context
- Constraints on tooling, time, and verification

## Non-Goals
- Revisiting the architecture without evidence
- Writing vague tasks that hide complexity

## Workflow

### 1. Freeze the implementation surface
Translate the architecture into concrete files, modules, or documents to create
or modify, and assign each one a single responsibility.
**Success criteria**: The work is decomposed into concrete units instead of one
large implementation blob.

### 2. Define thin, verifiable tasks
Break the work into steps that each produce a visible result and can be checked
independently.
**Success criteria**: Each task is small enough to execute and verify without
guessing hidden substeps.

### 3. Order tasks by dependency and risk
Sequence the work so foundations come first, risky assumptions are tested early,
and later tasks build on already verified behavior.
**Success criteria**: The task order reflects both dependency flow and risk
reduction.

### 4. Attach verification to every stage
State the command, inspection, or artifact review that proves each stage is
actually complete.
**Success criteria**: The plan defines evidence for every meaningful step, not
just activity labels.

### 5. Decide where reusable eval coverage is required
For any behavior change, recovery path, or safety-sensitive flow, state whether
the implementation plan must add or refresh reusable regression or evaluation
coverage.
**Success criteria**: The plan makes explicit when verification ends at the
current change and when it must be promoted into reusable eval coverage.

### 6. Check the plan against scope discipline
Review the plan for YAGNI violations, unresolved architecture questions, and
tasks that are too vague or too broad.
**Success criteria**: The final plan is narrow, executable, and aligned with the
approved design.

## Output Contract
An implementation plan that includes:
- file or module scope,
- bite-sized task boundaries,
- dependency-aware ordering,
- explicit verification steps,
- any required eval or regression-follow-through,
- visible checkpoints for high-risk changes.

## Escalation
Pause when:
- the plan still depends on unresolved architecture choices,
- a task cannot be expressed as an independently verifiable unit,
- critical files or interfaces remain unnamed,
- the only verification strategy is "inspect the code."

## Common Failure Modes
- Planning by phase names instead of concrete work
- Writing tasks that hide multiple logical steps
- Hiding risk inside a giant "implement" step
- Treating validation as an afterthought
