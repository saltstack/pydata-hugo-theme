---
title: Static assets
---

If you're coming from Sphinx: this theme's `extra_css` param (see [Styling](/theming/styling/)) is the direct equivalent of `html_css_files`. There's no direct equivalent of `html_js_files`/`app.add_js_file` as a theme param — for custom JS, use Hugo's own asset pipeline ([Hugo Pipes](https://gohugo.io/hugo-pipes/introduction/)) at the site level: drop a script in your site's `assets/`, process/fingerprint it with `resources.Get`/`fingerprint` in a site-level partial override, and add that partial to whichever slot you want it in (e.g. `content_footer_items`, `footer_end`).

See [Asset pipeline](/hugo-only/asset-pipeline/) for how this theme's own FontAwesome/Bootstrap JS mounts do exactly that, as a working example to copy.
