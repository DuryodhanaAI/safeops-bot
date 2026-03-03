# SafeOps Bot — Live Demo Walkthrough

## Step 1: Ask SafeOps Bot who it is
Bot introduces itself as a security-focused DevOps assistant.

## Step 2: CI Check
User pastes output of check_ci.sh — bot analyzes all runs and flags failures.

## Step 3: Approval Gate in Action
User requests a deploy → bot asks for explicit approval → only executes on "yes".

## Step 4: Audit Log (auto-committed to GitHub)
Every approved action creates a timestamped entry visible in the repo history.

## Step 5: Security Audit
Bot runs security_audit.sh, checks for open security issues and recent CI failures.

[Screenshots coming — see /assets folder]
