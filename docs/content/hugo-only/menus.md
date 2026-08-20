---
title: Menus
---

Sphinx derives navigation from the doc tree (`toctree` directives) — there's no separately configured menu structure. This port instead uses two independent Hugo menus:

- **`site.Menus.main`** — top navbar links (rendered by `navbar-nav.html`), with automatic overflow into a "More" dropdown past `header_links_before_dropdown` entries (see [Header links](/navigation/header-links/)).
- **`site.Menus.sidebar`** — the left sidebar nav tree (rendered by `sidebar-nav.html`, see [Sidebar navigation](/navigation/navigation/)), falling back to `site.Menus.main` if you don't define one.

Because they're independent, your top nav and sidebar nav don't have to mirror each other — a common pattern (used by this docs site itself) is a short `main` menu (just "Docs" + "GitHub") alongside a much deeper `sidebar` menu for in-page navigation.

Both are just standard Hugo menus (`[[menus.main]]` / `[[menus.sidebar]]` in `hugo.toml`, or `menu:` frontmatter on content pages) — nothing theme-specific about how you populate them, only in how the theme chooses to render them.
