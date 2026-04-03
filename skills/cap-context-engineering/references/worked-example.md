# Worked Example

## Scenario

Design the context strategy for an agent that maintains PromethOS. The agent
often edits one skill or one documentation slice at a time, but sometimes needs
to reach into the upstream research workspace to confirm a runtime constraint.

## Example Input

- task shape: repository maintenance for `skills/` and `docs/`
- sources of truth:
  - current PromethOS repository
  - upstream research workspace used only as supporting evidence
- constraints:
  - avoid loading the whole skill library at once
  - keep context small during doc-only edits
  - reopen originals before quoting or revising a design claim

## Example Output

```markdown
## Context Strategy

**Operating loop:**
- identify the target artifact
- load only the directly relevant skill or doc
- inspect neighboring material only if a boundary question appears
- verify with repository checks before reporting status

**Initial working set:**
- the target `SKILL.md` or target doc
- `README.md` and `AGENTS.md` when repository-facing wording matters
- current diff or task request

**Eager vs deferred vs retrieved:**
- Eager: target file, top-level repository guidance, current task description
- Deferred: adjacent skills, roadmap, evaluator docs
- Retrieved on demand: upstream source-workspace docs or runtime snippets used to confirm a constraint

**Source-of-truth precedence:**
1. current PromethOS repository files
2. upstream public design docs used as supporting evidence
3. summaries made during the current session

**Compression rules:**
- summarize long design docs after extracting only the needed decisions
- reopen the original source before quoting, editing, or citing a constraint

**Refresh and reset behavior:**
- trim context after each self-contained file change
- rebuild from the target artifact when switching from taxonomy work to evaluator or runtime-reference work
```

## Why This Boundary Is Correct

This artifact defines what to load, what to defer, and what to retrieve. It
does not decide how long information should persist across sessions and it does
not define permission rules for reading upstream sources. That keeps it within
`cap-context-engineering`, not memory strategy or permission-model design.

## Likely Next Skill

`cap-memory-strategy-design` if persistent memory behavior also needs to be
designed.
