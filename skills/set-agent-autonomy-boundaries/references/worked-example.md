# Worked Example

## Scenario

Design an autonomy policy for an agent that can edit configuration files, run
deployment commands, browse the web, and message external services.

## Example Input

- agent job: prepare deployment changes and help operators carry them out safely
- available actions:
  - read repository files and deployment docs
  - edit local config files
  - run validation commands
  - run deployment commands
  - send messages to external services
- operator concern: "let it move fast locally, but do not let it surprise us in production"

## Example Output

```markdown
## Autonomy Policy

**Action classes:**
- read-only analysis
- local reversible edits
- local destructive changes
- external side effects
- production-impacting actions

**Default autonomy:**
- read-only analysis -> safe by default
- local reversible edits -> safe after the task scope is visible
- local destructive changes -> checkpoint before execution
- external side effects -> explicit human approval
- production-impacting actions -> explicit human approval every time

**Checkpoint rules:**
- ask before deleting or overwriting config files
- ask before sending messages outside the workspace
- ask before any command that can change deployed state

**Escalation and recovery:**
- if the command's blast radius is unclear, pause and ask
- if validation and deployment steps disagree, stop and hand control back
- if approval is denied, return a patch or runbook instead of improvising
```

## Why This Boundary Is Correct

This artifact decides what the agent may do alone, what requires a checkpoint,
and what is never default-safe. It does not yet map those choices into tool
permissions or command classes. That later step belongs to
`design-agent-permissions`.

## Likely Next Skill

`design-agent-permissions` if the operator now wants these guardrails
translated into explicit permission defaults.
