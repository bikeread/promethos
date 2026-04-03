# Multi-Angle Evaluator Stack

## Goal

Review agent-design and agent-execution work from multiple independent angles
without collapsing everything into one vague reviewer.

## Why This Exists

PromethOS keeps evaluators separate from taxonomy skills:

- skills guide decisions and workflow execution
- evaluators judge quality, gaps, and evidence

This separation makes it easier to compare results, preserve role boundaries,
and avoid one reviewer opining on everything.

## Evaluator Set

The default stack contains six roles:

1. `requirements-and-scope-evaluator`
2. `architecture-and-boundaries-evaluator`
3. `tool-and-permission-evaluator`
4. `context-and-memory-evaluator`
5. `execution-quality-evaluator`
6. `outcome-and-verification-evaluator`

## Shared Input Contract

All evaluators should receive the same top-level bundle, even if some fields
matter more to one role than another:

- `task_brief`
- `acceptance_criteria`
- `relevant_artifacts`
- `execution_trace`
- `diff_or_output`
- `constraints`

## Shared Output Contract

Every evaluator should return results in this shape:

```markdown
## Evaluation

**Role:** <role-name>
**Status:** pass | concerns | fail
**Confidence:** high | medium | low

**Findings:**
- [severity] [artifact/step]: issue - why it matters

**Open Questions:**
- question if any

**Recommended Actions:**
- concrete next step

**Do Not Opine On:**
- areas outside scope
```

The `Do Not Opine On` section is required. It keeps roles from drifting into
each other's territory.

## Orchestration Model

Use a `4 + 1 + 1` structure by default.

### Stage 1: Parallel design and process review

Run these four in parallel:

- `requirements-and-scope-evaluator`
- `architecture-and-boundaries-evaluator`
- `tool-and-permission-evaluator`
- `context-and-memory-evaluator`

These roles inspect mostly independent concerns and do not require a finished
artifact.

### Stage 2: Execution review

Run:

- `execution-quality-evaluator`

Only do this once there is a plan, trace, or execution path worth judging.

### Stage 3: Final outcome review

Run:

- `outcome-and-verification-evaluator`

This should be last because it depends on the finished artifact and fresh
verification evidence.

## Aggregation Rules

The coordinating agent, not a separate meta-reviewer, should combine the
results.

- Treat `fail` as blocking unless another evaluator proves the issue is truly out of scope.
- Treat repeated `concerns` across roles as a coordination problem, not noise.
- Prefer scope-appropriate findings over reviewer confidence alone.
- Never use majority vote to overrule a well-scoped blocking issue.

## When To Expand The Stack

Do not add more evaluators until a missing angle is clearly recurring. The most
likely future additions are:

- `cost-and-latency-evaluator`
- `robustness-and-failure-mode-evaluator`

## Common Failure Modes

- letting every evaluator comment on everything
- adding too many evaluators before the default six are working well
- reviewing final output before execution or verification evidence exists
- aggregating by vote instead of by scope and severity
