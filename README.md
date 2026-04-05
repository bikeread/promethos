# PromethOS

English | [简体中文](README.zh-CN.md)

PromethOS is a skills-first framework for designing, governing, evaluating, and
evolving agent systems across domains.

It packages reusable `SKILL.md` prompts for agent requirements, architecture,
context, memory, permissions, tool contracts, guardrails, evaluation, and
library maintenance.

PromethOS is currently in an early public preview: the shared `skills/`
contract is stable enough to use and extend, while installation and packaging
remain intentionally lightweight through the `skills` CLI and manual fallback
docs.

## Design Lineage

PromethOS is downstream of Claude Code agent-design practice, but it is not a
copy of the Claude Code runtime.

The library extracts reusable agent-development principles from upstream
runtime experience, then expresses them as portable skills, references, and
evals for broader reuse.

Maintainer-facing abstraction docs live under
[docs/framework/README.md](docs/framework/README.md).

## What It Does

PromethOS gives an agent a structured way to answer:

- what this agent system is supposed to do,
- how its subsystems should be designed well,
- where autonomy and risk boundaries should be drawn,
- how the agent should be evaluated and improved,
- how the skills library itself should evolve.

The library is intentionally lightweight: one canonical `skills/` directory,
plus thin platform-specific entrypoints for the harness you are using.
When PromethOS coexists with a broader workflow library, PromethOS is intended
to act as the agent-domain methodology layer rather than a replacement for all
session-level process control.

## Quickstart

1. For Codex, install PromethOS globally with the `skills` CLI:

   ```bash
   npx skills add bikeread/promethos -g -a codex -s '*' --copy -y
   ```

2. Restart Codex, then verify that the bootstrap routing skill is visible.
3. If you prefer manual install or use another harness, follow the install
   guide for [Codex](.codex/INSTALL.md),
   [Claude Code](docs/README.claude-code.md), or
   [Gemini CLI](docs/README.gemini.md).

## How It Works

1. A routing/bootstrap skill decides whether PromethOS should lead and which
   agent-design question comes first.
2. Core entry skills handle the first high-leverage decisions: requirements,
   autonomy boundaries, eval design, debugging, and readiness checks.
3. Design-deepening skills handle architecture, implementation planning,
   context, memory, permissions, tool contracts, delegation, and scope.
4. Maintainer skills keep the library itself coherent and improve it from
   evidence.

## Support Matrix

| Platform | Status | Install Guide |
|---|---|---|
| Claude Code | Documented | [docs/README.claude-code.md](docs/README.claude-code.md) |
| Codex | Documented | [.codex/INSTALL.md](.codex/INSTALL.md) / [docs/README.codex.md](docs/README.codex.md) |
| Gemini CLI | Compatible | [docs/README.gemini.md](docs/README.gemini.md) |

## Library Shape

PromethOS is being organized around three public layers:

- Core entry: `route-agent-design`, `define-agent-requirements`,
  `set-agent-autonomy-boundaries`, `build-agent-evals`,
  `debug-agent-failures`, and `verify-agent-readiness`
- Design deepening: architecture, implementation, context, memory,
  permissions, tools, delegation, and scope control
- Maintainer workflows: skill authoring, library evolution, and turning
  incidents into reusable improvements

## Compatibility

PromethOS is designed to work both alone and alongside broader workflow skill
libraries such as superpowers.

- If PromethOS is installed by itself, the routing/bootstrap skill can
  bootstrap the full methodology flow.
- If a stronger session-level workflow system is already active, let it own generic process control such as brainstorming, generic implementation planning, and session-wide execution discipline.
- In coexistence mode, use PromethOS for agent-system requirements, architecture, context, memory, permissions, autonomy, evaluation, and library evolution.

See [docs/COMPATIBILITY.md](docs/COMPATIBILITY.md) for the coexistence rules.

## Repository Layout

```text
skills/
docs/
.codex/
.github/
GEMINI.md
gemini-extension.json
scripts/
```

Key maintainer docs:

- [docs/framework/README.md](docs/framework/README.md)
- [docs/references/README.md](docs/references/README.md)
- [docs/evals/README.md](docs/evals/README.md)
- [docs/ROADMAP.md](docs/ROADMAP.md)

## Contributing

Contributions are welcome. Start with [CONTRIBUTING.md](CONTRIBUTING.md) before
adding or restructuring skills. For public vulnerability reports, follow
[SECURITY.md](SECURITY.md) instead of opening a detailed public issue.

## Community

- Community link: [LINUX DO](https://linux.do)

## License

PromethOS is released under the MIT License. See [LICENSE](LICENSE).
