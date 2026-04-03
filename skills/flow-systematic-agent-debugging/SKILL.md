---
name: flow-systematic-agent-debugging
description: Diagnose agent failures methodically, using evidence to isolate root causes before changing behavior.
when_to_use: >-
  Use when an agent misbehaves, loops, hallucinates, calls tools incorrectly, or degrades under context pressure. Examples: "debug this agent", "why is the agent looping", "find the root cause of this tool failure"
---

# Goal
Move from a vague symptom to a defensible root-cause hypothesis and a small next
fix.

## Inputs
- Failure symptom or transcript
- Relevant logs, prompts, traces, or outputs
- Current implementation context

## Non-Goals
- Jumping straight to fixes because they sound plausible
- Rewriting large parts of the system without isolating the failure mode

## Workflow

### 1. Reproduce and classify the symptom
State what went wrong, under what conditions it happens, and whether it looks
like a planning, context, tool, permission, memory, or orchestration failure.
**Success criteria**: The bug is framed as a reproducible failure class rather
than a vague impression.

### 2. Collect the smallest decisive evidence
Inspect the transcript, prompts, tool calls, logs, state transitions, and input
artifacts needed to narrow the search space without drowning in noise.
If the current workspace does not actually contain the target system's code,
logs, traces, config, or transcripts, stop and ask for the real evidence
source before widening the search. Do not substitute broad searches across
unrelated repositories for the missing local evidence.
**Success criteria**: The likely causes are constrained by actual evidence.

### 3. Form competing root-cause hypotheses
List the smallest plausible explanations and note what evidence would confirm or
disprove each one.
**Success criteria**: Debugging has explicit hypotheses rather than a single
unchallenged guess.

### 4. Test the leading hypothesis with the smallest intervention
Choose the least invasive change, probe, or experiment that can separate the
best explanation from the rest.
**Success criteria**: There is a clear next action tied to the strongest
hypothesis.

### 5. Re-check the symptom after the intervention
Verify whether the failure changed, disappeared, or exposed a different layer of
the problem.
**Success criteria**: The debugging loop updates the theory based on fresh
evidence instead of assuming success.

### 6. Decide the reusable follow-through
If the intervention confirms the root cause or fixes a real defect, decide
whether the result must produce a regression case, an eval update, or a
postmortem entry so the same failure mode is less likely to return silently.
**Success criteria**: A durable follow-through action is recorded whenever the
debugging outcome changes expected behavior or closes a real defect.

## Output Contract
A debugging brief containing:
- the symptom and reproduction conditions,
- the evidence collected,
- the leading and rejected hypotheses,
- the chosen intervention,
- the observed result after that intervention,
- any required regression, eval, or postmortem follow-through.

## Escalation
Pause when:
- the symptom cannot be reproduced at all,
- key evidence is unavailable,
- multiple independent failures are overlapping,
- the active workspace does not contain the system being debugged and the next
  move would be to search unrelated repositories instead of asking for the real
  repo, file path, log, or transcript,
- proposed fixes would rewrite a large subsystem before a hypothesis is tested.

## Common Failure Modes
- Treating symptoms as causes
- Fixing the most visible layer instead of the failing layer
- Debugging from intuition alone
- Replacing missing local evidence with broad cross-repo pattern hunting
- Expanding scope before the first hypothesis is tested
