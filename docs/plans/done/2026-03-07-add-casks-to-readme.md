# Add casks to README and update-readme script

## Context

Issue #10. After removing the stale `Formula/snappy.rb` in favor of
`Casks/snappy.rb`, snappy disappeared from the README entirely because
`bin/update-readme` only reads from `Formula/`. The README should document
all installable packages in the tap, including casks.

## Files to modify

| File | Change |
|------|--------|
| `bin/update-readme` | Add cask parsing, generation, and section replacement |
| `README.md` | Add "Casks" heading with three marker pairs |
| `.github/workflows/update-readme.yml` | Trigger on `Casks/*.rb` changes too |

## Implementation

### 1. `bin/update-readme`: constants and arrays

Add `CASK_DIR` constant alongside `FORMULA_DIR`. Add parallel arrays for cask
data (`CASK_NAMES`, `CASK_DESCS`, `CASK_HOMEPAGES`, `CASK_TYPES`) and grouped
name arrays (`CASK_GORELEASER_NAMES`, `CASK_MANUAL_NAMES`).

Cask types: "goreleaser" (has GoReleaser comment) and "manual" (default).
No HEAD-only equivalent for casks.

### 2. `bin/update-readme`: `parse_cask` function

Follows the same structure as `parse_formula`: reads `.rb` file line-by-line,
extracts `desc` and `homepage` via the same regex patterns, detects GoReleaser
comment. Populates cask arrays. Omits `head "` detection (formula-only concept).

The regex duplication between `parse_formula` and `parse_cask` is acceptable:
bash parallel arrays make shared extraction awkward, the duplicated block is
small and stable, and each function remains self-contained.

### 3. `bin/update-readme`: cask generation functions

Three new functions mirroring their formula counterparts:

- `generate_cask_table`: same aligned-table logic, column header "Cask"
- `generate_cask_install`: uses `brew install --cask cboone/tap/<name>`
- `generate_cask_notes` + `generate_cask_note_bullet`: two cask types:
  - goreleaser: "installs a pre-built binary from a GoReleaser-managed release"
  - manual: "installs a macOS application"

Reuses existing `join_names` for natural-language lists.

### 4. `bin/update-readme`: extend `replace_sections`

Add three new content variables (`cask_table_content`, `cask_install_content`,
`cask_notes_content`), marker checks, and environment variables. Extend the awk
script with six additional rules for the three new marker pairs:
`casks-table`, `cask-install-commands`, `cask-notes`.

### 5. `bin/update-readme`: extend `main`

After formula collection/parsing, add a parallel block that collects
`Casks/*.rb` files (with `nullglob`), warns if none found, and parses each
with `parse_cask`.

### 6. `README.md`: add cask sections

After the existing "Notes" section, add a "Casks" H2 heading with three
marker pairs. All cask content lives under this single heading:

```markdown
## Casks

<!-- BEGIN:casks-table -->

<!-- END:casks-table -->

<!-- BEGIN:cask-install-commands -->

<!-- END:cask-install-commands -->

<!-- BEGIN:cask-notes -->

<!-- END:cask-notes -->
```

### 7. `.github/workflows/update-readme.yml`

- Add `Casks/*.rb` to the `paths` trigger: `paths: ["Formula/*.rb", "Casks/*.rb"]`
- Update commit message to `"docs: update README from tap metadata"`

### 8. Run `bin/update-readme` to populate the new sections

After adding the markers and script changes, run the script to fill in the
cask table, install commands, and notes from `Casks/snappy.rb` metadata.

## Expected README output (cask sections)

```markdown
## Casks

<!-- BEGIN:casks-table -->

| Cask                                               | Description                                                              |
| -------------------------------------------------- | ------------------------------------------------------------------------ |
| [`snappy`](https://github.com/cboone/snappy)       | Automatically increase your Time Machine snapshot frequency (macOS only)  |

<!-- END:casks-table -->

<!-- BEGIN:cask-install-commands -->

```bash
brew install --cask cboone/tap/snappy
```

<!-- END:cask-install-commands -->

<!-- BEGIN:cask-notes -->

- `snappy` installs a pre-built binary from a GoReleaser-managed release.

<!-- END:cask-notes -->
```

## Verification

1. Run `bin/update-readme` and confirm the cask sections are populated correctly
2. Run `bin/update-readme --check` to confirm idempotency
3. Run `shellcheck bin/update-readme` to confirm no lint issues
4. Visually inspect README.md for correct formatting and alignment
