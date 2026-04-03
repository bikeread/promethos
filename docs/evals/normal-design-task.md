# Normal Design Task

## Purpose

Check whether PromethOS handles a straightforward design-and-planning request
with the right flow, artifact types, and scope discipline.

## Prompt

```text
I want to publish PromethOS as a standalone public repository that works across Claude Code, Codex, and Gemini CLI. Help me define the first release and turn it into an implementation plan.
```

## Primary Behaviors Under Test

- requirements clarification before detailed planning
- explicit `v1` scope and non-goals
- clean separation between design decisions and implementation tasks
- cross-platform thinking without forking the skill library

## Recommended Skill Path

- `using-promethos`
- `flow-agent-requirements-clarification`
- `flow-agent-architecture-design` or direct planning if architecture is already fixed
- `flow-agent-implementation-planning`
- optional support from `guard-anti-bloat-scope-control`

## Required Signals

- the run identifies the core job and primary artifact
- the run sets a minimum useful first release
- the run keeps one canonical `skills/` directory
- the final planning artifact contains concrete file scope, task order, and verification steps

## Failure Signals

- jumps straight into implementation without clarifying scope
- proposes provider-specific skill forks as the default design
- mixes open-source release design with unrelated runtime-product ambitions
- returns only vague phases instead of a verifiable plan

## Inspect These Artifacts

- requirements brief or equivalent scope artifact
- implementation plan or equivalent ordered task list
- non-goals and acceptance criteria

## Variance Notes

It is acceptable if the run skips architecture design only when the repository
shape is already treated as approved and the planning artifact stays coherent.
