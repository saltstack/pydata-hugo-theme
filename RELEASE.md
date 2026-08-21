# Release Process

Releases are managed by [Cocogitto](https://docs.cocogitto.io/) (`cog`), which reads the conventional commit history to calculate the next semantic version, update `CHANGELOG.md`, create a version commit, and tag the release. Pushing that tag to GitHub triggers `.github/workflows/release.yml`, which verifies the tagged commit builds and publishes a GitHub Release with the generated changelog section as its notes.

## Prerequisites

- `cog` is installed locally (see the [Cocogitto installation docs](https://github.com/cocogitto/cocogitto#installation), or use `.devcontainer/`, which installs it automatically)
- Git hooks are enabled: `just enable-pre-commit`
- You are on the `main` branch with a clean working tree and your local `main` is up to date with `origin/main`
- You have push access to `origin`

## Standard Release (`just bump`)

`just bump` runs `cog bump --auto`, which:

1. Reads all conventional commits since the last `v*` tag
2. Calculates the next version following [Semantic Versioning](https://semver.org/):
   - `feat` commits → minor bump
   - `fix`, `perf`, `refactor` commits → patch bump
   - Any commit with `BREAKING CHANGE` in the footer → major bump
3. Updates `CHANGELOG.md` with a generated section for the new version
4. Creates a version commit (`chore(release): v<version>`)
5. Creates an annotated git tag `v<version>`

After all of these steps, the user must still push:
- `git push` — pushes the release commit to `origin/main`
- `git push origin v<version>` — pushes the tag, which triggers the release workflow

## Manual Version Bump (`just bump-manual`)

Use this when you need to force a specific semver component regardless of commit history:

```bash
just bump-manual patch   # 0.1.4 → 0.1.5
just bump-manual minor   # 0.1.4 → 0.2.0
just bump-manual major   # 0.1.4 → 1.0.0
```

## Previewing the Changelog Before Releasing

Before running a bump, preview what will appear in the changelog:

```bash
just changelog-preview
```

This runs `cog changelog ..` and prints the unreleased section (everything since the latest tag) without making any changes.

## What Happens After the Tag Is Pushed

The `release.yml` GitHub Actions workflow triggers on any `v*.*.*` tag pushed to `origin`. It:

1. Checks out the tagged commit and builds `docs/` and `exampleSite/` with Hugo, to confirm the tag is actually buildable
2. Runs `cog changelog --at <tag>` to generate that version's changelog section
3. Publishes a (non-draft) GitHub Release for the tag, using the generated changelog section as the release notes

No manual publishing step is required — pushing the tag is sufficient. Unlike a package-registry-based project, there's no artifact to build and upload here: the pushed git tag itself is what downstream consumers' `hugo.toml`/`go.mod` resolve as the published module version, via the Go module proxy.

## Recovering from a Bad Bump

If you ran `just bump` but have not yet pushed (or the push failed), you can undo the bump locally:

```bash
just undo-bump
```

This deletes the latest tag and resets `HEAD` by one commit (hard reset), leaving you back in the pre-bump state. This is destructive — only use it on commits that have not been pushed to `origin`.

## Release Checklist

- [ ] All intended commits are merged to `main`
- [ ] `just changelog-preview` output looks correct
- [ ] `just check-all` reports no conventional commit violations
- [ ] Working tree is clean (`git status`)
- [ ] Local `main` is up to date (`git pull origin main`)
- [ ] Run `just bump` (or `just bump-manual <type>` for a forced bump)
- [ ] Run the two `git push` commands printed by cog after the bump:
  - `git push` — pushes the release commit to `origin/main`
  - `git push origin v<version>` — pushes the tag and triggers the release workflow
- [ ] Confirm the `Release` workflow passed in GitHub Actions and the new release appears on the [Releases page](https://github.com/saltstack/pydata-hugo-theme/releases)
