---
title: Search
---

Search is powered by [Fuse.js](https://www.fusejs.io/) against a build-time JSON index (`layouts/index.json`), fetched client-side — not a Sphinx-style server-generated `searchindex.js`.

```toml
[params]
  disable_search  = false
  search_bar_text = 'Search the docs ...'
```

Set `disable_search = true` to skip loading the search JS/index entirely and hide the search button.

## Placement

The search trigger defaults to `navbar_persistent = ['search-button-field']`, which keeps it visible even when the navbar collapses on mobile. Swap in `search-button.html` instead for an icon-only trigger, or move it into any other navbar slot.

## Keyboard shortcut

`Ctrl`/`Cmd` + `K` opens the search dialog from anywhere on the site — implemented directly in this port's own `static/scripts/search.js` (not inherited from the Sphinx-side search bundle).
