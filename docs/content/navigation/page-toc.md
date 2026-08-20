---
title: Page table of contents
---

The right sidebar renders `secondary_sidebar_items` (default `['page-toc']`, which renders `.TableOfContents` from your Markdown headings via `page-toc.html`).

```toml
[params]
  secondary_sidebar_items = ['page-toc']
```

## Hiding it on a single page

Set `show_toc: false` in a page's frontmatter to hide the entire right sidebar for that page (it isn't just the TOC — the whole `secondary_sidebar_items` slot is skipped):

```yaml
---
title: A wide page with no right sidebar
show_toc: false
---
```

This is a Hugo-idiomatic per-page override — see [Per-page overrides](/hugo-only/page-overrides/) for how the fallback chain (page → site → hardcoded default) works generally.
