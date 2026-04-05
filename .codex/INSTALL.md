# Installing PromethOS for Codex

PromethOS works with Codex through native skill discovery.

## Recommended: Install With `skills` CLI

Install the full library globally for Codex:

```bash
npx skills add bikeread/promethos -g -a codex -s '*' --copy -y
```

This command installs every PromethOS skill under `~/.agents/skills/`, which
matches Codex's standard discovery path.

Restart Codex after installation.

## Verify

```bash
npx skills ls -g
ls -la ~/.agents/skills/route-agent-design
```

You should see the PromethOS skills in the CLI output and a populated
`~/.agents/skills/route-agent-design` directory on disk.

## Manual Install Fallback

If you prefer to work from a local clone, put this repository at
`~/.codex/promethos` and expose the shared `skills/` directory to Codex:

```bash
mkdir -p ~/.agents/skills
ln -s ~/.codex/promethos/skills ~/.agents/skills/promethos
```

Windows (PowerShell):

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\\.agents\\skills"
cmd /c mklink /J "$env:USERPROFILE\\.agents\\skills\\promethos" "$env:USERPROFILE\\.codex\\promethos\\skills"
```

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

If you installed with the `skills` CLI:

```bash
npx skills update
```

If you installed manually, update the repository in place. The symlinked skills
become visible on the next Codex restart.

## Uninstalling

If you installed with the `skills` CLI, run `npx skills remove -g` and select
the PromethOS skills interactively.

If you installed manually:

```bash
rm ~/.agents/skills/promethos
```
