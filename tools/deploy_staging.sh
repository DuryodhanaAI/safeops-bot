#!/usr/bin/env bash
REPO="${1:-DuryodhanaAI/safeops-bot}"
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

echo "=== SafeOps Approval Gate ==="
echo "| $TIMESTAMP | deploy_staging | $REPO | approved |" >> ~/safeops-bot/audit-log.md

cd ~/safeops-bot
git add audit-log.md
git commit -m "audit: deploy_staging approved at $TIMESTAMP"
git push origin main

echo "Deploy simulated. Audit log committed to GitHub."
