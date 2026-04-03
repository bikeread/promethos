# Outcome And Verification Evaluator

## Purpose

Judge whether the final artifact is acceptable, whether the stated acceptance
criteria are actually met, and whether completion claims are backed by fresh
evidence.

## When To Use

Use last, once there is a finished artifact, a meaningful diff or output, and
real verification evidence to inspect.

## Required Inputs

- `task_brief`
- `acceptance_criteria`
- `diff_or_output`
- `execution_trace`
- verification commands, results, or transcripts in `relevant_artifacts`

## What To Check

- whether the final artifact satisfies the stated acceptance criteria
- whether verification evidence is fresh, relevant, and complete enough
- whether residual risk or unverified scope is being hidden
- whether “done” is supported by evidence instead of optimism
- whether outcome defects are concrete or merely stylistic disagreement

## Do Not Opine On

- earlier planning elegance unless it caused a concrete output defect
- architectural taste
- unrelated process issues that do not affect the final deliverable

## Evaluation

```markdown
## Evaluation

**Role:** outcome-and-verification-evaluator
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- earlier planning elegance unless it caused a concrete output defect
- architectural taste
- unrelated process issues that do not affect the final deliverable
```

## Common Failure Patterns

- calling work complete based on inspection alone
- passing one happy-path check and treating it as full verification
- hiding unverified requirements behind a clean diff
- confusing disagreement over style with failure to meet acceptance criteria
