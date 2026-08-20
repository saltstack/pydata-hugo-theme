---
title: Sidebar navigation
---

The left sidebar nav tree is built from `site.Menus.sidebar` — falling back to `site.Menus.main` if no `sidebar` menu is defined — rendered by `sidebar-nav.html`. This site's own sidebar (see the left of this page) is built exactly this way; its `hugo.toml` defines `[[menus.sidebar]]` entries with `identifier`/`parent`/`weight` to create the grouped, collapsible tree you're looking at.

A top-level entry with an empty `url = ''` and an `identifier` renders as an expandable group header; entries that set `parent = "<identifier>"` nest underneath it.

```toml
[[menus.sidebar]]
  name       = 'Get started'
  identifier = 'get-started'
  url        = ''
  weight     = 10

[[menus.sidebar]]
  name   = 'Install'
  parent = 'get-started'
  url    = '/get-started/install/'
  weight = 10
```

`sidebar_nav_title` sets the heading shown above the tree (defaults to `site.Title` if unset).

## Not yet implemented

Upstream's `show_nav_level`, `navigation_depth`, and `collapse_navigation` options are declared in this module's `hugo.toml` defaults (carried over from the Sphinx `theme.conf`) but have no template logic behind them yet — the sidebar tree always renders fully expanded. See [Feature parity with upstream](/feature-parity/).
