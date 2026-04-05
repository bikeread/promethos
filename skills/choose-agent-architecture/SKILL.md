---
name: choose-agent-architecture
description: Use when an agent's job is clear and you need to choose structure, boundaries, or single-agent vs multi-agent.
---

# Goal
Choose a clear agent architecture that fits the requirements without adding
unnecessary complexity.

## Inputs
- Approved requirements brief
- Available tools and runtime constraints
- Existing implementation, if any

## Non-Goals
- Producing a full implementation plan
- Defaulting to multi-agent patterns for status or novelty

## Workflow

### Trigger signals
- Requirements are pinned down but no architecture exists yet
- User asks "要几个 agent" or "should this be one agent or many"
- Tools and memory needs are listed but not assigned to components
- An existing agent is being refactored because its boundaries are wrong

### 1. Restate the architectural pressure
Summarize the requirement forces that actually matter: tool use, planning
complexity, long-running work, memory needs, approval boundaries, or delegation.
If the job, beneficiary, or success bar is still unclear, stop and send the
work back to `define-agent-requirements` instead of smuggling requirement work
into the architecture step.
**Success criteria**: The architecture discussion is anchored in explicit design
pressure instead of generic agent buzzwords.

### 2. Map the smallest viable responsibility slices
Identify the minimum set of responsibilities the system must carry well, such as
planning, execution, memory access, verification, or orchestration.
**Success criteria**: The problem is decomposed into a small number of
non-overlapping responsibilities.

### 3. Compare 2-3 viable shapes
Evaluate candidate shapes such as a single tool-using agent, a layered agent
with helper modules, or a delegated multi-agent design. Reject options that add
complexity without solving a real pressure.
**Success criteria**: There is a recommended shape and explicit reasons the
alternatives were not selected.

### 4. Define boundaries and interfaces
Describe the major components, what each component owns, and what information or
artifacts move across boundaries.
**Success criteria**: A future implementation plan can name concrete files or
modules without inventing new responsibilities.

### 5. Record failure-prone seams and migration risks
Call out the edges most likely to cause confusion later, such as overlapping
memory ownership, unclear tool boundaries, or premature delegation.
**Success criteria**: The architecture includes known risk seams, not just the
happy path structure.

## Output Contract
A recommended architecture with:
- the chosen top-level system shape,
- explicit responsibility boundaries,
- interface expectations between major components,
- reasons simpler or more complex alternatives were rejected,
- the main design risks to watch during implementation.

## Escalation
Pause when:
- the requirements still contain multiple unrelated systems,
- the architecture depends on future scale or features that do not exist yet,
- component boundaries cannot be explained without circular ownership,
- the only reason to choose multi-agent is "it feels more powerful."

## Common Failure Modes
- Over-designing before proving the simpler shape fails
- Choosing architecture by trend instead of pressure
- Hiding unresolved requirements inside the architecture
- Giving components overlapping responsibilities
