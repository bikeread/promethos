---
name: cap-memory-strategy-design
description: Define how an agent should use session, project, preference, and retrieval-backed memory without mixing their responsibilities.
when_to_use: >-
  Use when designing agent memory behavior or deciding where information should persist. Examples: "design the memory model", "what belongs in session vs project memory", "how should this agent remember preferences"
---

# Goal
Assign the right information to the right memory layer so recall is useful
without becoming stale, noisy, or risky.

## Inputs
- Types of information the agent may store
- Expected duration of usefulness
- Privacy, accuracy, and retrieval constraints

## Non-Goals
- Solving all context problems through persistence
- Keeping every observation forever

## Workflow

### 1. Classify the information by durability and ownership
Separate session state, project facts, user preferences, retrieved records, and
ephemeral observations by how long they stay useful and who owns their truth.
**Success criteria**: Each memory class has a distinct role and expected
lifespan.

### 2. Define what earns a write
Specify what kinds of information should be written into each memory layer and
what should be ignored, summarized, or left transient.
**Success criteria**: The write policy is selective and intentional rather than
"store anything that might matter."

### 3. Define read triggers and precedence
State when each memory layer should be consulted and which layer wins if stored
facts disagree.
**Success criteria**: Memory reads follow a stable precedence order instead of
unpredictable mixing.

### 4. Define freshness, expiry, and override rules
Describe how memory becomes stale, how it is refreshed, and when human
confirmation is required before acting on it.
**Success criteria**: The design explicitly handles stale or conflicting memory.

### 5. Check trust and privacy boundaries
Review whether any memory class could accumulate misleading, sensitive, or
over-personalized information.
**Success criteria**: The strategy accounts for trust and privacy risk, not just
recall utility.

## Output Contract
A memory policy describing:
- memory classes and their purpose,
- write triggers,
- read triggers and precedence,
- freshness and expiry rules,
- override and confirmation policy.

## Escalation
Pause when:
- the same information appears to belong in multiple layers,
- memory would be used as an unquestioned source of truth,
- stored information could create privacy, trust, or preference-drift issues,
- the team is trying to solve context overload by storing more instead of
  structuring better.

## Common Failure Modes
- Treating preference memory like project truth
- Using memory as a substitute for explicit inputs
- Storing volatile state as if it were durable knowledge
- Failing to account for stale memory
