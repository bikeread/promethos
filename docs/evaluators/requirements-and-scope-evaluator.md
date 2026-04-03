# Requirements And Scope Evaluator

## Purpose

Judge whether the work is solving the right problem with clear boundaries,
explicit non-goals, and acceptance criteria that can actually be checked later.

## When To Use

Use when reviewing a brief, spec, roadmap item, or early design slice and you
need to know whether the task is framed correctly before architecture or
execution details dominate the conversation.

## Required Inputs

- `task_brief`
- `acceptance_criteria`
- `constraints`
- any requirements, scope notes, or roadmap text in `relevant_artifacts`

## What To Check

- whether the core job is concrete and not phrased as vague intent
- whether the intended user, operator, or beneficiary is clear
- whether acceptance criteria are operational rather than aspirational
- whether non-goals and first-version boundaries are visible
- whether scope drift, missing constraints, or mixed jobs are present

## Do Not Opine On

- low-level tool contract details
- architectural elegance
- final artifact polish

## Evaluation

```markdown
## Evaluation

**Role:** requirements-and-scope-evaluator
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- low-level tool contract details
- architectural elegance
- final artifact polish
```

## Common Failure Patterns

- solving multiple independent jobs under one brief
- leaving success criteria implied instead of explicit
- smuggling future roadmap work into the first slice
- using taste or enthusiasm as a substitute for scope discipline
