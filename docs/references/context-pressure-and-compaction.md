# Context Pressure And Compaction

## Why This Matters

Context pressure is not just a token-count problem. In real systems, compaction
changes caches, attachment state, prompt budgeting, and even which recovery
paths are safe to use next.

## Stable Design Constraints

### 1. Compaction is a state transition, not just a summary step

After compaction, caches and tracking derived from pre-compact state may no
longer be valid. A robust runtime should reset invalidated compact-related
state, but it should not blindly wipe everything.

### 2. Some state must survive compaction

Used-skill state and similar "already invoked" signals often need to survive
across multiple compactions so the system does not re-inject expensive context
or lose track of what the model already used.

### 3. Do not let compaction fight other context-management systems

If the runtime already has another active context-management mechanism, such as
context collapse or a reactive-only fallback path, autocompact should not race
it. One system must be primary and the others should degrade into backup roles.

### 4. Guard against recursion and retry storms

Compaction-triggered agents should not re-trigger the same compaction path.
Autocompact also needs a circuit breaker so irrecoverable prompt-overflow
sessions do not hammer the runtime with repeated failures.

### 5. Prefer a cheap summary source before paying for full compaction

If session memory or another already-extracted summary exists and is fresh
enough, try that first. Fall back to a heavier compaction path only when the
cheap path cannot prove it leaves enough headroom.

### 6. Truncation must preserve a way back to the full source

If session memory or a summary must be truncated to fit budget, the system
should keep a pointer to the full transcript or memory source rather than
pretending the truncated version is complete.

### 7. Keep visible recovery options for the operator

When context limit is actually reached, the runtime should surface a concrete
next step such as manual compact or clear, not a generic failure message.

## What This Means For PromethOS

- `design-agent-context` should assume compaction changes what remains safe
  to trust in active context.
- `design-agent-memory` should distinguish extracted session memory from
  canonical source material.
- evaluator docs and future eval fixtures should include at least one
  context-pressure case and one compaction-recovery case.

## Common Failure Modes

- treating compaction as summary-only and forgetting cache invalidation
- clearing useful surviving state along with invalid state
- letting autocompact recurse through helper agents
- hiding truncation and making users believe the summary is complete
