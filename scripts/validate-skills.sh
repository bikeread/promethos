#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
FAILURES=0

required_headings=(
  '^# Goal$'
  '^## Inputs$'
  '^## Non-Goals$'
  '^## Workflow$'
  '^## Output Contract$'
  '^## Escalation$'
  '^## Common Failure Modes$'
)

NAME_FILE="$(mktemp)"
trap 'rm -f "$NAME_FILE"' EXIT

mapfile -t skill_dirs < <(find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d | sort)

if [[ "${#skill_dirs[@]}" -eq 0 ]]; then
  echo "No skill directories found in $SKILLS_DIR"
  exit 1
fi

for dir in "${skill_dirs[@]}"; do
  mapfile -t skill_files < <(find "$dir" -mindepth 1 -maxdepth 1 -type f -name 'SKILL.md' | sort)

  if [[ "${#skill_files[@]}" -ne 1 ]]; then
    echo "Expected exactly one SKILL.md in $dir, found ${#skill_files[@]}"
    FAILURES=1
    continue
  fi

  skill_file="${skill_files[0]}"

  for frontmatter_key in '^name:' '^description:' '^when_to_use:'; do
    if ! grep -qE "$frontmatter_key" "$skill_file"; then
      echo "Missing required frontmatter '$frontmatter_key' in $skill_file"
      FAILURES=1
    fi
  done

  skill_name="$(
    sed -n 's/^name:[[:space:]]*//p' "$skill_file" \
      | head -n 1 \
      | tr -d '\r"' \
      | tr -d "'"
  )"
  if [[ -z "$skill_name" ]]; then
    echo "Could not parse skill name from $skill_file"
    FAILURES=1
  else
    printf '%s\n' "$skill_name" >> "$NAME_FILE"
  fi

  for heading in "${required_headings[@]}"; do
    if ! grep -qE "$heading" "$skill_file"; then
      echo "Missing required heading '$heading' in $skill_file"
      FAILURES=1
    fi
  done
done

duplicate_names="$(sort "$NAME_FILE" | uniq -d)"
if [[ -n "$duplicate_names" ]]; then
  echo "Duplicate skill names found:"
  echo "$duplicate_names"
  FAILURES=1
fi

for ref_file in \
  "$SKILLS_DIR/route-agent-design/references/codex-tools.md" \
  "$SKILLS_DIR/route-agent-design/references/gemini-tools.md"
do
  if [[ ! -f "$ref_file" ]]; then
    echo "Missing required bootstrap reference: $ref_file"
    FAILURES=1
  fi
done

if [[ "$FAILURES" -ne 0 ]]; then
  echo "PromethOS skill validation failed."
  exit 1
fi

echo "Validated ${#skill_dirs[@]} PromethOS skill directories."
