# Worked Example

## Scenario

The user wants to publish PromethOS as a standalone public repository that
works across Claude Code, Codex, and Gemini CLI, but the request is still a
mix of product identity, platform support, and release constraints.

## Example Input

- agent concept: "open-source the PromethOS skills library"
- environment: GitHub repository, Markdown docs, lightweight validation only
- constraints:
  - one canonical `skills/` directory
  - no custom runtime in `v1`
  - cross-platform docs for three harnesses

## Example Output

```markdown
## Requirements Brief

**Job:** Publish a standalone public skills repository for agent-development methodology.

**Primary artifact:** A public GitHub repository containing the PromethOS skills library, install docs, and repository validation.

**Acceptance criteria:**
- The repository is understandable without reading the upstream research workspace.
- One canonical `skills/` directory is used across supported platforms.
- Claude Code, Codex, and Gemini CLI each have install or compatibility docs.
- A bootstrap skill explains how to load and sequence the library.
- The first release does not depend on a custom runtime or marketplace packaging.

**Operating surface:**
- Inputs: existing drafted skills, public documentation, platform install notes
- Outputs: Markdown docs, `SKILL.md` files, validation scripts, GitHub workflow
- Tool surface: repository file edits, shell validation, documentation review
- Approval boundaries: no remote deployment or runtime publishing work

**Non-goals:**
- Open-sourcing the upstream source snapshot repository
- Shipping a custom CLI or daemon in `v1`
- Publishing marketplace packages in the first release

**Minimum useful v1 scope:**
- 16 taxonomy skills
- 1 bootstrap skill
- platform install docs
- structural validation and CI

**Risks and open questions:**
- support-level wording may overstate validation
- platform smoke checks may still be manual in the first release
- future evaluator docs may belong outside the taxonomy
```

## Why This Boundary Is Correct

This artifact defines the job, scope, constraints, and success bar. It does not
choose the final repository architecture and it does not break the work into
implementation tasks. That is why this belongs to
`flow-agent-requirements-clarification`, not architecture design or
implementation planning.

## Likely Next Skill

`flow-agent-architecture-design` or `flow-agent-implementation-planning`,
depending on whether the repository shape is already approved.
