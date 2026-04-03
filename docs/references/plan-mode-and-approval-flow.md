# Plan Mode And Approval Flow

## Why This Matters

Planning mode is only useful when it creates a real boundary between exploration
and implementation. In practice, that means clear entry conditions, explicit
promises, serialized artifacts, and a visible approval result.

## Stable Design Constraints

### 1. Plan mode needs explicit entry

The runtime should tell the operator what plan mode is for: explore the code,
find patterns, design an implementation approach, and present a plan for
approval.

### 2. The no-edits promise must be visible

If plan mode is supposed to avoid code changes before approval, the runtime
should say that directly when requesting entry, not assume users already know.

### 3. The operator needs a real choice

Entering plan mode should not be the only path. The user should be able to
decline and go straight into implementation when appropriate.

### 4. Approval requests need durable artifacts

A plan approval request should include the plan content and a stable plan-file
reference so the user or another agent can inspect the same artifact later.

### 5. Approval responses must change runtime state

Once approved, the runtime should make it clear that implementation may now
proceed and that plan-mode restrictions are lifted. Rejection should carry
revision feedback instead of disappearing silently.

### 6. Planning is a workflow boundary, not just a UI banner

Planning mode should shape permission behavior, approval flow, and artifact
storage. If it does not affect those things, it is just a label.

## What This Means For PromethOS

- `flow-agent-implementation-planning` should assume plan artifacts may need
  explicit approval in some runtimes.
- evaluator docs should treat missing approval evidence as a meaningful outcome
  issue, not a cosmetic gap.
- future compatibility notes can reference this document instead of burying
  plan-flow assumptions inside taxonomy skills.

## Common Failure Modes

- calling something "plan mode" without changing execution behavior
- entering planning implicitly with no visible contract
- failing to persist the plan as an inspectable artifact
- treating approval as a vague conversational acknowledgment instead of a
  state change
