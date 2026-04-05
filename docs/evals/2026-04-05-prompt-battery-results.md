# Prompt Battery Results - 2026-04-05

## Scope

This note records a first fresh-session prompt battery after the task-first
skill rename. The runs used `codex exec --ephemeral` against the current
workspace with PromethOS available through `~/.agents/skills/promethos`.

The local environment also had `superpowers` installed, so these results show
how the renamed PromethOS skills behave in coexistence mode rather than in a
PromethOS-only environment.

## Run 1: Requirements Entry

### Prompt

```text
I want an agent that helps my team triage incident reports and draft follow-up tasks, but I'm not sure what the first version should actually do.
```

### Observed Path

- `brainstorming` handled the session workflow layer
- `route-agent-design` was loaded as the PromethOS bootstrap
- `define-agent-requirements` was selected as the first PromethOS path

### Evidence

- The run explicitly said it had routed the task to `define-agent-requirements`
- It then asked a narrow first question about the operator of `v1`
- The first-response framing narrowed scope instead of jumping to architecture

### Assessment

- `concerns`

### Notes

The renamed PromethOS entry path was discoverable and sensible. The main issue
is not misrouting inside PromethOS; it is that the stronger session workflow
library still owns the outer conversation flow in this environment.

## Run 2: Autonomy Boundaries

### Prompt

```text
Design safety boundaries for an agent that can edit production config, run deployment commands, browse the web, and message external services.
```

### Observed Path

- The run treated this as an agent-design task
- `set-agent-autonomy-boundaries` was treated as the first problem
- `design-agent-permissions` was treated as second-layer follow-through

### Evidence

- Final message:
  - "I’ve routed this as an autonomy-boundary problem first and a permission-mechanics problem second."
- The first clarifying question asked whether the agent is interactive,
  background, or mixed
- That clarifying question was directly relevant to checkpoint policy

### Assessment

- `pass`

### Notes

This run showed the renamed pair clearly enough that the model preserved the
policy-vs-mechanics boundary.

## Run 3: Eval Pack

### Prompt

```text
We built an agent that drafts refund decisions and can message customers. We do not have tests yet. Build the smallest eval pack that would catch unsafe or misleading behavior.
```

### Observed Path

- `build-agent-evals` was selected as the PromethOS domain skill
- `brainstorming` still wrapped the outer session flow

### Evidence

- The run explicitly said it was using `build-agent-evals`
- It loaded the existing eval docs and worked example before proposing structure
- The first clarifying question focused on the agent's authority boundary:
  - `draft-only`
  - `send-capable`
  - `fully-autonomous`

### Assessment

- `concerns`

### Notes

The renamed eval skill is easier to understand and was selected correctly.
Again, the concern is coexistence with the outer workflow layer, not confusion
about the PromethOS skill itself.

## Run 4: Readiness Verification

### Prompt

```text
I updated the evaluator docs and worked examples. Please confirm the repository is ready to merge.
```

### Observed Path

- The run chose `using-superpowers`
- Then it chose `requesting-code-review`
- Then it chose `verification-before-completion`

### Evidence

- It explicitly announced:
  - `using-superpowers`
  - `requesting-code-review`
  - `verification-before-completion`
- It inspected the staged diff and validator outputs instead of selecting the
  PromethOS readiness skill first

### Assessment

- `fail` for isolated PromethOS triggerability
- `expected` in coexistence mode

### Notes

This does not prove the rename failed. It shows that in the current local
environment, `superpowers` still owns merge-readiness and completion
verification as a stronger session workflow system.

## Summary

- `define-agent-requirements`: triggered correctly
- `set-agent-autonomy-boundaries`: triggered correctly
- `build-agent-evals`: triggered correctly
- `verify-agent-readiness`: did not win against `superpowers` in coexistence mode

## Current Read

The task-first rename improved first-hop triggerability for the most important
PromethOS entry skills.

The main remaining evaluation gap is not naming inside PromethOS. It is test
environment purity:

- In a coexistence environment, `superpowers` still captures session-level
  planning and completion verification.
- To measure pure PromethOS triggerability, the next battery should run in an
  environment where PromethOS is the only installed skill library.
