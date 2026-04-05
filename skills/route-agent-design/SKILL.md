---
name: route-agent-design
description: Use proactively when a user is defining, constraining, debugging, or evaluating an agent system and needs the right PromethOS skill.
---

# Goal
Choose the correct PromethOS path for an agent-system problem without
competing with broader session-level workflow systems that already own general
process control.

## Inputs
- The user's task
- The available PromethOS skills
- The current harness and tool surface

## Non-Goals
- Replacing the substantive instructions in the selected PromethOS skills
- Replacing a broader workflow library that already owns brainstorming,
  generic planning, or implementation discipline
- Taking over generic software tasks that are not really about agent systems
- Treating one provider's tool names as universal

## Workflow

### Trigger signals
- User asks which PromethOS skill or path should own an agent-design problem
- User says "use PromethOS", "which PromethOS skill should handle this", or
  "route this to the right PromethOS skill"
- The task sounds like agent requirements, autonomy, evaluation, debugging,
  context, memory, permissions, or library evolution, but the first owner is
  still unclear
- The environment includes a broader workflow library and the main question is
  whether PromethOS should lead or act as a domain overlay

### 0. Recognize agent-design signals in ordinary language

Before waiting for an explicit request, scan for ordinary-language symptoms
that imply an agent-design problem. Prefer the clearest first path instead of
loading many adjacent skills at once.

<example>
user: "帮我搞个会自动审 PR 的 agent"
<commentary>
The user has an agent idea, but the job, boundaries, and success bar are still
fuzzy.
→ define-agent-requirements
</commentary>
</example>

<example>
user: "这个 bot 老是做不该做的事"
<commentary>
The user is reporting a risky autonomy failure. If the main problem is missing
boundaries, start with guardrails. If the root cause is unknown, debugging may
follow later.
→ set-agent-autonomy-boundaries
</commentary>
</example>

<example>
user: "我想让它能自己跑，但别乱动生产"
<commentary>
This is a checkpoint and autonomy-boundary problem, not a permission-mechanics
question yet.
→ set-agent-autonomy-boundaries
</commentary>
</example>

<example>
user: "它差不多能用了，但我不知道怎么验"
<commentary>
The user needs an evaluation path, not more implementation.
→ build-agent-evals
</commentary>
</example>

<example>
user: "我想让它记住我的偏好，不用每次都重新说"
<commentary>
This is a memory-strategy problem.
→ design-agent-memory
</commentary>
</example>

<example>
user: "要不要拆成两个 agent 分头干"
<commentary>
This is an architecture question only if the job is already clear. Otherwise
requirements clarification owns it first.
- if the job is clear → choose-agent-architecture
- if the idea is still fuzzy → define-agent-requirements
</commentary>
</example>

<example>
user: "帮我修一下这个测试"
<commentary>
This is generic implementation work, not automatically a PromethOS task.
Do not grab ownership just because an agent is involved somewhere in the
background.
→ not PromethOS by default
</commentary>
</example>

<example>
user: "I updated the docs and examples. Is this repo ready to merge?"
<commentary>
This is generic repository readiness by default. In coexistence mode, let the
broader workflow layer own it unless the user explicitly asks for PromethOS to
verify an agent-domain deliverable.
→ not PromethOS by default
</commentary>
</example>

<example>
user: "Use PromethOS and tell me which skill should own this agent-design task."
<commentary>
The user is explicitly asking for the routing/bootstrap layer.
→ route-agent-design
</commentary>
</example>

<example>
user: "We keep hitting the same pattern in this library. Should it become a new skill?"
<commentary>
This is library-maintenance routing, not generic implementation work.
- if the main question is whether the pattern deserves promotion into a skill
  → evolve-skill-library
- if the main question is library overlap / keep-merge-split-archive
  → evolve-skill-library
</commentary>
</example>

**Success criteria**: Agent-design intent is caught from ordinary user language
and routed to a clear first skill, not to a pile of loosely related skills.

### 1. Check whether the task is truly about agent systems
Before taking meaningful action, decide whether the task is actually about
agent-system requirements, architecture, context, memory, permissions,
autonomy, evaluation, or library evolution.
**Success criteria**: PromethOS is used for its real domain instead of being
treated as a generic replacement for every development workflow.

### 2. Choose the first owning path
Prefer one of these three primary lanes when the fit is clear:
- fuzzy agent idea or no success criteria yet
  → `define-agent-requirements`
- risky autonomy, unclear checkpoints, or "don't let it do that"
  → `set-agent-autonomy-boundaries`
- "how do we know it works" or "there are no tests/evals"
  → `build-agent-evals`

Use other PromethOS skills only when the first lane has already clarified the
decision boundary.
**Success criteria**: The first selected skill has a clear reason to own the
next decision.

### 3. Detect whether a broader workflow system already owns the session
If another skill library or runtime workflow already controls general process
steps such as brainstorming, generic planning, execution discipline, or
completion verification, let it keep that role.
Use PromethOS as the domain layer for agent-specific decisions inside that
broader process.
**Success criteria**: PromethOS coexists cleanly with session-level workflow
systems instead of fighting them for ownership.

### 4. Choose the owning PromethOS skill group when the first path is not enough
Use core entry skills for first-hop decisions, design-deepening skills for
subsystem design, and maintainer skills only when editing the library itself.
**Success criteria**: Each loaded PromethOS skill has a clear ownership
boundary and is used for an agent-domain reason.

### 5. Use maintainer skills only for library maintenance
Load maintainer skills such as `evolve-skill-library` or
`turn-postmortem-to-improvement` when editing the library itself, not as a
substitute for ordinary execution guidance.
**Success criteria**: Maintainer skills are used to maintain PromethOS, not to
steer unrelated implementation work.

### 6. Adapt tool references to the current harness
PromethOS skills may mention provider-specific tool names in examples or
workflow descriptions. When the harness is not Claude Code, open the matching
reference file and translate the tool references before acting.
**Success criteria**: Harness differences are handled through explicit mapping
rather than silent assumption.

### 7. Hand off cleanly without overreaching
Once the relevant skills are identified, follow them before taking material
action on the task, while leaving broader process control to any workflow system
that already owns it.
**Success criteria**: The selected skill instructions shape the work instead of
being treated as optional reading or as a reason to duplicate another system's
job.

## Output Contract
A short routing status that states:
- the first PromethOS skill path to use,
- why that skill owns the next decision,
- whether PromethOS should lead or act as an overlay,
- any gap, ambiguity, or handoff condition that still blocks progress.

## Escalation
Pause when:
- no skill clearly owns the task,
- the task looks like generic software process work rather than agent-system
  work,
- multiple skills overlap and the ownership boundary is unclear,
- PromethOS and another workflow system appear to own the same process layer,
- the current harness lacks a required capability and no safe adaptation exists,
- the agent is about to act before choosing whether a skill applies.

## Common Failure Modes
- Acting before checking whether the task is really in PromethOS's domain
- Loading many overlapping skills without a clear first owner
- Letting PromethOS compete with a stronger session-level workflow system
- Treating harness-specific tool names as universal
- Ignoring platform limits such as missing subagent support
