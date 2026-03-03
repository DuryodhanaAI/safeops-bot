# 🦞 SafeOps Bot — OpenClaw DevOps Copilot

A Telegram-first DevOps assistant built on [OpenClaw](https://openclaw.ai), running locally on WSL2.
SafeOps Bot checks GitHub CI status, reviews PRs, and gates deployments behind human approval — all from Telegram.

## 🔥 What it does

- **CI Monitor** — fetch last 5 GitHub Actions runs for any repo/branch
- **PR Checker** — list open PRs with author and timestamp
- **Approval Gate** — bot asks "Approve? (yes/no)" before any script runs
- **Audit Log** — every approved action is timestamped to `audit-log.md`

---

## 🏗️ Architecture

    Telegram DM
        ↓
    OpenClaw Gateway (WSL2, port 18789)
        ↓
    Gemini 2.5 Flash (LLM analysis)
        ↓
    Shell Tools (GitHub CLI + bash scripts)
        ↓
    GitHub API → CI Status / PR Data
        ↓
    audit-log.md (git committed)

---

## 🛠️ Tools

| Tool | Script | What it does |
|------|--------|--------------|
| CI Monitor | tools/check_ci.sh | Last 5 GitHub Actions runs |
| PR Checker | tools/check_prs.sh | Open PRs with author and date |
| Deploy Gate | tools/deploy_staging.sh | Simulates deploy + writes audit log |

---

## ⚙️ Setup

### Prerequisites
- Windows 10/11 with WSL2 + Ubuntu
- Node.js 22+, GitHub CLI (gh), jq
- Gemini or OpenAI API key
- Telegram bot token from @BotFather

### Install

    sudo npm install -g openclaw@latest
    openclaw onboard
    sudo apt install -y gh jq
    gh auth login
    git clone https://github.com/DuryodhanaAI/safeops-bot.git
    cd safeops-bot && chmod +x tools/*.sh
    openclaw config set tools.exec.host gateway
    openclaw config set tools.exec.security full
    openclaw config set tools.exec.ask always
    openclaw config set commands.bash true
    openclaw gateway --bind loopback --port 18789 --force

### Pair Telegram

    # DM your bot, then:
    openclaw pairing approve telegram <CODE>

---

## 🔐 Security Design

This project directly addresses the event theme: keeping agents from going rogue.

- Whitelisted tools only — 3 specific scripts, nothing else
- Human approval gate — tools.exec.ask=always, every command needs explicit yes
- Audit log — every action timestamped to audit-log.md and git committed
- Loopback only — gateway bound to 127.0.0.1, never exposed to internet
- Pairing required — unknown Telegram users cannot interact without approval

---

## 📁 Structure

    safeops-bot/
    ├── tools/
    │   ├── check_ci.sh          # GitHub Actions CI monitor
    │   ├── check_prs.sh         # Open PR checker
    │   └── deploy_staging.sh    # Approval-gated deploy simulator
    ├── .github/workflows/ci.yml # SafeOps CI pipeline
    ├── audit-log.md             # Immutable action audit trail
    └── README.md

---

## 🚀 What's Next

- Direct /bash slash command execution from Telegram
- Automatic PR review summarization via OpenClaw skills
- Razorpay Sandbox API integration for payment ops monitoring
- Slack channel support for team-wide alerts
