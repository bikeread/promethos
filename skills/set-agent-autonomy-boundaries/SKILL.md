---
name: set-agent-autonomy-boundaries
description: Use proactively when an agent lacks checkpoint policy or risky actions need clear human-review boundaries.
---

# Goal
Define a clear autonomy policy that lets the agent move quickly on low-risk work
without silently taking high-risk actions.

## Inputs
- Agent goals
- Available tools
- Expected operating environment
- Risky or irreversible actions under consideration

## Non-Goals
- Implementing the permission runtime itself
- Designing permission-class mechanics or tool allowlists
- Designing the full tool contract for every tool

## Workflow

### Trigger signals (for proactive recognition)
- An agent has write or delete access but no checkpoint policy
- The user lists agent capabilities without mentioning limits
- The user mentions production config edits, deployment commands, external
  messages, payments, or privacy-sensitive side effects without saying what
  must stop for review
- The agent just performed a risky action the user didn't expect
- The conversation moved from "what should it do" to "how" without setting boundaries
- Not for mapping the policy into concrete permission classes or runtime enforcement

### 1. Enumerate the actions the agent can actually take
List concrete actions in operational language and group them by side-effect
shape, for example:
- read-only work
- local reversible edits
- local destructive changes
- external side effects such as messages or API calls
- privacy-sensitive actions
- financially or production-impacting actions
**Success criteria**: The action set is concrete enough that a future policy
check could map each action to a default permission.

### 2. Assign autonomy by risk tier
Mark which actions are safe by default, which require a checkpoint before side
effects, which require explicit human approval before execution, and which are
disallowed unless a separate human directive changes policy.
Keep the policy aligned with reversibility, visibility, privacy, financial
impact, and blast radius.
**Success criteria**: Every action class has a default autonomy level and the
reason for that level is visible.

### 3. Define checkpoint and confirmation rules
State when the agent must ask before acting, whether approval is needed before
planning, before execution, before external communication, or before
committing irreversible side effects.
Include special handling for destructive, financial, privacy-sensitive, or
multi-step actions that would be hard to roll back.
**Success criteria**: High-risk actions have unambiguous checkpoint rules and
there is no hidden approval gap between planning and side effects.

### 4. Define escalation and recovery behavior
List the uncertainty, ambiguity, or failure conditions that must stop
autonomy, and say what the agent should do next: pause, ask, retry, narrow the
task, or hand control back to a human.
Use clear stop conditions instead of broad warnings.
**Success criteria**: The policy tells the agent when to stop, what to ask, and
what counts as safe to continue.

## Output Contract
An autonomy policy that states:
- the concrete action classes under consideration,
- which are safe by default,
- which require checkpoints before side effects,
- which require explicit human approval,
- which are disallowed by default,
- why each action class has that default,
- what conditions force escalation or handoff.

## Escalation
Pause for human input when:
- the action is destructive, externally visible, financially meaningful, or
  privacy-sensitive,
- the policy cannot classify an action without inventing a new autonomy tier,
- two reasonable operators would choose different checkpoint behavior,
- the discussion shifts from autonomy policy into permission mechanics or tool
  contract design.

## Common Failure Modes
- Granting broad autonomy because the agent appears careful in the happy path
- Hiding risky side effects inside a routine step or a tool wrapper
- Using vague escalation language like "if unsure" without a concrete stop rule
- Failing to distinguish read-only work from state-changing work
- Smuggling permission-class mechanics into the guardrail layer
