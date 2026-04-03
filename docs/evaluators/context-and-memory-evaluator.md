# Context And Memory Evaluator

## Purpose

Judge whether context loading, retrieval, compression, and memory-layering
rules are selective, stable, and grounded in a real task loop.

## When To Use

Use when the work depends on context strategy, memory policy, retrieval, or
compaction behavior and you need to know whether the information model is
coherent.

## Required Inputs

- `task_brief`
- `constraints`
- context or memory design artifacts in `relevant_artifacts`
- any execution traces that expose context pressure or retrieval behavior

## What To Check

- whether the immediate working set is minimal but sufficient
- whether eager, deferred, and retrieved information are clearly separated
- whether source-of-truth and compression rules are explicit
- whether memory layers have distinct write, read, and freshness rules
- whether stale memory, context bloat, or hidden retrieval assumptions exist

## Do Not Opine On

- final result quality
- general architecture preference unless it directly breaks context design
- permission thresholds except where they affect information access

## Evaluation

```markdown
## Evaluation

**Role:** context-and-memory-evaluator
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- final result quality
- general architecture preference unless it directly breaks context design
- permission thresholds except where they affect information access
```

## Common Failure Patterns

- front-loading too much context
- treating summaries as source of truth
- storing volatile information as durable memory
- mixing preference memory, project truth, and retrieved records together
