---
name: flow-verification-before-completion
description: Verify with fresh evidence before claiming work is done.
when_to_use: >-
  Use PROACTIVELY when about to declare success, ship, or move on. Run
  checks first — do not wait for the user to ask for verification.
---

# Goal
Prevent false completion by tying every positive claim to fresh verification
evidence.

## Inputs
- Claimed change or fix
- Relevant requirements or acceptance criteria
- Available verification commands, tests, or manual checks

## Non-Goals
- Assuming the implementation is correct because the code looks clean
- Treating partial checks as proof of total correctness

## Workflow

### Trigger signals (for proactive recognition)
- You are about to say "done" or "complete"
- The user says "差不多了吧" or "is it ready"
- A fix was applied but not re-tested
- Acceptance criteria exist but have not been checked with fresh evidence
- Someone is about to claim completion based on inspection alone

### 1. Translate each claim into a check
List the specific requirement, fix, or success statement you are about to make
and map it to a test, command, transcript check, or manual verification step.
**Success criteria**: Every major claim has a named verification path.

### 2. Run fresh verification
Execute the relevant checks now, not from memory, old logs, or assumed behavior.
**Success criteria**: The evidence is fresh and tied directly to the current
state of the work.

### 3. Check for scope gaps and regressions
Verify not only the changed behavior but also the nearby assumptions most likely
to have been broken or left unverified.
**Success criteria**: Verification covers both the target claim and the most
probable adjacent breakage.

### 4. Report the real status, not the hopeful one
State what is verified, what remains unverified, and what the evidence actually
supports.
**Success criteria**: The final report is aligned with evidence rather than
optimism.

## Output Contract
A status report that distinguishes:
- the claims or requirements being checked,
- the commands, artifacts, or transcripts used to verify them,
- what passed,
- what remains unverified,
- what residual risk still exists.

## Escalation
Pause when:
- no trustworthy verification path exists,
- the change affects behavior that cannot yet be tested,
- important acceptance criteria remain unchecked,
- someone is about to claim completion based on inspection alone.

## Common Failure Modes
- Confusing implementation with proof
- Verifying only the happy path
- Reusing stale verification
- Hiding remaining uncertainty
