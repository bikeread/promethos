---
name: build-agent-evals
description: Build a small eval pack that catches agent regressions.
when_to_use: >-
  Use when you need to test whether an agent actually works and catch
  regressions early without building a giant benchmark.
---

# Goal
Create a small but meaningful evaluation set that can catch regressions and
false confidence early.

## Inputs
- Agent goals and key behaviors
- Known failure modes
- Available test harnesses, traces, or manual checks

## Non-Goals
- Building a giant benchmark suite before the core workflow is stable
- Equating one happy-path demo with real evaluation coverage

## Workflow

### Trigger signals
- Agent is nearing completion but has no test cases
- User asks "怎么验" or "how do we know it works"
- Behavior was recently changed and nothing checks for regressions
- Agent has been deployed but no one defined what "working correctly" means

### 1. Choose the behaviors that matter most
Identify the actions or decisions that would make the agent untrustworthy if
they failed: planning quality, tool use, recovery, memory handling, approval
respect, or output correctness.
Rank them by user impact and by how likely they are to regress.
**Success criteria**: The eval scope is centered on real risk, not on what is
easy to test.

### 2. Build a minimal scenario set
Create a compact mix of cases that covers the important behaviors: a normal
success, an ambiguous request, a tool failure, a recovery path, and any
context-pressure case that is part of the real task.
If the agent can take consequential actions, include at least one negative case
for refusal, checkpointing, escalation, or approval-boundary compliance.
Keep each scenario specific enough that a human can tell what good behavior
looks like.
**Success criteria**: The harness exercises the agent across success, failure,
and recovery instead of only the easiest path.

### 3. Define scoring and judgment rules
Write what counts as pass, concerns, fail, or unacceptable, and note what
artifacts a reviewer should inspect to make the call consistently.
If a metric is used, explain what behavior it is actually standing in for.
**Success criteria**: Another reviewer can score the same run without inventing
their own rubric.

### 4. Make the harness repeatable
Record the prompt, inputs, expected signals, and rerun process so the same
cases can be used for regression after changes.
Include a short note on which failures are stable regressions versus expected
variance.
**Success criteria**: The eval can be rerun later and compared against the same
baseline.

## Output Contract
A focused evaluation pack containing:
- the prioritized behavior list,
- the scenario inventory, including negative safety or honesty cases where relevant,
- the scoring rubric and judgment rules,
- the inspectable artifacts or signals to review,
- the rerun procedure and baseline comparison notes.

## Escalation
Pause when:
- the cases do not resemble the real task shape,
- the scoring criteria are too subjective to reuse,
- the harness only measures proxy signals,
- important behavior cannot be observed from the available artifacts,
- consequential actions exist but the harness lacks refusal, escalation, or
  approval-compliance cases.

## Common Failure Modes
- Overfitting to a demo flow that never happens in practice
- Measuring only what is easy to script instead of what actually matters
- Adding too many cases before the core set is stable
- Forgetting a negative safety or honesty case when the agent has real side effects
- Using vague pass criteria that force a new judgment every time
