---
title: Install
---

Add the module to your site's `hugo.toml`:

```toml
[module]
  [[module.imports]]
    path = "github.com/saltstack/pydata-hugo-theme"
```

Then fetch it and its build-time npm dependencies (FontAwesome's JS+SVG icon kit, Bootstrap's JS bundle, mounted via `[[module.mounts]]`):

```sh
hugo mod get github.com/saltstack/pydata-hugo-theme
npm install
```

That's it — `hugo server`/`hugo build` will now resolve the theme.

## Offline / reproducible builds

By default Hugo resolves the module (and its npm mounts) fresh at build time, which needs Go and network access. If you'd rather commit a fully offline, reproducible copy — no Go toolchain, no npm, no live fetch during CI — run:

```sh
hugo mod vendor
```

This copies the resolved module into your site's `_vendor/` directory, which you check into your own repo; Hugo then always builds from that local copy. One gotcha: `hugo mod vendor` only copies Hugo-relevant files (`layouts/`, `static/`, `hugo.toml`, etc.) — it skips this module's own `LICENSE`/`README.md`, so re-copy those manually into `_vendor/.../pydata-hugo-theme/` after every re-vendor if you want the attribution notice to travel with the vendored copy.

A real, in-production example of this pattern — including a small wrapper script that automates the bump/vendor/re-copy sequence — lives in [`salt-project-website`'s `scripts/update-vendored-theme.sh`](https://github.com/saltstack/salt-project-website/blob/main/scripts/update-vendored-theme.sh). It's specific to that repo's layout, so it isn't shipped as part of this module, but it's a good reference to adapt.
