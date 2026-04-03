# Execution Quality Evaluator

## Purpose

Judge whether the plan, task ordering, tool-use path, failure recovery, and
delegation choices reflect disciplined execution rather than improvised motion.

## When To Use

Use when there is a real execution path to inspect: a plan, a transcript, a
tool trace, or a sequence of implementation decisions.

## Required Inputs

- `task_brief`
- `acceptance_criteria`
- `execution_trace`
- plans, checkpoints, or transcripts in `relevant_artifacts`

## What To Check

- whether the execution order reflects dependencies and risk
- whether tasks are thin enough to verify independently
- whether tool use follows a coherent path instead of flailing
- whether failures cause disciplined recovery rather than scope explosion
- whether subagent use, if any, is justified and bounded

## Do Not Opine On

- whether the original goal was correct
- abstract architecture preference unless it affected execution quality
- final artifact value in isolation from the execution trace

## Evaluation

```markdown
## Evaluation

**Role:** execution-quality-evaluator
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- whether the original goal was correct
- abstract architecture preference unless it affected execution quality
- final artifact value in isolation from the execution trace
```

## Common Failure Patterns

- hiding risk inside a giant implementation step
- skipping verification until the end
- delegating for novelty rather than leverage
- treating activity volume as evidence of progress
