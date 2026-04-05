---
name: define-agent-requirements
description: Turn a vague agent idea into a concrete requirements brief.
when_to_use: >-
  Use when the user says things like "I want a bot/assistant/agent that..." but
  the first version, success bar, operating boundaries, or even "what should
  v1 actually do" are still fuzzy.
---

# Goal
Turn an agent idea into a clear working brief that can support architecture and
implementation planning.

## Inputs
- User request or agent concept
- Available environment and tools
- Constraints, risks, and success expectations

## Non-Goals
- Choosing the final architecture
- Writing detailed implementation tasks

## Workflow

### Trigger signals
- User describes an agent idea without clear boundaries or success criteria
- User says "帮我搞个 bot", "想做个 agent", or "I want an assistant that..."
- User says "I'm not sure what the first version should do" or "what should v1 be"
- Features are listed without stating who the user is or what success looks like
- Someone skips straight to architecture, permissions, or implementation before the goal is pinned down

### 1. Identify the operator, beneficiary, and repeated job
State who is asking for the agent, who benefits from its work, and what job the
agent is supposed to complete repeatedly.
**Success criteria**: The agent's role is described as a concrete job, not a
theme like "be helpful with coding."

### 2. Define the primary outcome and artifact
Decide what the agent should produce when it succeeds: a plan, code change,
report, recommendation, triage result, or some other concrete artifact.
**Success criteria**: The successful output is explicit enough that someone can
tell whether the agent delivered the right thing.

### 3. Define the acceptance criteria
State how success will be judged in operational terms: what must be true, what
quality bar must be met, and what evidence would prove the agent is doing the
right job well enough.
**Success criteria**: The brief contains explicit acceptance criteria that later
architecture, planning, and verification work can inherit directly.

### 4. Bound the operating surface
List the agent's expected inputs, outputs, tool access, context sources,
approval boundaries, and clearly out-of-scope behaviors.
**Success criteria**: The agent's allowed working surface and forbidden actions
are both visible.

### 5. Separate must-haves from nice-to-haves
Identify the minimum useful behavior for the first version and defer optional
features, polish, and adjacent workflows.
**Success criteria**: The first version has a small core scope with explicit
deferrals.

### 6. Capture assumptions, risks, and open questions
Record what is still uncertain, what could fail later design work, and what
needs human clarification before architecture can proceed safely.
**Success criteria**: Hidden assumptions and planning risks are listed rather
than buried in the brief.

## Output Contract
A requirements brief containing:
- operator and beneficiary,
- the repeated job to be done,
- the primary output artifact,
- explicit acceptance criteria,
- the bounded tool and context surface,
- explicit non-goals,
- the minimum useful `v1` scope,
- open risks, assumptions, and questions.

## Escalation
Pause when any of these conditions hold:
- the intended user or operator is unclear,
- success is defined in subjective language only,
- the requested agent mixes multiple independent jobs,
- the tool surface implies risky actions without approval policy,
- stakeholders disagree on what the first version must include.

## Common Failure Modes
- Treating vibes as requirements
- Describing the agent by personality instead of job
- Leaving success criteria implicit
- Leaving tool access implicit
- Jumping into architecture before the brief is stable
- Smuggling future roadmap items into `v1`
- Mixing multiple agent ideas into one fuzzy brief
