#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_HOME="${HOME:?HOME must be set}"
TEMP_HOME="$(mktemp -d "${TMPDIR:-/tmp}/promethos-codex-home.XXXXXX")"

cleanup() {
  if [[ "${PROMETHOS_COHOME_KEEP_HOME:-0}" == "1" ]]; then
    printf 'Preserved coexistence Codex HOME at %s
' "$TEMP_HOME" >&2
    return
  fi
  rm -rf "$TEMP_HOME"
}
trap cleanup EXIT

usage() {
  cat <<'EOF'
Usage:
  ./scripts/run-promethos-coexistence-codex.sh [prompt-or-codex-args...]

Behavior:
  - Creates a temporary HOME with this worktree's PromethOS skills visible as
    ~/.agents/skills/promethos
  - Reuses the currently installed ~/.agents/skills/superpowers when present
  - Copies the current Codex auth/config files into the temporary home
  - Runs `codex exec --ephemeral` by default unless the first argument is an
    explicit Codex subcommand

Useful environment variables:
  PROMETHOS_COHOME_KEEP_HOME=1   Keep the temporary HOME for inspection
  PROMETHOS_COHOME_DEBUG=1       Print the temporary HOME and visible skills
EOF
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  usage
  exit 0
fi

mkdir -p "$TEMP_HOME/.codex" "$TEMP_HOME/.agents/skills"

for rel_path in ".codex/auth.json" ".codex/config.toml"; do
  src="$SOURCE_HOME/$rel_path"
  if [[ ! -f "$src" ]]; then
    printf 'Missing required Codex file: %s
' "$src" >&2
    exit 1
  fi
  cp "$src" "$TEMP_HOME/$rel_path"
done

if [[ -f "$SOURCE_HOME/.codex/AGENTS.md" ]]; then
  cp "$SOURCE_HOME/.codex/AGENTS.md" "$TEMP_HOME/.codex/AGENTS.md"
fi

ln -s "$ROOT_DIR/skills" "$TEMP_HOME/.agents/skills/promethos"

if [[ -e "$SOURCE_HOME/.agents/skills/superpowers" ]]; then
  ln -s "$SOURCE_HOME/.agents/skills/superpowers" "$TEMP_HOME/.agents/skills/superpowers"
fi

export HOME="$TEMP_HOME"
export CODEX_HOME="$TEMP_HOME/.codex"
export PROMETHOS_COHOME="$TEMP_HOME"

if [[ "${PROMETHOS_COHOME_DEBUG:-0}" == "1" ]]; then
  printf 'PROMETHOS_COHOME=%s
' "$PROMETHOS_COHOME" >&2
  printf 'Visible skill roots:
' >&2
  find "$HOME/.agents/skills" -maxdepth 1 -mindepth 1 -type l -o -maxdepth 1 -mindepth 1 -type d >&2
fi

codex_subcommands=(
  exec review login logout mcp mcp-server app-server completion sandbox
  debug apply resume fork cloud features help
)

use_passthrough=0
for subcommand in "${codex_subcommands[@]}"; do
  if [[ "${1:-}" == "$subcommand" ]]; then
    use_passthrough=1
    break
  fi
done

if [[ "$use_passthrough" == "1" ]]; then
  exec codex "$@"
fi

exec codex exec --ephemeral "$@"
