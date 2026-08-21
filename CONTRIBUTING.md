# pydata-hugo-theme Contributing Guide

Welcome to the pydata-hugo-theme Contributing Guide, and thank you for your interest.

If you would like to contribute, this guide covers:

* Source code (theme templates, CSS, JS)
  * [Environment setup](#environment-setup)
  * [Best practices](#best-practices)
  * [Contribution workflow](#contribution-workflow)
* Documentation (`docs/content/`)
  * [Environment setup](#environment-setup)
  * [Text formats](#text-formats)

However, at this time we do not accept:

* Direct ports of upstream PyData Sphinx Theme features that require a Python/Sphinx runtime with no Hugo-native equivalent (see `docs/content/feature-parity.md` for what's intentionally out of scope, and why)
* Use of the actual PyData/Sphinx project's logo or branding assets (see [Credit / Attribution](./README.md#credit--attribution) in the README — this is an unofficial, unaffiliated port)

## Project overview

pydata-hugo-theme is a [Hugo Module](https://gohugo.io/hugo-modules/) port of the [PyData Sphinx Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/), for static/documentation sites built with Hugo instead of Sphinx. See the [README](./README.md) for usage instructions and the [documentation site](https://saltstack.github.io/pydata-hugo-theme/) for feature-by-feature coverage.

### About the upstream reference version

The `.pydata-sphinx-source-version` file at the repo root records the upstream [PyData Sphinx Theme](https://github.com/pydata/pydata-sphinx-theme) version (`0.20.0`) that this port's templates, CSS, and documentation were last scanned against — both for the original AI-assisted porting/generation of this codebase and for the equivalent AI-assisted generation of this theme's own documentation (`docs/content/`). When upstream ships a new release, that file is the reference point for scoping a re-scan: diff upstream's changes since `0.20.0` against what's implemented here, port anything applicable, and bump the file to the new version once done. If you're contributing a port of a specific upstream feature, mention which upstream version introduced it so reviewers can cross-check against this file.

## Ground rules

Be respectful of differing viewpoints, accept constructive criticism graciously, and be empathetic toward fellow contributors. This project doesn't currently have a separate `CODE_OF_CONDUCT.md`; if that becomes necessary as the contributor base grows, one will be added and linked here.

## Before you start

Before contributing, make sure you have:

* A GitHub account ([sign up here](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account) if you don't have one)
* Git
* Familiarity with [Conventional Commits](https://www.conventionalcommits.org/) — this project's commit history and changelog generation depend on it (see [Commit messages](#commit-messages))

## Environment setup

The fastest path is the provided devcontainer (`.devcontainer/`), which installs everything below automatically — open this repo in VS Code with the Dev Containers extension, or any other [devcontainer-compatible](https://containers.dev/supporting) tool. This also works with [GitHub Codespaces](https://docs.github.com/en/codespaces/overview) — click **Code → Codespaces → Create codespace on main** on the repo page for a ready-to-go environment in the browser, no local setup at all.

To set up manually instead:

1. Install [Hugo](https://gohugo.io/installation/) (extended edition), matching the version pinned in `.hugo-version`.
2. Install [Go](https://go.dev/doc/install), matching the version pinned in `.go-version` — only needed to resolve this module's own Go module files (there's no compilable Go source in this repo; it exists purely as a Hugo Module identity/resolution boundary).
3. Install Node.js, matching the version pinned in `.node-version` — needed to fetch the FontAwesome/Bootstrap build-time JS deps mounted via `[[module.mounts]]`. The devcontainer installs this via [nvm](https://github.com/nvm-sh/nvm); do the same locally if you'd rather not manage a system-wide Node install: `nvm install "$(cat .node-version)"`.
4. Install [`just`](https://github.com/casey/just) — this repo's task runner. Run `just` (or `just --list`) to see all available recipes.
5. Install [Cocogitto](https://github.com/cocogitto/cocogitto) (`cog`), pinned via `.devcontainer/cog-version` — used for conventional-commit validation and release tagging. See [Commit messages](#commit-messages) and [Releases](#releases).
6. Run `just sync` (`npm ci`) to fetch the FontAwesome/Bootstrap deps.
7. Run `just test` to build both `docs/` and `exampleSite/` with Hugo and confirm your environment is working.

### Troubleshoot

* **`hugo: command not found` or a Hugo version mismatch**: confirm you installed the *extended* Hugo build, and that its version is at least `.hugo-version`'s value.
* **Missing FontAwesome/Bootstrap assets at build time**: run `just sync` (or `npm ci` directly) — these are npm-managed, not vendored into the repo.
* **`cog: command not found`**: only required for committing/releasing, not for building or previewing the theme. Install it per the [Cocogitto installation docs](https://github.com/cocogitto/cocogitto#installation), or use the devcontainer.

## Best practices

* Prefer editing `layouts/_partials/*.html` and `static/styles/hugo-pydata.css` (this port's own additions) over the vendored-from-upstream `static/styles/pydata-sphinx-theme.css` where possible — keeping upstream-derived CSS close to its original form makes future re-scans against a newer `.pydata-sphinx-source-version` easier to diff.
* FontAwesome icons must be real `<i class="fa-...">` elements, never CSS `::before`/`::after` pseudo-element icons — the theme's SVG/JS icon kit only transforms literal DOM elements, and pseudo-element icons have no webfont fallback (see `docs/content/hugo-only/render-hooks.md` and this project's commit history for the concrete bug this caused).
* Test any template/CSS/JS change in both `docs/` (`just build-docs`) and `exampleSite/` (`just build-example`) — both resolve the theme live via a local `replace => ../`, so changes show up immediately without a vendoring step.
* If a change affects runtime JS/CSS behavior (icon rendering, search, the copy-to-clipboard button, etc.), verify it in an actual browser, not just by inspecting generated HTML — several bugs in this theme's history were only visible after a real page load.

## Contribution workflow

### Fork and clone repositories

Fork [saltstack/pydata-hugo-theme](https://github.com/saltstack/pydata-hugo-theme) and clone your fork. See GitHub's [Fork a repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo) guide if you're new to this workflow.

### Report issues and bugs

Open a [GitHub Issue](https://github.com/saltstack/pydata-hugo-theme/issues) describing the problem, the Hugo/theme version you're on, and steps to reproduce. For rendering/visual bugs, a screenshot or a link to a minimal reproduction (e.g. a branch of `exampleSite/`) is very helpful.

### Commit messages

This project uses [Conventional Commits](https://www.conventionalcommits.org/), enforced by Cocogitto: `<type>[optional scope]: <description>`, e.g. `fix(search): resolve index path under a baseURL subpath`. Common types: `feat`, `fix`, `docs`, `refactor`, `ci`, `chore`, `test`. This isn't just a style preference — commit types directly drive semantic version bumps and `CHANGELOG.md` generation (see [Releases](#releases)).

Run `just enable-pre-commit` once to install a local `commit-msg` git hook that validates your messages with `cog verify` before they're committed. You can also run `just check` at any time to validate every commit on your branch against `main`.

### Branch creation

Branch off `main` with a short, descriptive name (e.g. `fix/subpath-search-index` or `feat/version-switcher`). There's no enforced naming scheme beyond that.

### Pull requests

* Open your PR against `main`.
* CI (`.github/workflows/ci.yml`) validates that every commit in the PR follows Conventional Commits and that `docs/`/`exampleSite/` still build cleanly with Hugo — both must pass before merge.
* Keep PRs scoped to one logical change where practical; it makes review faster and keeps the generated changelog meaningful.
* Don't touch `CHANGELOG.md` in your PR. It's only ever written by `cog bump` at release time (see [Releases](#releases)); a PR-time edit to it is guaranteed to go stale or conflict once other PRs merge. Use `just changelog-preview` locally if you want to see what your change will look like in the changelog.
* A maintainer will review and merge once CI is green. There's no fixed SLA for review turnaround given this project's size — feel free to comment on the PR if it's been quiet for a while.

### Releases

Releases are cut with `cog bump` (see `RELEASE.md` for the full process), which reads the conventional commit history since the last tag to calculate the next semantic version, updates `CHANGELOG.md`, and creates an annotated `v<version>` tag. Pushing that tag triggers `.github/workflows/release.yml`, which verifies the tag builds and publishes a GitHub Release with the generated changelog section as its notes. There's no fixed release cadence — versions are cut as meaningful changes accumulate.

### Text formats

* Theme templates: Hugo's Go-template syntax (`.html` files under `layouts/`).
* Documentation content (`docs/content/`): Markdown with YAML front matter (between `---` fences).
* Config: TOML (`hugo.toml`, `cog.toml`).
