# Context-Pressure Task

## Purpose

Check whether PromethOS designs a realistic context and memory strategy for a
long-running task instead of defaulting to "load everything" or "store
everything."

## Prompt

```text
Design the context and memory strategy for a long-running repo-maintenance agent that reads many docs, issue threads, and upstream runtime notes while editing PromethOS.
```

## Primary Behaviors Under Test

- defining the operating loop
- keeping the initial working set small and justified
- separating eager, deferred, and retrieved information
- handling memory freshness, dedup, and compaction-aware fallback rules

## Recommended Skill Path

- `using-promethos`
- `cap-context-engineering`
- `cap-memory-strategy-design`
- optional use of runtime-grounded references from `docs/references/`

## Required Signals

- the run defines a concrete task loop rather than a general aspiration
- the run names source-of-truth precedence
- the run includes refresh, reset, or re-open rules
- the run treats session memory or summaries as helpers, not unquestioned truth

## Failure Signals

- front-loads most of the repository or upstream workspace into context
- uses memory as canonical truth with no freshness logic
- skips compaction or retrieval tradeoffs entirely
- gives retrieval as a magic answer with no latency or re-open rule

## Inspect These Artifacts

- context strategy artifact
- memory policy artifact, if produced
- any cited reference docs on compaction or memory freshness

## Variance Notes

The run may stop after context strategy if memory design is clearly deferred.
That is acceptable only when the boundary is made explicit.
