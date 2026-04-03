# Installing PromethOS for Codex

PromethOS works with Codex through native skill discovery.

## Installation

1. Put this repository at `~/.codex/promethos`.
2. Expose the shared `skills/` directory to Codex:

```bash
mkdir -p ~/.agents/skills
ln -s ~/.codex/promethos/skills ~/.agents/skills/promethos
```

Windows (PowerShell):

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\\.agents\\skills"
cmd /c mklink /J "$env:USERPROFILE\\.agents\\skills\\promethos" "$env:USERPROFILE\\.codex\\promethos\\skills"
```

3. Restart Codex.

## Verify

```bash
ls -la ~/.agents/skills/promethos
```

You should see a symlink or junction pointing to the repository's `skills/`
directory.

## Coexistence With Superpowers

PromethOS can coexist with `superpowers` because it installs under its own
directory name:

```text
~/.agents/skills/promethos
~/.agents/skills/superpowers
```

If both are installed, let `superpowers` keep session-level workflow control
and use PromethOS for agent-system design, governance, evaluation, and
evolution tasks.

## Updating

Update the repository in place. The symlinked skills become visible on the next
Codex restart.

## Uninstalling

```bash
rm ~/.agents/skills/promethos
```
