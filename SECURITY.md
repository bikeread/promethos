# Security Policy

## Scope

PromethOS is a public skills library. Security concerns usually mean unsafe
workflow guidance, instructions that could expose secrets or private paths, or
documentation that encourages risky actions without clear safeguards.

## Reporting

- Do not publish exploit details, secrets, private paths, or harmful prompts in
  a public issue or pull request.
- Prefer GitHub's private vulnerability reporting flow if it is enabled for the
  repository.
- If private reporting is not available, open a minimal public issue requesting
  a private follow-up channel and keep the report high level until a maintainer
  responds.

## What To Include

- Affected file or skill path, for example `skills/guard-safe-autonomy-guardrails/SKILL.md`
- The risky behavior and why it matters
- Minimal reproduction steps
- Suggested mitigation, if known

## Response Expectations

This project does not currently promise a formal SLA. Maintainers should
acknowledge reports on a best-effort basis, confirm scope, and prefer shipping
either a fix or a documented mitigation before broader promotion of the change.
