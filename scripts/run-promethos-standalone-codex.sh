#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_HOME="${HOME:?HOME must be set}"
TEMP_HOME="$(mktemp -d "${TMPDIR:-/tmp}/promethos-codex-home.XXXXXX")"

cleanup() {
  if [[ "${PROMETHOS_STANDALONE_KEEP_HOME:-0}" == "1" ]]; then
    printf 'Preserved standalone Codex HOME at %s\n' "$TEMP_HOME" >&2
    return
  fi

  rm -rf "$TEMP_HOME"
}

trap cleanup EXIT

usage() {
  cat <<'EOF'
Usage:
  ./scripts/run-promethos-standalone-codex.sh [prompt-or-codex-args...]

Behavior:
  - Creates a temporary HOME with only this worktree's PromethOS skills visible
    under ~/.agents/skills/promethos
  - Copies the current Codex auth/config files into the temporary home
  - Runs `codex exec --ephemeral` by default unless the first argument is an
    explicit Codex subcommand

Useful environment variables:
  PROMETHOS_STANDALONE_KEEP_HOME=1   Keep the temporary HOME for inspection
  PROMETHOS_STANDALONE_DEBUG=1       Print the temporary HOME and visible skills

Examples:
  ./scripts/run-promethos-standalone-codex.sh \
    "Use PromethOS only. Tell me which skill library names are installed."

  PROMETHOS_STANDALONE_DEBUG=1 \
    ./scripts/run-promethos-standalone-codex.sh --json "Route an agent-design task."
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
    printf 'Missing required Codex file: %s\n' "$src" >&2
    exit 1
  fi

  cp "$src" "$TEMP_HOME/$rel_path"
done

if [[ -f "$SOURCE_HOME/.codex/AGENTS.md" ]]; then
  cp "$SOURCE_HOME/.codex/AGENTS.md" "$TEMP_HOME/.codex/AGENTS.md"
fi

ln -s "$ROOT_DIR/skills" "$TEMP_HOME/.agents/skills/promethos"

export HOME="$TEMP_HOME"
export CODEX_HOME="$TEMP_HOME/.codex"
export PROMETHOS_STANDALONE_HOME="$TEMP_HOME"

if [[ "${PROMETHOS_STANDALONE_DEBUG:-0}" == "1" ]]; then
  printf 'PROMETHOS_STANDALONE_HOME=%s\n' "$PROMETHOS_STANDALONE_HOME" >&2
  printf 'Visible skill roots:\n' >&2
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
