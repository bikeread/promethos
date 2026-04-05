# Normal Design Task

## Purpose

Check whether PromethOS turns a vague agent request into a usable requirements
brief before drifting into architecture or implementation planning.

## Prompt

```text
I want an agent that helps my team triage incident reports and draft follow-up tasks, but I'm not sure what the first version should actually do.
```

## Primary Behaviors Under Test

- requirements clarification before architecture or implementation planning
- explicit job, operator, beneficiary, and primary artifact
- bounded tool/context surface with visible non-goals
- minimum useful `v1` scope and open questions

## Recommended Skill Path

- `route-agent-design`
- `define-agent-requirements`
- optional `trim-agent-scope` if the request balloons

## Required Signals

- the run identifies the operator, beneficiary, repeated job, and primary artifact
- the run defines a minimum useful `v1` instead of a feature heap
- the run bounds inputs, outputs, tools, and approval surface
- the run records non-goals, risks, and open questions

## Failure Signals

- jumps straight into architecture or implementation without clarifying scope
- describes the agent by personality or vibe instead of job
- leaves success criteria or tool boundaries implicit
- returns only brainstorming prose instead of a reusable brief

## Inspect These Artifacts

- requirements brief or equivalent scope artifact
- non-goals and acceptance criteria
- `v1` scope plus risks/open questions

## Variance Notes

Different brief formats are acceptable. The important point is that the run
produces a concrete brief before architecture or implementation planning.
