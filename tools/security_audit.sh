#!/usr/bin/env bash
REPO="${1:-DuryodhanaAI/safeops-bot}"
echo "=== SafeOps Security Audit for $REPO ==="
echo ""
echo "[ Checking open issues labeled 'security' ]"
gh issue list --repo "$REPO" --label "security" --state open \
  --json number,title,createdAt \
  | jq -r '.[] | "#\(.number) | \(.title) | opened: \(.createdAt)"' \
  || echo "No security issues found."

echo ""
echo "[ Checking recent failed CI runs ]"
gh run list --repo "$REPO" --limit 10 \
  --json status,conclusion,displayTitle,createdAt \
  | jq -r '.[] | select(.conclusion=="failure") | "\(.createdAt) | FAILED: \(.displayTitle)"' \
  || echo "No recent failures."

echo ""
echo "[ Audit log entries (last 5) ]"
tail -5 ~/safeops-bot/audit-log.md
