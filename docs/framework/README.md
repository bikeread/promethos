# Abstraction Framework

This directory explains how PromethOS turns Claude Code agent-design practice
into a portable methodology layer.

The goal is not to reproduce Claude Code's full runtime. The goal is to keep
the reusable design principles and move provider-specific runtime detail into
the right layer.

## Documents

- [Claude Code Design Principles](claude-code-design-principles.md)
- [Skill Alignment Matrix](skill-alignment-matrix.md)
- [Extraction Governance](extraction-governance.md)

## How To Use These Docs

- Read [Claude Code Design Principles](claude-code-design-principles.md) first
  when deciding what PromethOS is actually trying to preserve from Claude Code.
- Use [Skill Alignment Matrix](skill-alignment-matrix.md) before adding,
  merging, splitting, renaming, or demoting skills.
- Use [Extraction Governance](extraction-governance.md) when mining new
  patterns from Claude Code or any other upstream agent system.

## Relationship To Other Docs

- [../references/README.md](../references/README.md) holds runtime-grounded
  notes that explain why certain boundaries matter in practice.
- [../evals/README.md](../evals/README.md) holds reusable behavior checks.
- [../ROADMAP.md](../ROADMAP.md) tracks what evidence and supporting material
  still need to be added.
