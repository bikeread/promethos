# PromethOS for Gemini CLI

PromethOS is compatible with Gemini CLI through either the `skills` CLI or the
extension entrypoint in `GEMINI.md`.

## Recommended: Install With `skills` CLI

Install the full library globally for Gemini CLI:

```bash
npx skills add bikeread/promethos -g -a gemini-cli -s '*' --copy -y
```

## Manual Install Fallback

If you prefer the extension-based flow, install the repository as a Gemini
extension:

```bash
gemini extensions install https://github.com/bikeread/promethos
```

If you are using a fork, replace the URL with your own repository path.

## How It Works

- The recommended `skills` CLI command installs PromethOS skill directories for
  Gemini CLI under `~/.agents/skills/`
- `gemini-extension.json` registers the extension
- `GEMINI.md` preloads `route-agent-design`
- `skills/route-agent-design/references/gemini-tools.md` explains tool mapping

## Compatibility Notes

- Support level is `Compatible`, not fully validated first-class support
- Gemini CLI does not expose Claude Code-style subagents
- When a PromethOS skill mentions provider-specific tools, follow the Gemini
  mapping reference instead of the literal names

## Verify

- CLI install: `npx skills ls -g`
- Extension install: verify `promethos` appears in `gemini extensions list`
- In Gemini CLI, ask about `route-agent-design` or another PromethOS skill and
  confirm it can describe the library

## Updating

- `skills` CLI install: `npx skills update`
- Extension install: `gemini extensions update promethos`
