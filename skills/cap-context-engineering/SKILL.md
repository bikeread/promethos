---
name: cap-context-engineering
description: Decide what the agent reads now vs retrieves later.
when_to_use: >-
  Use when the agent reads too much, misses key files, or carries context
  that grows without helping. Design eager vs deferred loading.
---

# Goal
Give the agent the minimum useful context needed to perform well without
overloading it or hiding critical information.

## Inputs
- Agent task shape
- Available sources of truth
- Context window and retrieval constraints

## Non-Goals
- Designing long-term memory policy in full
- Dumping every possibly relevant file into context

## Workflow

### Trigger signals
- Agent loads many files but still misses the relevant one
- Context window usage is high and growing
- User says "it keeps loading too much" or "why didn't it read the right file"
- System prompt is getting long without a refresh or compression strategy

### 1. Define the task loop the agent must sustain
Describe the recurring loop the agent is performing so context choices can be
judged against actual operational needs.
**Success criteria**: Context design is anchored to a concrete task loop rather
than a vague idea of "more context is better."

### 2. Identify the immediate working set
Choose the small set of facts, files, instructions, and state that must be
present at the start of the loop.
**Success criteria**: The initial context is justified, bounded, and clearly
more important than deferred material.

### 3. Separate eager, deferred, and retrieved information
Classify what should always be loaded, what can be discovered on demand, and
what should stay out of the active context entirely.
**Success criteria**: The strategy distinguishes mandatory context from optional
or expensive context.

### 4. Define source-of-truth and compression rules
State which representations are authoritative, when summaries may replace raw
material, and when the agent must re-open original sources.
**Success criteria**: Compression never silently becomes a substitute for the
real source of truth.

### 5. Define refresh and reset behavior
Specify when context should be trimmed, refreshed, re-retrieved, or rebuilt from
clean state.
**Success criteria**: The agent has a plan for long-running usefulness rather
than unchecked context accumulation.

## Output Contract
A context strategy covering:
- the operating loop,
- the initial working set,
- eager vs deferred vs retrieved information,
- source-of-truth precedence,
- compression and refresh rules.

## Escalation
Pause when:
- critical information cannot be separated from optional information,
- the design assumes the model will remember everything indefinitely,
- summaries are replacing raw sources without a re-open rule,
- retrieval latency or context budget makes the proposed strategy unrealistic.

## Common Failure Modes
- Front-loading too much context
- Treating summaries as if they were canonical truth
- Compressing away important state
- Treating retrieval as a replacement for clear boundaries
