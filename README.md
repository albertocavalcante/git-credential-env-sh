# git-credential-ghenv-sh

Minimal shell-based Git credential helper for HTTPS Git operations.

This repo exists as a simple script variant of `git-credential-ghenv`.

## Helper Script

Script path:

```bash
bin/git-credential-ghenv-sh
```

It implements the Git credential helper protocol (`get`, `store`, `erase`).

## Configure

Use as an inline helper command:

```bash
git config --global credential.helper "!$PWD/bin/git-credential-ghenv-sh"
```

Or install it to your PATH as `git-credential-ghenv-sh` and set:

```bash
git config --global credential.helper ghenv-sh
```

Set credentials and matching rules:

```bash
export GIT_CREDENTIAL_TOKEN="..."
export GIT_CREDENTIAL_HOST="github.com"                # default: github.com
export GIT_CREDENTIAL_PROTOCOL="https"                 # default: https
export GIT_CREDENTIAL_USERNAME="x-access-token"        # default: x-access-token
export GIT_CREDENTIAL_PATH_PREFIX="my-org/"            # optional
```

## `GIT_CREDENTIAL_PATH_PREFIX` Explained

`GIT_CREDENTIAL_PATH_PREFIX` is matched against Git's credential request
`path` field.

For GitHub, `path` is typically:

- `owner/repo`
- `owner/repo.git`

Examples:

- `GIT_CREDENTIAL_PATH_PREFIX="my-org/"`: match any repo under `my-org`
- `GIT_CREDENTIAL_PATH_PREFIX="my-org/private-repo"`: match one repo
- unset: no path restriction (host/protocol checks only)

## Custom Token Env Var

By default the helper reads `GIT_CREDENTIAL_TOKEN`. You can point it to any
other env var name:

```bash
export GIT_CREDENTIAL_TOKEN_ENV="MY_APP_TOKEN"
export MY_APP_TOKEN="..."
```

## Quick Smoke Test

```bash
printf 'protocol=https\nhost=github.com\n\n' | bin/git-credential-ghenv-sh get
```
