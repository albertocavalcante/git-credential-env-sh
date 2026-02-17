# git-credential-env-sh

git-credential-env-sh

## Commands

```bash
just setup     # Install hooks and tools
just lint      # Run shellcheck
just fmt       # Format with shfmt
just check     # Run all quality checks (what CI runs)
```

## Structure

```
bin/           -- The credential helper script
.github/       -- CI/CD workflows
```

## Conventions

- Semantic commits: `type(scope): description` (max 72 chars)
- Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert
- Format with shfmt before committing (`shfmt -w -i 2 -ci -bn`)
- Lint with shellcheck -- all warnings are errors
- Script must be valid POSIX sh (no bashisms)
- SonarCloud for code quality gates (never Codecov)

## Do NOT

- Commit secrets or .env files
- Skip lefthook hooks (no --no-verify)
