# Compatibility

## PromethOS By Itself

When PromethOS is the only skill library in play, it can operate as a complete
agent-system methodology stack:

- `using-promethos` bootstraps the library
- `flow-*` skills drive agent-domain flow
- `cap-*`, `guard-*`, and `eval-*` skills provide the deeper decision logic

## PromethOS Alongside Broader Workflow Libraries

When PromethOS is installed with a broader session-level workflow system such
as superpowers, use this split:

- Let the broader workflow system own generic process control.
- Let PromethOS own agent-system methodology decisions.

In practice, that means the broader workflow system usually keeps:

- session bootstrap
- generic brainstorming or feature-discovery flow
- generic implementation execution flow
- general debugging discipline
- general completion-verification discipline

PromethOS should take the lead for:

- agent requirements
- agent architecture
- context design
- memory strategy
- permission mechanics
- autonomy policy
- tool contract design
- evaluator design
- postmortem-to-improvement loops
- skills-library evolution

## Why This Split Works

PromethOS is strongest where the question is about how an agent system should
be shaped, governed, evaluated, or evolved.

Broader workflow libraries are usually stronger where the question is how to
run the current software-development session with strict process discipline.

Trying to let both systems own the same process layer creates duplicated
bootstrap rules, duplicated debugging steps, and conflicting planning flows.

## Practical Triggering Guidance

If both libraries are installed:

- Use explicit prompts such as `use PromethOS`, `design the context strategy`,
  `set the autonomy policy`, or `evaluate this agent workflow` when you want
  PromethOS to lead.
- Let the broader workflow system continue to own generic tasks unless the work
  is clearly about agent-system design or evaluation.

## Common Collision Points

The most likely overlap areas are:

- bootstrap entry rules
- planning flow
- debugging flow
- verification-before-completion

If two systems appear to own the same process layer, prefer the broader
workflow system for generic execution and keep PromethOS focused on the
agent-domain decision points.
