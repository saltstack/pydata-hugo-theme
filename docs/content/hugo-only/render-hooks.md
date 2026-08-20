---
title: Markdown render hooks
---

`layouts/_default/_markup/render-link.html` is a Hugo [render hook](https://gohugo.io/render-hooks/links/) — it intercepts every `[text](url)` link Hugo renders from your Markdown content, site-wide, and applies the same `external_links` new-tab/exceptions rules (see [Header links](/navigation/header-links/)) that the theme's own hand-written partials use.

The practical effect: you never need to write `target="_blank" rel="noopener"` by hand in a blog post or page — every content-authored link gets consistent external-link behavior automatically, driven by one site-wide config block.

Sphinx has no direct equivalent — achieving the same thing there means an extension (e.g. something like `sphinx-external-links`) or manual per-link RST/MyST markup, not a global content-rendering hook.
