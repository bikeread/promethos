---
name: using-promethos
description: Load and apply the PromethOS skills library for agent-system design, governance, evaluation, and evolution work across domains.
when_to_use: >-
  Use when the task is explicitly about PromethOS, or when the work is about designing, governing, evaluating, or evolving an agent system across any domain. Examples: "use PromethOS", "what skill applies to this agent architecture", "design the context strategy for this agent", "set the autonomy policy for this agent", or "evaluate this agent workflow". If another skill library already owns session-wide process control, let it keep that role and use PromethOS as the agent-domain methodology layer.
---

# Goal
Apply PromethOS where it adds agent-system design value, without competing with
broader session-level workflow systems that may already own general process
control.

## Inputs
- The user's task
- The available PromethOS skills
- The current harness and tool surface

## Non-Goals
- Replacing the substantive instructions in the selected PromethOS skills
- Replacing a broader session-level workflow library that already owns general
  process control
- Treating one provider's tool names as universal

## Workflow

### 1. Check whether the task is truly about agent systems
Before taking meaningful action, decide whether the task is actually about
agent-system requirements, architecture, context, memory, permissions,
autonomy, evaluation, or library evolution.
**Success criteria**: PromethOS is used for its real domain instead of being
treated as a generic replacement for every development workflow.

### 2. Detect whether a broader workflow system already owns the session
If another skill library or runtime workflow already controls general process
steps such as brainstorming, generic planning, execution discipline, or
completion verification, let it keep that role.
Use PromethOS as the domain layer for agent-specific decisions inside that
broader process.
**Success criteria**: PromethOS coexists cleanly with session-level workflow
systems instead of fighting them for ownership.

### 3. Choose the owning PromethOS skill group
Use `flow-*` skills for agent-domain sequencing, `cap-*` skills for focused
agent-subsystem design, `guard-*` skills for risk and boundary control,
`eval-*` skills for measurement and learning loops, and `meta-*` skills for
maintaining the library itself.
**Success criteria**: Each loaded PromethOS skill has a clear ownership
boundary and is used for an agent-domain reason.

### 4. Use meta skills only for library maintenance
Load `meta-*` skills when editing the library itself, not as a substitute for
ordinary execution guidance.
**Success criteria**: Meta skills are used to maintain PromethOS, not to steer
unrelated implementation work.

### 5. Adapt tool references to the current harness
PromethOS skills may mention provider-specific tool names in examples or
workflow descriptions. When the harness is not Claude Code, open the matching
reference file and translate the tool references before acting.
**Success criteria**: Harness differences are handled through explicit mapping
rather than silent assumption.

### 6. Follow the selected PromethOS skills without overreaching
Once the relevant skills are identified, follow them before taking material
action on the task, while leaving broader process control to any workflow system
that already owns it.
**Success criteria**: The selected skill instructions shape the work instead of
being treated as optional reading or as a reason to duplicate another system's
job.

## Output Contract
A short status statement covering:
- which PromethOS skills apply,
- whether PromethOS is the primary workflow layer or an agent-domain overlay,
- the order they should be used,
- any harness-specific tool mapping required,
- any limits or gaps that remain.

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
- Loading many overlapping skills without a clear owner
- Letting PromethOS compete with a stronger session-level workflow system
- Treating harness-specific tool names as universal
- Ignoring platform limits such as missing subagent support
