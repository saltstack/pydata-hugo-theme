---
title: Hugo Modules
---

This is the mechanism the theme itself is distributed through — Sphinx has no equivalent concept (a Sphinx theme is just a Python package with a `theme.conf`, not a versioned, mountable dependency graph).

## Explicit mounts

Adding any `[[module.mounts]]` entry disables Hugo's implicit default mounts, so this module's `hugo.toml` re-declares every standard component directory explicitly (`content`, `static`, `layouts`, `data`, `assets`, `i18n`, `archetypes`), plus two npm-sourced mounts that pull prebuilt JS straight out of `node_modules` into the asset pipeline:

```toml
[[module.mounts]]
  source = "node_modules/@fortawesome/fontawesome-free/js/all.min.js"
  target = "assets/vendor/fontawesome/all.min.js"
```

See [Asset pipeline](/hugo-only/asset-pipeline/) for how those mounted files get loaded.

## Vendoring

`hugo mod vendor` snapshots the resolved module (and its npm mounts) into your site's `_vendor/` directory for offline, reproducible builds with no Go toolchain or network access needed at build time. Covered in full in [Install](/get-started/install/).
