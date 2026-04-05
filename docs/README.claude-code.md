# PromethOS for Claude Code

Claude Code expects skills to appear as individual directories under
`~/.claude/skills/`.

## Recommended: Install With `skills` CLI

Install the full library globally for Claude Code:

```bash
npx skills add bikeread/promethos -g -a claude-code -s '*' --copy -y
```

Start a new Claude Code session after installation.

## Manual Install Fallback

If you prefer to work from a local clone, put this repository at
`~/.claude/promethos`, create the Claude Code skills directory if needed:

```bash
mkdir -p ~/.claude/skills
```

Then link each PromethOS skill directory into Claude Code's skills directory:

```bash
for dir in ~/.claude/promethos/skills/*; do
  ln -s "$dir" ~/.claude/skills/"$(basename "$dir")"
done
```

Windows (PowerShell):

```powershell
$source = "$env:USERPROFILE\\.claude\\promethos\\skills"
$target = "$env:USERPROFILE\\.claude\\skills"
New-Item -ItemType Directory -Force -Path $target | Out-Null
Get-ChildItem $source -Directory | ForEach-Object {
  cmd /c mklink /J "$target\\$($_.Name)" "$($_.FullName)" | Out-Null
}
```

## Verify

- CLI install: `npx skills ls -g`
- Manual install: `ls -la ~/.claude/skills/route-agent-design`
- In Claude Code, ask about `route-agent-design` or another PromethOS skill and
  confirm it can describe the library.

## Notes

- The repository still ships one canonical `skills/` directory.
- The `skills` CLI installs Claude Code-compatible skill directories directly.
