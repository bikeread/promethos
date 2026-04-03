# PromethOS for Gemini CLI

PromethOS is compatible with Gemini CLI through the extension entrypoint in
`GEMINI.md`.

## Installation

Install the repository as a Gemini extension:

```bash
gemini extensions install https://github.com/bikeread/promethos
```

If you are using a fork, replace the URL with your own repository path.

## How It Works

- `gemini-extension.json` registers the extension
- `GEMINI.md` preloads `using-promethos`
- `skills/using-promethos/references/gemini-tools.md` explains tool mapping

## Compatibility Notes

- Support level is `Compatible`, not fully validated first-class support
- Gemini CLI does not expose Claude Code-style subagents
- When a PromethOS skill mentions provider-specific tools, follow the Gemini
  mapping reference instead of the literal names

## Updating

```bash
gemini extensions update promethos
```
