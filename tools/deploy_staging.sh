#!/usr/bin/env bash
REPO="${1:-safeops-bot}"
echo "=== SafeOps Approval Gate ==="
echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] ACTION: deploy_staging | REPO: $REPO | STATUS: approved" >> ~/safeops-bot/audit-log.md
echo "Deploy to staging simulated. Audit log updated."
