# Contributing to PromethOS

PromethOS is a shared skills library. Please keep changes narrow, explicit, and
portable across harnesses.

## Skill Layout

- Each skill lives at `skills/<skill-name>/SKILL.md`.
- One top-level skill directory should contain exactly one `SKILL.md`.
- Additional supporting material should live under that skill directory, usually
  in a `references/` subdirectory.

## Naming Rules

- Use lowercase letters, digits, and hyphens only.
- Prefer short, verb-led task names that match user intent.
- Keep public grouping in docs and examples; do not rely on taxonomy prefixes
  as the public naming system.
- Bootstrap and compatibility content belongs under the routing/bootstrap skill.

## Required Frontmatter

Every `SKILL.md` must define:

- `name`
- `description`

Keep `name` + `description` at 250 characters or less, and put trigger
conditions in `description` rather than a separate `when_to_use` field.

## Required Section Contract

Every `SKILL.md` must include these headings:

- `# Goal`
- `## Inputs`
- `## Non-Goals`
- `## Workflow`
- `## Output Contract`
- `## Escalation`
- `## Common Failure Modes`

## Cross-Platform Rules

- Do not fork the same skill body per platform.
- Put tool-mapping or harness-specific notes in the routing/bootstrap skill's
  `references/` directory.
- Skills should describe intent and ownership, not depend on one provider's
  exact tool names.

## Public Content Rules

- Avoid private paths, private organizations, and internal-only assumptions.
- Avoid hidden runtime dependencies that are not documented in the repository.
- If a behavior only works on one harness, mark that in compatibility docs
  rather than quietly assuming it everywhere.

## Validation

Before opening a PR, run:

```bash
./scripts/validate-skills.sh
python3 ./scripts/check-repo-docs.py
```

If you are changing platform docs or install flows, also do the relevant manual
smoke check for that harness.

## Issues, PRs, and Security

- Use the GitHub issue templates for bugs and skill proposals.
- Use the PR template to record validation and any manual harness smoke checks.
- Do not report vulnerabilities or unsafe-publication concerns in a detailed
  public issue. Follow [SECURITY.md](SECURITY.md) instead.
