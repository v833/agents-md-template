#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
agents_path="$repo_root/AGENTS.md"

if [[ ! -f "$agents_path" ]]; then
  echo "AGENTS.md not found at repository root: $agents_path" >&2
  exit 1
fi

if grep -n '<填写' "$agents_path"; then
  echo 'AGENTS.md still contains template placeholders.' >&2
  echo 'Complete the first-time initialization described in AGENTS.md.' >&2
  exit 1
fi

lines="$(wc -l < "$agents_path" | tr -d ' ')"
if [[ "$lines" -gt 200 ]]; then
  echo "AGENTS.md has $lines lines. Move detailed guidance into linked documents and keep the root map below 200 lines." >&2
  exit 1
fi

echo "AGENTS.md initialization check passed ($lines lines)."
