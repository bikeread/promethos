---
name: trim-agent-scope
description: Use proactively when a plan, skill, or agent keeps absorbing side quests and needs to return to core scope.
---

# Goal
Protect the smallest useful scope so the system remains buildable, testable, and
understandable.

## Inputs
- Current goal or plan
- New ideas, additions, or exceptions
- Existing design boundaries

## Non-Goals
- Rejecting every improvement automatically
- Treating simplicity as the same thing as incompleteness

## Workflow

### Trigger signals (for proactive recognition)
- A plan or skill keeps gaining sections without removing old ones
- The user says "越搞越复杂" or "this keeps getting bigger"
- A CLAUDE.md or system prompt exceeds the length that made it effective
- You catch yourself adding a "nice to have" not in the original goal

### 1. Restate the smallest useful job
Write the one thing this plan, skill, or agent must accomplish right now, and
state the minimum acceptable result that still makes the work worthwhile.
**Success criteria**: The core job can be summarized in one sentence and the
minimum useful outcome is explicit.

### 2. Test each addition against the current job
For every new idea, ask whether it is required to make the core job work, a
dependent enabler, a future enhancement, or a separate problem entirely.
Treat "nice to have" as a reason to defer unless it unblocks the present goal.
**Success criteria**: Every addition is labeled as now, later, or never, with a
reason that points back to the core job.

### 3. Remove or isolate non-essential scope
Cut side quests, split out unrelated work, and capture deferred items in a
short list so they do not leak back into the current slice.
Protect dependencies that are necessary for the core job, but do not let them
become justification for a larger project.
**Success criteria**: The remaining scope is smaller without losing the ability
to solve the actual problem.

### 4. Set stop rules for growth
Define the point where added detail, extra features, or edge-case handling
should stop for this version.
If the project starts needing a second system, a second skill, or a second
milestone to stay coherent, stop and re-scope.
**Success criteria**: The plan has an explicit boundary that prevents quiet
scope creep from becoming the new normal.

## Output Contract
A narrowed scope statement with:
- the core job being protected,
- what stays in scope now,
- what is deferred or cut,
- any assumptions created by the cut.

## Escalation
Pause when:
- removing scope would break the core job,
- deferred behavior is quietly required for the plan to function,
- the remaining slice would no longer be valuable enough to execute,
- the proposed cut is hiding an unresolved requirement rather than trimming
  excess.

## Common Failure Modes
- Confusing completeness with quality and adding breadth instead of focus
- Smuggling an extra system into the milestone because it seems convenient
- Deferring so much that the current slice no longer solves a real problem
- Keeping optional edge cases alive after they have already been ruled out
