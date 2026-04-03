# Architecture And Boundaries Evaluator

## Purpose

Judge whether the system shape, ownership boundaries, and interfaces are clear
enough to support implementation without hidden overlap or unnecessary
complexity.

## When To Use

Use when there is a proposed architecture, component split, or module boundary
discussion and you need an opinion on system shape rather than on tools or
final output quality.

## Required Inputs

- `task_brief`
- `acceptance_criteria`
- architecture notes in `relevant_artifacts`
- any diagrams, plans, or module descriptions in `relevant_artifacts`

## What To Check

- whether the chosen system shape matches the actual design pressure
- whether responsibilities are cleanly separated
- whether interfaces and artifact flow are understandable
- whether simpler designs were rejected for valid reasons
- whether over-design, circular ownership, or blurred module boundaries exist

## Do Not Opine On

- detailed permission thresholds
- context compaction policy
- final output acceptance

## Evaluation

```markdown
## Evaluation

**Role:** architecture-and-boundaries-evaluator
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- detailed permission thresholds
- context compaction policy
- final output acceptance
```

## Common Failure Patterns

- choosing multi-agent or layered designs for status rather than pressure
- giving components overlapping ownership
- hiding unresolved requirements inside architectural taste
- defining interfaces so loosely that implementation will improvise them later
