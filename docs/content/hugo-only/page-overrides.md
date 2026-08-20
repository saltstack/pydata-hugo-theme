---
title: Per-page overrides
---

Several slot/behavior params can be overridden on a single page via frontmatter, resolved through a page → site → hardcoded-default fallback chain (`.Params.x | default (site.Params.x | default fallback)`):

```yaml
---
title: A page with no right sidebar
show_toc: false
---
```

Currently `show_toc` is the main example (see [Page table of contents](/navigation/page-toc/)) — it overrides `secondary_sidebar_items` for just that page, without touching the site-wide default.

This pattern is generally available to any partial you write yourself, too: read `.Params.<key>` first, fall back to `site.Params.<key>`, then a hardcoded default — the same three-tier resolution the theme's own partials use throughout.
