# cboone/tap

Homebrew tap for `cboone` projects.

## Install the tap

```bash
brew tap cboone/tap
```

## Formulae

<!-- BEGIN:formulae-table -->

| Formula                                                  | Description                                                        |
| -------------------------------------------------------- | ------------------------------------------------------------------ |
| [`bopca`](https://github.com/cboone/bopca)               | Run LLM agents in lightweight macOS VMs                            |
| [`gh-problemas`](https://github.com/cboone/gh-problemas) | TUI for GitHub issue management                                    |
| [`pbcopy2`](https://github.com/cboone/pbcopy2)           | Modern pbcopy and pbpaste: concealment, auto-clear, type selection |
| [`right-round`](https://github.com/cboone/right-round)   | Browse and preview terminal progress indicators                    |

<!-- END:formulae-table -->

## Install

<!-- BEGIN:install-commands -->

```bash
brew install cboone/tap/bopca
brew install cboone/tap/gh-problemas
brew install cboone/tap/pbcopy2
brew install cboone/tap/right-round
```

<!-- END:install-commands -->

## Notes

<!-- BEGIN:notes -->

- `pbcopy2` installs a pre-built binary from the latest release.
- `bopca` and `gh-problemas` install pre-built binaries from GoReleaser-managed releases.
- `right-round` is a HEAD-only formula that builds from source.

<!-- END:notes -->

## Casks

<!-- BEGIN:casks-table -->

| Cask                                            | Description                                                              |
| ----------------------------------------------- | ------------------------------------------------------------------------ |
| [`fm`](https://github.com/cboone/fm)            | Safe, read-oriented CLI for Fastmail email via JMAP                      |
| [`snappy-tm`](https://github.com/cboone/snappy) | Automatically increase your Time Machine snapshot frequency (macOS only) |

<!-- END:casks-table -->

<!-- BEGIN:cask-install-commands -->

```bash
brew install --cask cboone/tap/fm
brew install --cask cboone/tap/snappy-tm
```

<!-- END:cask-install-commands -->

<!-- BEGIN:cask-notes -->

- `fm` and `snappy-tm` install pre-built binaries from GoReleaser-managed releases.

<!-- END:cask-notes -->
