# Worked Example

## Scenario

A maintainer reports that PromethOS is producing overlapping guidance when the
user asks about autonomy policy. The agent keeps invoking both
`guard-safe-autonomy-guardrails` and `cap-permission-model-design`, then mixes
policy philosophy with enforcement mechanics in one answer.

## Example Input

- symptom: overlapping or contradictory approval guidance
- evidence available:
  - transcript showing both skills invoked for the same decision
  - skill files for the guard and capability pair
  - bootstrap ordering guidance from `using-promethos`

## Example Output

```markdown
## Debugging Brief

**Symptom and reproduction:**
- When asked "what should this agent be allowed to do on its own?", the system loads both the guardrail skill and the permission-model skill, then returns mixed policy and enforcement advice.

**Evidence collected:**
- The request is about top-level autonomy policy, not permission mechanics.
- `guard-safe-autonomy-guardrails` owns checkpoint policy.
- `cap-permission-model-design` explicitly assumes autonomy policy is already chosen.
- The transcript shows both skills loaded before the answer was formed.

**Hypotheses:**
1. The bootstrap sequencing is too loose and allows both skills to load for the same ownership question.
2. The permission-model trigger is too broad and catches policy-design requests.
3. The real problem is in the final answer template rather than in skill selection.

**Chosen intervention:**
- Tighten the trigger examples and scope guard around `cap-permission-model-design`.
- Add a worked example showing the boundary between autonomy policy and permission mechanics.

**Observed result after intervention:**
- Policy questions route to the guard skill first; permission mechanics are only loaded when the policy is already fixed.

**Follow-through:**
- Add a reusable evaluator or regression case for overlapping-skill invocation on autonomy questions.
```

## Why This Boundary Is Correct

The artifact is a root-cause brief with competing hypotheses, a smallest
intervention, and follow-through. It does not rewrite the whole library and it
does not jump straight to new taxonomy files. That is exactly the job of
`flow-systematic-agent-debugging`.

## Likely Next Skill

`meta-skill-evolution` if the fix suggests a library-level boundary change, or
`eval-postmortem-to-skill` if the incident should become a reusable eval case.

## Scenario 2

A user says, "Debug why my agent sometimes sends duplicate customer replies
after a retry," but the active workspace is an empty temporary repo with no
source, tests, logs, or remote. The agent starts scanning unrelated local
projects for "similar retry logic."

## Example Input

- symptom: duplicate outbound reply after retry
- evidence available:
  - empty current repo
  - no target source path
  - no logs, trace, or transcript from the failing system

## Example Output

```markdown
## Debugging Brief

**Symptom and reproduction:**
- A duplicate customer reply may be emitted after a retry, but the current workspace contains no code or logs from the system that allegedly failed.

**Evidence collected:**
- The active repository is empty and has no remote or implementation files.
- There is no trace showing where the retry boundary sits.
- There is no outbound-send log, idempotency key, or transcript to inspect.

**Hypotheses:**
1. The send succeeded but the durable "already sent" record failed, so the full handler retried.
2. The retry boundary wraps both generation and send, with idempotency applied too late.

**Chosen intervention:**
- Do not search unrelated repositories as substitute evidence.
- Ask the user for the real repository, file path, log, trace, or failing transcript.
- Present the likely failure shapes explicitly as hypotheses, not as confirmed root cause.

**Observed result after intervention:**
- Debugging stays scoped to the real target system instead of drifting into generic pattern hunting.

**Follow-through:**
- Once the real evidence source is provided, trace the exact retry boundary and add a regression case for duplicate sends after partial failure.
```

## Why This Boundary Is Correct

The key issue is not that pattern recognition is forbidden. The issue is that
analogies from other repositories cannot replace direct evidence from the
system under debug. This keeps `flow-systematic-agent-debugging` anchored to
root-cause investigation instead of speculative repo-mining.
