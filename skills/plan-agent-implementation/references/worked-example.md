# Worked Example

## Scenario

The evaluator-stack design is approved and needs to be turned into concrete
repository work under `docs/evaluators/`.

## Example Input

- approved design: multi-angle evaluator stack with six roles
- repository context: Markdown-only documentation repository
- constraints:
  - keep evaluators outside taxonomy skills
  - use one shared input/output contract
  - validate boundaries with lightweight shell checks

## Example Output

```markdown
## Implementation Plan

**File scope:**
- Create: `docs/evaluators/evaluator-stack.md`
- Create: `docs/evaluators/requirements-and-scope-evaluator.md`
- Create: `docs/evaluators/architecture-and-boundaries-evaluator.md`
- Create: `docs/evaluators/tool-and-permission-evaluator.md`
- Create: `docs/evaluators/context-and-memory-evaluator.md`
- Create: `docs/evaluators/execution-quality-evaluator.md`
- Create: `docs/evaluators/outcome-and-verification-evaluator.md`
- Modify: `docs/evaluators/README.md`
- Modify: `README.md`

**Task order:**
1. Write the shared stack guide with the input contract, output contract, `4 + 1 + 1` dispatch model, and aggregation rules.
2. Draft the first three evaluator role docs: requirements/scope, architecture/boundaries, tool/permission.
3. Draft the remaining three role docs: context/memory, execution quality, outcome/verification.
4. Update repository entry docs so the new evaluator material is discoverable.
5. Run boundary and hygiene checks.

**Verification:**
- `find docs/evaluators -maxdepth 1 -type f | sort`
- `for f in docs/evaluators/*-evaluator.md; do rg -q '^## Evaluation$' "$f"; rg -q 'Do Not Opine On' "$f"; done`
- `rg -n '4 \\+ 1 \\+ 1|Stage 1|Stage 2|Stage 3|Aggregat' docs/evaluators/evaluator-stack.md`
- `git diff --check -- docs/evaluators README.md`

**Eval follow-through:**
- not required yet; this phase creates the evaluator docs themselves
```

## Why This Boundary Is Correct

This artifact assumes the evaluator stack is already the chosen design and
focuses on file scope, task order, and verification. It does not revisit
whether a multi-angle evaluator stack is the right idea. That keeps it inside
`plan-agent-implementation`.

## Likely Next Skill

`verify-agent-readiness` once the implementation work is done.
