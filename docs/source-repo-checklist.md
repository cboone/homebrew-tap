# Source Repo Checklist

This checklist tracks the follow-up work required in source repos to move from temporary HEAD formulas to stable, release-driven formulas in this tap.

## bopca

- [ ] Update `.goreleaser.yaml` to publish `brews` updates to `cboone/homebrew-tap` instead of `cboone/homebrew-bopca`.
- [ ] Keep `HOMEBREW_TAP_TOKEN` as an environment secret in GitHub Actions.
- [ ] After first release lands in this tap, archive or deprecate `cboone/homebrew-bopca`.

## right-round

- [ ] Cut first SemVer tag and release (for example `v0.1.0`).
- [ ] Ensure release workflow publishes tarballs and checksums.
- [ ] Add a GoReleaser `brews` block targeting `cboone/homebrew-tap`.
- [ ] Replace HEAD-only formula with stable URL + `sha256` formula updates via automation.

## jm

- [ ] Add release workflow (tags `v*`) that publishes release assets and checksums.
- [ ] Add GoReleaser config and `brews` block targeting `cboone/homebrew-tap`.
- [ ] Decide and document version strategy (`--version` output contract).
- [ ] Replace HEAD-only formula with stable release formula once first tag is published.

## gh-problemas

- [ ] Add release workflow (tags `v*`) that publishes release assets and checksums.
- [ ] Add GoReleaser config and `brews` block targeting `cboone/homebrew-tap`.
- [ ] Consider migrating module path from `github.com/hpg/gh-problemas` to `github.com/cboone/gh-problemas` for long-term consistency.
- [ ] Replace HEAD-only formula with stable release formula once first tag is published.
