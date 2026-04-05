# Memory Layering And Freshness

## Why This Matters

Real systems do not fail only because they forget. They also fail because they
re-read the same memory repeatedly, trust stale summaries, or lose the
boundary between "remembered" and "source of truth."

## Stable Design Constraints

### 1. Session memory is not the same as project memory

Session memory is a compact working summary of prior turns. Project memory is a
longer-lived record tied to the repository or user environment. Treating them
as interchangeable creates stale or duplicated guidance.

### 2. Dedup memory injection at the session level

File-level caches alone are not enough in long sessions. A memory file can
leave cache and be re-read, which can cause repeated reinjection unless the
runtime also keeps a session-scoped set of already-loaded memory paths.

### 3. Wait for extraction before consuming memory summaries

If session memory extraction is in progress, read-after-write races can cause
empty or partial summaries to be treated as authoritative. A robust runtime
waits for extraction to settle or times out cleanly.

### 4. Empty templates and broken boundaries need safe fallback

If a memory file exists but contains only template content, or if the runtime
cannot map a summary boundary back onto the active message stream, fall back to
the heavier but safer recovery path instead of guessing.

### 5. Preserve unsummarized recent work explicitly

When summarizing, keep a bounded set of recent unsummarized messages and avoid
splitting dependent pairs such as request/result or tool use/result boundaries.

### 6. Memory recall should be inspectable

High-level counts are useful in the default UI, but detailed content or source
paths should still be available in verbose or transcript-oriented views so
reviewers can inspect what the system actually relied on.

## What This Means For PromethOS

- `design-agent-memory` should explicitly cover dedup, freshness, and
  fallback behavior rather than only storage categories.
- `design-agent-context` examples should assume recalled memory is a helper,
  not unquestioned truth.
- future eval fixtures should include stale-memory and duplicate-memory cases.

## Common Failure Modes

- re-injecting the same memory repeatedly in a busy session
- treating extracted session memory as canonical project truth
- reading memory before extraction completes
- keeping too much recent context and defeating the value of summarization
