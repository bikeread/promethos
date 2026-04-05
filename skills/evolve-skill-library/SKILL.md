---
name: evolve-skill-library
description: Use when the skill library feels crowded, redundant, stale, or mis-scoped and needs pruning or reshaping.
---

# Goal
Keep the skill library coherent by merging overlaps, retiring stale material,
and promoting only the patterns that earn long-term reuse.

## Inputs
- Current skill inventory
- Usage history or anecdotal friction
- Repeated failures, corrections, or missing patterns

## Non-Goals
- Rewriting the entire library from scratch without evidence
- Expanding scope just to make the library feel more complete

## Workflow

### Trigger signals
- Two skills seem to overlap in scope
- A skill has not been triggered in a long time
- Users complain the library is confusing or hard to navigate
- Skill count is growing without clear value

### 1. Inventory the library by behavior, not by file count
List each skill's purpose, trigger, current usefulness, and nearest neighbors.
Note which skills have strong evidence of repeated use and which only look
important in theory.
**Success criteria**: The library is mapped as a set of decision points, not a
flat list of filenames.

### 2. Detect overlap, gaps, and drift
Compare neighboring skills to find duplicate triggers, missing coverage, stale
assumptions, and places where a skill has started to sprawl beyond its
original decision area.
**Success criteria**: Each suspicious area is labeled as overlap, gap, or
drift, so the next action is obvious.

### 3. Check for buried or drifting guardrails
Review whether risky behavior, approval logic, or escalation rules have drifted
out of the guard layer and into general-purpose skills.
**Success criteria**: Cross-cutting guardrail logic is either kept visible in
the guard layer or intentionally referenced there.

### 4. Decide keep, merge, split, archive, or promote
Apply one explicit rule set to each candidate change: preserve a skill that is
still distinct and useful, merge only when two skills answer the same decision,
split only when one skill contains multiple decision points, archive when the
pattern is no longer in use, and promote when a repeated rule has earned a
skill.
**Success criteria**: Every decision has a rationale tied to usage evidence or
library clarity.

### 5. Re-stabilize the library shape
Update the roadmap so the next round of work preserves the library's size,
coverage, and trigger clarity.
Document what should remain as a skill, what should move back to a rule, and
what should wait for a later version.
**Success criteria**: The resulting roadmap makes the library smaller, clearer,
or more coherent rather than just more extensive.

## Output Contract
A reviewed library inventory with explicit keep, merge, split, archive, and
promote decisions, plus a short roadmap for the next version.

## Escalation
Pause when usage evidence is too thin, when a merge would blur distinct
decision points, when a split would create tiny fragments with no real reuse,
or when the library change would depend on future patterns that have not yet
appeared.

## Common Failure Modes
- Keeping every skill because none of them feel obviously wrong
- Merging skills that solve different decisions just to reduce file count
- Splitting a stable skill into smaller pieces that nobody will trigger
- Promoting a rule into a skill without repeated evidence of reuse
