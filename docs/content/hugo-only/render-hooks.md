---
title: Markdown render hooks
---

`layouts/_default/_markup/render-link.html` is a Hugo [render hook](https://gohugo.io/render-hooks/links/) — it intercepts every `[text](url)` link Hugo renders from your Markdown content, site-wide, and applies the same `external_links` new-tab/exceptions rules (see [Header links](/navigation/header-links/)) that the theme's own hand-written partials use.

The practical effect: you never need to write `target="_blank" rel="noopener"` by hand in a blog post or page — every content-authored link gets consistent external-link behavior automatically, driven by one site-wide config block.

Sphinx has no direct equivalent — achieving the same thing there means an extension (e.g. something like `sphinx-external-links`) or manual per-link RST/MyST markup, not a global content-rendering hook.

## Copy-to-clipboard on code blocks

`layouts/_default/_markup/render-codeblock.html` is a [codeblock render hook](https://gohugo.io/render-hooks/code-blocks/) — it wraps every fenced code block's highlighted output in a `.highlight-wrapper` container alongside a copy button, so every fenced code block in your content gets a copy-to-clipboard button with no per-post markup needed, matching the `sphinx-copybutton` UX from the real Sphinx theme.

Hovering a code block reveals a small clipboard button in its top-right corner; clicking it copies the block's text to the clipboard and briefly swaps the icon to a checkmark. The click handler lives in `static/scripts/pydata-sphinx-theme.js`, and the hover/positioning/copied-state styles live in `static/styles/hugo-pydata.css`.

To opt a site out entirely, override `layouts/_default/_markup/render-codeblock.html` in your own site with a template that just calls `transform.HighlightCodeBlock` and returns `.Wrapped` unwrapped.
