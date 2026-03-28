# Homebrew Tap

This is a Homebrew tap (`cboone/tap`) containing formulae and casks for CLI tools.

## Repository structure

- `Formula/` contains Homebrew formulae (`.rb` files)
- `Casks/` contains Homebrew casks (`.rb` files)
- `bin/update-readme` regenerates README sections from formula and cask metadata
- `bin/validate-tap-migrations` validates `tap_migrations.json` entries
- `tap_migrations.json` maps old formula names to the tap they moved to

## Formula-to-cask migrations

`tap_migrations.json` is **only** for formulae that moved to a **different tap** (e.g., `"foo": "homebrew/core"`). The value must be a valid tap name in `owner/repo` format.

There is **no Homebrew mechanism** for automatic formula-to-cask redirects within the same tap. Do not add `"name": "cask/name"` entries to `tap_migrations.json`. Homebrew will interpret the value as a tap name and try to clone a nonexistent repository.

When converting a formula to a cask within this tap:

1. Add the new cask file in `Casks/`
2. Remove the old formula from `Formula/`
3. Do **not** add a `tap_migrations.json` entry
4. Run `bin/update-readme` to update the README
5. Document the migration in the README or release notes so users know to `brew uninstall <old>` and `brew install --cask cboone/tap/<new>`

Run `bin/validate-tap-migrations` to check for invalid entries before committing changes to `tap_migrations.json`.

## Scripts

- `bin/update-readme` regenerates auto-generated README sections; use `--check` to verify without modifying
- `bin/validate-tap-migrations` validates `tap_migrations.json`; runs in CI on changes to that file
