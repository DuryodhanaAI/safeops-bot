#!/usr/bin/env bash
REPO="${1:-titanite07/autonomous-research-agent}"
BRANCH="${2:-main}"
echo "=== CI Status for $REPO ($BRANCH) ==="
gh run list --repo "$REPO" --branch "$BRANCH" --limit 5 \
  --json status,conclusion,displayTitle,createdAt \
  | jq -r '.[] | "\(.createdAt) | \(.displayTitle) | status=\(.status) conclusion=\(.conclusion)"'
