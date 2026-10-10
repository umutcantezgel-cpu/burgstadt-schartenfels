#!/usr/bin/env bash
# Stillgelegt seit der Auslagerung aus „werwolf_digital_flutter“: Das Skript pushte und mergte
# nach Branchnamen des alten Repos. Für dieses Repo neu einrichten, bevor es wieder benutzt wird.
echo "stillgelegt (Auslagerung aus werwolf_digital_flutter)" >&2; exit 1
# Commit nur bei grünem Gesamttest (schnell). Aufruf: bash tool/commit_gruen.sh "<Nachricht>"
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
LOG="$(mktemp)"
bash tool/alle_tests.sh schnell > "$LOG" 2>&1
if ! grep -aq "ALLE TESTS GRÜN" "$LOG"; then
  echo "NICHT GRÜN – kein Commit. Letzte Zeilen:"
  grep -a -v -E 'Woah|superuser|📎|^  /$' "$LOG" | tail -15
  exit 1
fi
git add -A
git commit -q -F - <<MSG
$1

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_015UazG6EuWEYKkbSvg1SfvS
MSG
git push -q origin nachtlauf/burgstadt 2>&1 | tail -1
git log --oneline -1
