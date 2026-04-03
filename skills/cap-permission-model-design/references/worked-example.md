# Worked Example

## Scenario

Translate an already chosen autonomy policy into concrete permission mechanics
for a repository-maintenance agent that can read files, edit files, run local
validation commands, and optionally access the network.

## Example Input

- chosen autonomy policy:
  - read-only work is safe by default
  - local repository writes require visible confirmation boundaries
  - external network or destructive actions require explicit approval
- available actions:
  - read files
  - edit repository files
  - run local validation scripts
  - run git commands
  - browse the web

## Example Output

```markdown
## Permission Policy

**Action classes:**
- local reads
- local repo writes
- local validation commands
- network access
- destructive git actions

**Permission classes:**
- pre-approved read-only operations
- confirm-before-write workspace operations
- confirm-before-external-side-effect operations
- deny-by-default destructive operations

**Policy-to-default mapping:**
- local reads -> allowed by default
- local validation commands -> allowed by default when they do not mutate state outside the workspace
- local repo writes -> require confirmation before execution
- network access -> require explicit approval per task or per command family
- destructive git actions -> denied by default unless the user explicitly authorizes the specific action

**Confirmation thresholds:**
- first file edit in a task requires confirmation
- grouped related edits inside the same narrow task may reuse the same approval window
- any action with blast radius beyond the workspace requires a fresh check

**Denial and ambiguity behavior:**
- if a write is denied, return a proposed patch or plan instead of improvising
- if network access is denied, continue with local analysis and report the evidence gap
- if a command fits multiple classes, pause and ask rather than guessing
```

## Why This Boundary Is Correct

The example assumes the autonomy philosophy already exists and turns it into
action classes, defaults, and denial behavior. It does not decide which actions
should be autonomous in the first place. That is why this belongs to
`cap-permission-model-design`, not `guard-safe-autonomy-guardrails`.

## Likely Next Skill

`cap-tool-contract-design` when a specific tool needs explicit side-effect and
retry semantics under this permission model.
