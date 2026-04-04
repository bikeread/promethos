---
name: cap-permission-model-design
description: Map an autonomy policy to concrete permission classes.
when_to_use: >-
  Use when the autonomy policy is set and you need permission classes,
  defaults, approval modes, and denial behavior for each action.
---

# Goal
Create a permission model that makes concrete tool and action permissions
predictable, reviewable, and safe to enforce.

## Inputs
- Available tools and side effects
- Risk tolerance
- Operating environment and trust assumptions

## Non-Goals
- Implementing the permission UI or backend
- Defining the broader cross-cutting autonomy policy for the whole agent
- Replacing explicit permission mechanics with vague caution language

## Workflow

### Trigger signals
- Autonomy policy exists but tool-level permissions haven't been mapped
- User asks "哪些操作需要审批" or "what needs approval"
- Checkpoint rules exist in prose but not as enforceable defaults
- Not for deciding the overall autonomy policy — that belongs in guardrails

### 1. Inventory concrete action classes
List the reads, writes, shell commands, external calls, and irreversible side
effects the agent may perform.
**Success criteria**: The permission design is grounded in real actions rather
than vague labels like "safe" or "unsafe."

### 2. Group actions into permission classes
Organize actions by the specific enforcement mechanics they need, such as
pre-approved reads, confirm-before-write operations, or deny-by-default
external side effects.
**Success criteria**: Similar actions share permission mechanics for concrete,
explainable reasons.

### 3. Map policy tiers into enforceable defaults
Translate the chosen autonomy and checkpoint policy into concrete defaults for
each permission class.
**Success criteria**: Every important action class has an explicit default
policy that references an existing autonomy decision rather than inventing a new
one.

### 4. Define denial and ambiguity behavior
Specify what the agent should do when permission is denied, partially granted,
or unclear.
**Success criteria**: The agent does not improvise risky behavior when
constraint appears.

### 5. Check least privilege against actual usability
Tighten permissions enough to reduce risk, but not so much that ordinary work
requires constant escalation.
**Success criteria**: The model is both safer and still operable for the target
job.

## Output Contract
A permission policy with:
- action classes,
- permission classes,
- mappings from autonomy policy to permission defaults,
- explicit confirmation thresholds,
- denial and ambiguity behavior.

## Escalation
Pause when:
- one permission rule is being used for materially different action types,
- denial behavior would silently corrupt outputs or state,
- frequent escalations suggest the policy is mismatched to the job,
- destructive actions are being bundled into broad approvals,
- the discussion drifts from permission mechanics into a broader autonomy
  philosophy that belongs in guardrails.

## Common Failure Modes
- Broad approvals for convenience
- Smuggling autonomy-policy decisions into permission mechanics
- Inventing new checkpoint policy inside the permission layer
- Implicit trust in destructive commands
- Undefined behavior after denial
