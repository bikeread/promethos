# Worked Example

## Scenario

The user wants an agent to triage incident reports and draft follow-up tasks,
but the request is still a blur of useful-sounding features with no agreed
first version.

## Example Input

- agent concept: "an incident triage agent for our ops team"
- environment: ticketing system, incident report documents, internal runbooks
- constraints:
  - first release should help, not automate the whole incident process
  - avoid contacting customers or changing production state
  - on-call engineers must be able to review the output quickly

## Example Output

```markdown
## Requirements Brief

**Operator:** On-call engineer

**Beneficiary:** Incident commander and follow-up owners

**Job:** Turn a raw incident report into a triage summary plus a draft list of follow-up tasks.

**Primary artifact:** A triage brief containing incident category, severity guess, missing facts, and draft follow-up tasks for human review.

**Acceptance criteria:**
- The output highlights the likely incident type and the most important missing information.
- The output proposes follow-up tasks in a format an engineer can edit and assign.
- The agent does not change tickets, message customers, or touch production systems in `v1`.
- A human can reject or edit the output without reverse-engineering hidden reasoning.

**Operating surface:**
- Inputs: incident report text, ticket metadata, internal runbook snippets
- Outputs: triage brief and draft follow-up task list
- Tool surface: read-only access to reports, tickets, and runbooks
- Approval boundaries: no ticket edits, no external communication, no production actions

**Non-goals:**
- Full incident automation
- Root-cause analysis
- Paging engineers automatically
- Closing or editing tickets without review

**Minimum useful v1 scope:**
- classify the report into a small incident taxonomy
- extract the highest-priority facts and unknowns
- draft 3-5 follow-up tasks for human review

**Risks and open questions:**
- severity heuristics may be unreliable without better historical examples
- the right task template may differ between infrastructure and customer-facing incidents
- it is still unclear whether ticket metadata is trustworthy enough to rely on
```

## Why This Boundary Is Correct

This artifact defines the job, scope, constraints, and success bar. It does not
choose the final repository architecture and it does not break the work into
implementation tasks. That is why this belongs to
`define-agent-requirements`, not architecture design or
implementation planning.

## Likely Next Skill

`choose-agent-architecture` if the team still needs to choose between
single-agent and multi-agent execution, or `set-agent-autonomy-boundaries` if
the main next question is what the agent must never do on its own.
