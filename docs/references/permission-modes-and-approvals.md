# Permission Modes And Approvals

## Why This Matters

Permission handling is a runtime behavior, not just a design ideal. Real
systems must combine default modes, allow/deny rules, background-agent limits,
and denial behavior without silently widening autonomy.

## Stable Design Constraints

### 1. Separate policy mode from individual rules

A runtime needs both a top-level permission mode and lower-level allow, deny,
and ask rules. Either layer alone is too blunt.

### 2. Background agents cannot assume prompting is available

Some workers cannot safely show approval dialogs. In those cases the runtime
needs explicit "avoid prompting" behavior and a denial path that does not
pretend approval happened.

### 3. Automated checks may need to run before the human prompt

If the runtime has classifiers, policy hooks, or other preflight checks, those
checks should complete before the user sees a permission dialog. Otherwise the
UI can ask for actions that would be auto-denied anyway.

### 4. Plan-mode entry can temporarily alter permission behavior

If the runtime offers a planning mode, it may need to remember the prior
permission mode, tighten behavior during planning, and restore the previous
mode once plan restrictions are lifted.

### 5. Denials must accumulate for non-interactive workers

Async or background workers may need local denial tracking so repeated blocked
actions do not loop forever under the false assumption that a prompt will
eventually appear.

### 6. User-visible settings matter

Modes such as auto-compact and default permission mode should be visible,
changeable, and auditable through normal settings, not hidden behind internal
flags only.

## What This Means For PromethOS

- `guard-safe-autonomy-guardrails` should own which actions need approval.
- `cap-permission-model-design` should own how modes, classes, defaults, and
  denial behavior are implemented.
- worked examples and evaluator docs should check that these two layers stay
  separate.

## Common Failure Modes

- using one broad mode to cover materially different action classes
- assuming all workers can prompt the user
- running approval UI before automated safety checks settle
- losing the previous permission state across plan-mode transitions
