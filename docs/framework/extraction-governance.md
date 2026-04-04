# Extraction Governance

## Purpose

Use this document when mining patterns from Claude Code or any other upstream
agent system.

Its job is to keep PromethOS portable, small, and decision-oriented while still
benefiting from runtime-grounded evidence.

## Placement Rules

| If the source material is mainly... | Land it as... | Why |
|---|---|---|
| a repeated, stable design decision | `skill` | Skills should answer reusable questions another agent can act on |
| a runtime constraint, compatibility note, or implementation detail | `reference` | References explain reality without bloating taxonomy |
| a proof obligation, regression check, or scoring scenario | `eval` | Evals prove behavior instead of instructing it |
| a one-off mechanism or product-specific implementation | keep it out of taxonomy | Not every useful observation deserves a public abstraction |

## Tests For Promoting Something To A Skill

Promote only when most of these are true:

- the pattern recurs across multiple tasks or incidents
- the question it answers is clear in one sentence
- the answer produces an inspectable artifact or decision
- the pattern still makes sense outside Claude Code's exact naming
- the same boundary would matter in another capable agent runtime

If those conditions do not hold, default to `reference` or `eval`.

## Tests For Keeping Runtime Detail Out Of Skills

Move detail out of a taxonomy skill when it depends on:

- exact mode names or flags
- exact tool names or command syntax
- rollout gates or internal experiments
- product UI, transport, mailbox, or bridge behavior
- provider-specific auth or infrastructure

If the detail is still important, preserve it in a linked `reference`.

## Recommended Extraction Workflow

1. Start from the source signal.
   Example: permission modes, plan phases, memory freshness, coordinator-worker
   behavior.
2. State the generalized problem in neutral language.
   Example: "how should approval policy differ from enforcement mechanics."
3. Choose the landing zone.
   `skill`, `reference`, `eval`, or no public abstraction.
4. Write the public form in provider-neutral language.
5. Keep the source-specific proof in references, examples, or evaluator docs.
6. Add or update an eval when the boundary is risky or easy to drift.

## Default Posture

- Generalize the decision, not the product wording.
- Preserve lineage, but do not let lineage dictate the public interface.
- Prefer one stable skill plus a good reference over a skill body that tries to
  teach the full runtime.
- Add new taxonomy only after examples, evals, and references fail to cover the
  gap cleanly.

## Common Extraction Mistakes

- copying Claude Code terminology straight into a public skill
- promoting a runtime quirk into a universal design law
- creating a skill before proving the decision point really recurs
- hiding guardrail logic inside a generic skill because the runtime happened to
  bundle them together
- writing an eval when the real missing piece is a design playbook
- writing a skill when the real missing piece is only a runtime note
