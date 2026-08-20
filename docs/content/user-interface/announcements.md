---
title: Announcements
---

`announcement` shows a dismissible-looking banner above the navbar. Two modes, chosen automatically by the value:

```toml
[params]
  # Static: rendered as-is (raw HTML allowed)
  announcement = "See what's new in <a href=\"/blog/\">the changelog</a>."

  # Remote: any value starting with "http" is treated as a URL to fetch
  # the banner's HTML content from at runtime instead
  announcement = 'https://example.com/announcement.html'
```

Leave it unset (the default) to disable the banner entirely.

## Sticky banner + navbar

```toml
[params]
  sticky_banners = false
```

When `true`, the announcement banner and navbar are wrapped together in a sticky-positioned container that stays pinned as the page scrolls, instead of scrolling away with the content.
