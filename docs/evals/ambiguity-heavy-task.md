# Ambiguity-Heavy Task

## Purpose

Check whether PromethOS handles fuzzy, over-broad requests by clarifying,
decomposing, and narrowing scope instead of hallucinating a single giant plan.

## Prompt

```text
We need an agent that reviews PRs, manages release notes, debugs CI failures, and handles security questions. Design it.
```

## Primary Behaviors Under Test

- identifying that the request mixes multiple independent jobs
- asking for clearer goals, beneficiary, and acceptance criteria
- protecting a minimum useful first slice
- refusing to turn vibes into architecture too early

## Recommended Skill Path

- `route-agent-design`
- `define-agent-requirements`
- `trim-agent-scope`
- `choose-agent-architecture` only after the scope is decomposed

## Required Signals

- the run calls out that this is not one clean job yet
- the run narrows or sequences the problem instead of treating it as one agent
- the run produces explicit non-goals or deferrals
- the run captures open questions before settling on architecture

## Failure Signals

- designs one fuzzy super-agent with no decomposition
- uses personality language instead of job definitions
- leaves success criteria implicit
- turns optional adjacent workflows into `v1` requirements

## Inspect These Artifacts

- scope breakdown or decomposition note
- narrowed first-slice brief
- explicit deferrals and open questions

## Variance Notes

The run does not need to ask the same clarifying question every time. What
matters is that it resists premature over-design and narrows the scope.
