# git-credential-env-sh
# Run `just` to see all available commands

set dotenv-load := false

# Default: list available commands
default:
    @just --list --unsorted

# ─── Setup ───────────────────────────────────────────────

# Initial project setup (install hooks, tools)
setup:
    lefthook install

# ─── Lint & Format ───────────────────────────────────────

# Run shellcheck
lint:
    shellcheck bin/git-credential-env-sh

# Format script with shfmt
fmt:
    shfmt -w -i 2 -ci -bn bin/git-credential-env-sh
    @command -v dprint > /dev/null && dprint fmt || true

# Check formatting (no changes)
fmt-check:
    shfmt -d -i 2 -ci -bn bin/git-credential-env-sh
    @command -v dprint > /dev/null && dprint check || true

# ─── Check ───────────────────────────────────────────────

# Run all quality checks (what CI runs)
check: fmt-check lint

# ─── Editor ──────────────────────────────────────────────

# Open in VS Code
code:
    code .

# Open in Cursor
cursor:
    cursor .

# Open in Zed
zed:
    zed .

# ─── GitHub ──────────────────────────────────────────────

# Open issues in browser
issues:
    gh issue list --web

# Open pull requests in browser
prs:
    gh pr list --web

# Open actions in browser
actions:
    gh run list --web
