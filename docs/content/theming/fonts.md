---
title: Fonts
---

FontAwesome and Bootstrap's JS are pulled in as build-time npm dependencies and mounted into the asset pipeline via `[[module.mounts]]` in this module's own `hugo.toml` — see [Asset pipeline](/hugo-only/asset-pipeline/) for how the mounting/fingerprinting works.

## Overriding the bundled FontAwesome version

The pinned version lives in this module's own `package.json`. A consuming site can override it without forking the theme by mounting its own copy at the same target path — Hugo resolves mounts from the site's own `node_modules` first:

```toml
# In your site's hugo.toml
[[module.mounts]]
  source = "node_modules/@fortawesome/fontawesome-free/js/all.min.js"
  target = "assets/vendor/fontawesome/all.min.js"
```

Install whatever FontAwesome version you want in your own site's `package.json`/`node_modules`, and this mount takes precedence over the theme's.
