# PromethOS Roadmap

## Current Position

PromethOS `0.1.x` already has a usable methodology core:

- 17 reusable skills that are being reorganized into core entry, design
  deepening, and maintainer layers
- 1 routing/bootstrap path for cross-platform loading
- platform install docs and basic repository validation
- an initial evaluator stack under `docs/evaluators/`
- first worked examples for five core skills
- first runtime-grounded references for context, memory, permissions, and plan flow
- first maintainer-facing abstraction docs under `docs/framework/`
- an initial eval pack under `docs/evals/`

What it does not yet have is enough reusable evidence to prove large, repeatable
impact. The next phase should focus less on adding new skills and more on
locking task-first public names, examples, evals, and runtime-grounded
references.

## Priority Workstreams

### P0: Freeze Task-First Public Names

Before further expansion, PromethOS should finish its public library reshape:

- replace taxonomy-first public skill ids with task-first names
- keep the library flat on disk but grouped into core entry, design deepening,
  and maintainer layers in docs and routing
- update bootstrap, examples, evals, and framework docs to the new vocabulary
- prove that the renamed entry skills are easier to trigger from ordinary
  language

### P1: Run And Iterate On The Eval Pack

PromethOS now has an initial evaluation pack. The next step is to run it
against real sessions and tighten it with evidence:

- capture pass, concerns, and fail results for the current scenario set
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

See [framework/extraction-governance.md](framework/extraction-governance.md)
for the maintainer-facing version of these placement rules.

## Exit Criteria For The Next Release

PromethOS should treat the next release as successful when:

- the public library shape is task-first and role boundaries hold up under real use
- core skills have worked examples and at least one more example batch lands for adjacent skills
- at least one reusable eval pack exists
- runtime references cover context, memory, permissions, and plan flow with at least one revision cycle from real usage
- claims about usefulness are backed by examples or evaluation results rather than intuition alone
