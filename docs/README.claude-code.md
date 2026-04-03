# PromethOS for Claude Code

Claude Code expects skills to appear as individual directories under
`~/.claude/skills/`.

## Installation

1. Put this repository at `~/.claude/promethos`.
2. Create the Claude Code skills directory if needed:

```bash
mkdir -p ~/.claude/skills
```

3. Link each PromethOS skill directory into Claude Code's skills directory:

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

4. Start a new Claude Code session.

## Verify

Ask Claude Code about `using-promethos` or another PromethOS skill and confirm
that it can describe the library.

## Notes

- Marketplace packaging is intentionally deferred in `v1`.
- The repository still ships one canonical `skills/` directory; Claude Code
  just needs those directories exposed individually.
