# PromethOS Roadmap

## Current Position

PromethOS `0.1.x` already has a usable methodology core:

- 16 taxonomy skills with clear boundaries
- 1 bootstrap skill for cross-platform loading
- platform install docs and basic repository validation
- an initial evaluator stack under `docs/evaluators/`
- first worked examples for five core skills
- first runtime-grounded references for context, memory, permissions, and plan flow
- an initial eval pack under `docs/evals/`

What it does not yet have is enough reusable evidence to prove large, repeatable
impact. The next phase should focus less on adding new taxonomy files and more
on adding evaluation, examples, and runtime-grounded references.

## Priority Workstreams

### P1: Run And Iterate On The Eval Pack

PromethOS now has an initial evaluation pack. The next step is to run it
against real sessions and tighten it with evidence:

- capture pass, concerns, and fail results for the five current scenarios
- tighten cases that are too vague or too easy to game
- promote repeated failures into stronger eval fixtures or adjacent examples
- add one more regression-oriented scenario only after a real gap appears

### P2: Expand Lifecycle References

Later work can cover:

- subagent lifecycle and merge hygiene
- worktree/session isolation patterns
- packaging and platform smoke-test automation

These matter, but they are less urgent than evals and examples.

## Extraction Rules

When mining patterns from the upstream source workspace:

- Promote to a `skill` only when the pattern is a repeated, stable decision point.
- Prefer a `reference` when the material is a runtime constraint, compatibility note, or implementation detail.
- Prefer an `eval` when the main value is proving behavior rather than instructing it.
- Keep provider-specific runtime internals out of taxonomy skill bodies unless no public abstraction exists.

## Exit Criteria For The Next Release

PromethOS should treat the next release as successful when:

- the evaluator stack is published and role boundaries hold up under real use
- core skills have worked examples and at least one more example batch lands for adjacent skills
- at least one reusable eval pack exists
- runtime references cover context, memory, permissions, and plan flow with at least one revision cycle from real usage
- claims about usefulness are backed by examples or evaluation results rather than intuition alone
