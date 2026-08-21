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

`show_toc` (see [Page table of contents](/navigation/page-toc/)) overrides `secondary_sidebar_items` for just that page, without touching the site-wide default. `show_prev_next` works the same way, overriding the site-wide `show_prev_next` param (default `true`) to hide (or show) the prev/next footer links on a single page — useful for standalone pages like an event calendar or an RSS feed list, where "previous/next page in section" links don't make sense:

```yaml
---
title: Event Calendar
show_prev_next: false
---
```

This pattern is generally available to any partial you write yourself, too: read `.Params.<key>` first, fall back to `site.Params.<key>`, then a hardcoded default — the same three-tier resolution the theme's own partials use throughout.
