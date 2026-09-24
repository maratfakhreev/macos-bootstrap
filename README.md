# macOS bootstrap

Script to set up a macOS for life and web development.

## Install

```bash
git clone https://github.com/maratfakhreev/macos-bootstrap.git
~/macos-bootstrap/bin/setup
```

Or you can run each module script one-by-one:

```bash
git clone https://github.com/maratfakhreev/macos-bootstrap.git
~/macos-bootstrap/modules/node.bash
```

## Backup and restore

```bash
~/macos-bootstrap/backups/backup.bash
~/macos-bootstrap/backups/restore.bash
```

## Development

Shell scripts are formatted with [shfmt](https://github.com/mvdan/sh) and linted with [shellcheck](https://www.shellcheck.net). Both are installed from the `Brewfile`.

```bash
~/macos-bootstrap/bin/lint        # check formatting and lint
~/macos-bootstrap/bin/lint --fix  # format files in place, then lint
```

`modules/git.bash` sets `core.hooksPath` to `.githooks`, so `bin/lint` runs as a pre-commit hook. To enable it manually:

```bash
git -C ~/macos-bootstrap config core.hooksPath .githooks
```
