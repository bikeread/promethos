---
name: meta-skill-authoring
description: Create or revise a skill in this agent-development library with clear scope, triggers, and structure.
when_to_use: >-
  Use when the right remediation layer is already known to be a skill and you need to create, rename, or tighten it. Examples: "draft the skill for this repeated decision", "refactor this skill boundary", "turn this already-approved pattern into a skill". Not for first deciding whether an incident should become a guardrail, eval, rule, or skill.
---

# Goal
Produce a skill draft whose purpose, trigger conditions, and boundaries are
clear enough to be useful without overlapping the rest of the library.

## Inputs
- Repeated workflow or failure pattern
- Existing related skills
- Concrete examples of when the skill should trigger

## Non-Goals
- Implementing the underlying runtime for skill execution
- Writing a large reference library before the core workflow is stable

## Workflow

### 1. Prove the behavior is reusable
Check whether the pattern is recurring, expensive to get wrong, and stable
enough that another agent would benefit from a named playbook.
Look for repeated corrections, repeated planning friction, or a decision point
that keeps reappearing across tasks.
**Success criteria**: There is evidence that the pattern is not a one-off and
that a skill would reduce repeated reasoning cost.

### 2. Draw the ownership boundary
State exactly what the skill owns, what it must leave to neighboring skills,
and what should stay as a rule or reference instead of becoming a skill.
Use a single decision point, not a bundle of loosely related advice.
**Success criteria**: The skill can be described in one sentence that does not
overlap the trigger or purpose of adjacent skills.

### 3. Check whether guardrail logic belongs elsewhere
Review whether any risky behavior, checkpoint policy, escalation rule, or
approval logic should live in a dedicated guard skill instead of being buried in
the draft.
**Success criteria**: The draft does not quietly absorb cross-cutting guardrail
logic that belongs in the guard layer.

### 4. Write a trigger that an agent can actually use
Draft `when_to_use` language from concrete asks, symptoms, and failure
patterns rather than abstract theory or tool names.
Include the examples that would most likely cause a real agent to invoke the
skill.
**Success criteria**: Another agent can tell when to use the skill without
guessing whether the request is "close enough."

### 5. Draft the operational steps and output contract
Write the workflow in the order a user would expect to follow it, and make each
step produce a visible artifact or decision.
Keep the sections required by the library and keep the draft small enough that
the main decision logic is still obvious.
**Success criteria**: The file can be executed as a playbook and the output
contract names a concrete result.

### 6. Check for library fit and maintenance risk
Review the draft against current skill names, likely overlaps, and future
maintenance cost.
If the draft introduces a new kind of decision area, make sure it is worth its
own file.
**Success criteria**: The skill fits the library structure, does not duplicate
nearby skills, and can be maintained without expanding into a reference manual.

## Output Contract
A skill draft with:
- frontmatter,
- a narrow purpose,
- a concrete trigger,
- a step-by-step workflow,
- explicit boundaries against nearby skills,
- an explicit check that guardrail logic has not been buried in the wrong layer.

## Escalation
Pause when:
- the pattern still looks one-off,
- the proposed skill overlaps multiple existing skills,
- the trigger language cannot be made concrete,
- the real decision point depends on an unresolved architecture choice,
- the draft appears to be carrying guardrail logic that should become or update
  a guard skill instead.

## Common Failure Modes
- Creating a skill for a single anecdote
- Naming the skill after a tool, format, or team convention instead of the
  decision it helps make
- Writing a trigger that is too vague to reuse
- Letting the draft drift into reference material instead of a working playbook
