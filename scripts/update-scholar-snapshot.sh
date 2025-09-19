#!/usr/bin/env bash
set -euo pipefail

SNAPSHOT_URL="https://r.jina.ai/https://scholar.google.com/citations?hl=en&user=YC4LRXoAAAAJ&view_op=list_works&sortby=pubdate"
OUT_FILE="papers/scholar-snapshot.html"

echo "Fetching Google Scholar snapshot via $SNAPSHOT_URL" >&2
curl -fsSL "$SNAPSHOT_URL" >"${OUT_FILE}.tmp"
mv "${OUT_FILE}.tmp" "$OUT_FILE"

NOW=$(date +%Y-%m-%d)
perl -0pi -e "s/(snapshot_last_updated:\s*)(.*)/\1$NOW/" papers/index.html

echo "Snapshot saved to $OUT_FILE and date updated." >&2
