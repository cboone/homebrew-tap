# Migrate fm from Formula to Cask

## Context

The `fm` project has switched its GoReleaser config from the deprecated `brews` section to `homebrew_casks` (cboone/fm#62). The first cask-based release (v0.3.0) has already been cut and committed to this repo (`Casks/fm.rb`). The old formula (`Formula/fm.rb`, stuck at v0.2.0) needs to be removed and users redirected to the cask.

This follows the same pattern used for the `snappy` to `snappy-tm` migration already present in `tap_migrations.json`.

## Changes

### 1. Verify the cask works

Run `brew install --cask cboone/tap/fm` to confirm the cask installs correctly. This is a manual verification step before proceeding with destructive changes.

### 2. Delete `Formula/fm.rb`

Remove the old formula file that is frozen at v0.2.0 and will no longer receive updates.

- **File:** `Formula/fm.rb`

### 3. ~~Add migration entry to `tap_migrations.json`~~ (INCORRECT)

> **This step was wrong.** `tap_migrations.json` is only for formulae that moved
> to a **different tap** (e.g., `"foo": "homebrew/core"`). The value `"cask/fm"`
> caused Homebrew to try tapping `cask/homebrew-fm`, a nonexistent repository.
> There is no Homebrew mechanism for automatic formula-to-cask redirects within
> the same tap. This entry was removed on 2026-03-28.

### 4. Regenerate `README.md`

Run `bin/update-readme` to automatically move `fm` from the Formulae section to the Casks section. The script reads `Formula/*.rb` and `Casks/*.rb` to regenerate all marked sections.

- **File:** `README.md` (auto-generated sections)
- **Script:** `bin/update-readme`

### 5. Commit

Single commit since all changes are one logical unit:

```
chore: migrate fm from formula to cask (#14)
```

## Verification

1. Run `brew install --cask cboone/tap/fm` and confirm it installs v0.3.0
2. Run `bin/update-readme --check` after the README update to confirm it is in sync
3. Verify `tap_migrations.json` is valid JSON
4. Verify `Formula/fm.rb` no longer exists
5. Verify `README.md` lists `fm` under Casks (not Formulae)
