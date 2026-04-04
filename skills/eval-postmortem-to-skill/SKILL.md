---
name: eval-postmortem-to-skill
description: Turn an incident or success into a reusable improvement.
when_to_use: >-
  Use after a failure, correction, or great workflow to decide what
  reusable change — guardrail, eval, skill, or rule — should come from it.
---

# Goal
Convert isolated experience into a reusable improvement to the skills library or
evaluation stack.

## Inputs
- Incident transcript, bug, or success case
- Root cause or corrective discussion
- Current related skills and evals

## Non-Goals
- Writing a blame document
- Creating a new skill before understanding the actual pattern

## Workflow

### Trigger signals
- A bug was just fixed and user asks "怎么防止再犯" or "how do we prevent this"
- A debugging session ended with a confirmed root cause
- An unexpectedly smooth workflow deserves capture before context is lost
- Not for drafting the final skill once the remediation layer is already chosen

### 1. Capture the incident or success as evidence
Record what triggered the situation, what the agent tried to do, what happened,
and which details actually mattered to the outcome.
Include enough context that someone else could recognize the same pattern
later.
**Success criteria**: The event is written as a concrete case with observable
facts, not as a vague lesson.

### 2. Identify the real failure or success pattern
Strip away the surface symptoms and name the reusable pattern underneath: a
bad assumption, a missing guardrail, an eval gap, a workflow win, or a skill
boundary that should change.
Separate one-off noise from behavior that is likely to repeat.
**Success criteria**: The root pattern is clear enough to justify a reusable
change, or the incident is correctly classified as non-repeatable.

### 3. Choose the lightest effective remediation layer
Decide whether the fix belongs in an existing skill, a new skill, a guardrail,
an evaluation, a plan template, or a simple rule or reference update.
Prefer the smallest change that will actually stop the recurrence or preserve
the useful pattern.
**Success criteria**: The proposed remedy matches the real failure mode and is
no larger than necessary.

### 4. Draft the reusable update and follow-up check
Write the concrete change, including what will be added, revised, removed, or
tested next.
If the update affects behavior, note how it should be verified later.
**Success criteria**: The change is actionable, tied to the pattern, and has a
clear next check or follow-through step.

## Output Contract
A reusable improvement package containing:
- the evidence summary,
- the reusable pattern or lesson,
- the chosen remediation layer,
- the concrete update to make,
- the next verification or follow-through step.

## Escalation
Pause when:
- the underlying cause is still uncertain,
- the incident is too context-specific to generalize,
- the proposed lesson would create more noise than value,
- the right remediation layer still depends on unresolved design decisions.

## Common Failure Modes
- Generalizing from a single anecdote before the pattern is understood
- Writing a new skill when a guardrail, eval, or rule change is enough
- Fixing symptoms without updating the reusable system that allowed them
- Turning a postmortem into a blame report instead of a design improvement
