# Runtime-Grounded References

These notes distill stable constraints observed in real interactive agent
systems into provider-neutral guidance for PromethOS users and maintainers.

They are not taxonomy skills. They exist to explain why certain skill
boundaries matter in practice and to provide runtime reality that examples and
evals can reuse.

## Current References

- [Context Pressure And Compaction](context-pressure-and-compaction.md)
- [Memory Layering And Freshness](memory-layering-and-freshness.md)
- [Permission Modes And Approvals](permission-modes-and-approvals.md)
- [Plan Mode And Approval Flow](plan-mode-and-approval-flow.md)

## How To Use These Notes

- Reach for these references when a skill needs runtime color, not when you need a new decision-making playbook.
- Prefer linking to them from examples, evaluator docs, or compatibility notes.
- Do not copy provider-specific internals from one runtime directly into taxonomy skill bodies unless the abstraction is already stable and public.
