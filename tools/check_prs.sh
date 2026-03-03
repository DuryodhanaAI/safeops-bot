#!/usr/bin/env bash
REPO="${1:-DuryodhanaAI/safeops-bot}"
echo "=== Open PRs for $REPO ==="
gh pr list --repo "$REPO" --state open \
  --json number,title,author,createdAt \
  | jq -r '.[] | "#\(.number) | \(.title) | by \(.author.login) | \(.createdAt)"'
