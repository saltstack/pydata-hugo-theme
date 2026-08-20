---
title: Layout
---

The theme renders a page as a set of named "slots" — each a list of partial names, resolved via `site.Params.*` — rather than a single fixed template. Override just the slot lists you care about; everything else falls back to the theme's defaults.

## Page title

| Param | Default | Effect |
|---|---|---|
| `show_title` | `true` | Auto-renders `<h1>{{ .Title }}</h1>` before the page content |

Resolved page frontmatter → `site.Params` → hardcoded default, same as other overridable params. To omit the auto-rendered heading on a single page (e.g. because the Markdown body already starts with its own `#` heading), set `show_title: false` in that page's frontmatter. To change the site-wide default, set `show_title = false` under `[params]` in `hugo.toml`.

## Header (navbar)

Four slots compose the top navbar, rendered by `header.html`:

| Param | Default | Renders |
|---|---|---|
| `navbar_start` | `['navbar-logo']` | Left side of the navbar |
| `navbar_center` | `['navbar-nav']` | Center — typically your main menu |
| `navbar_end` | `['theme-switcher', 'navbar-icon-links']` | Right side |
| `navbar_persistent` | `['search-button-field']` | Stays visible even when the navbar collapses on mobile |

## Article header and footer

| Param | Default | Renders |
|---|---|---|
| `article_header_start` | `['breadcrumbs']` | Above the article content |
| `article_header_end` | `[]` | Above the article content, after `article_header_start` |
| `article_footer_items` | `['last-updated']` | Below the article content |
| `content_footer_items` | `[]` | Below the article, but still inside `<main>` |

## Sidebars

| Param | Default | Renders |
|---|---|---|
| `secondary_sidebar_items` | `['page-toc']` | Right sidebar (see [Page table of contents](/navigation/page-toc/)) |
| `primary_sidebar_end` | `[]` | Bottom of the left sidebar, below the nav tree |

## Page-wide footer

| Param | Default | Renders |
|---|---|---|
| `footer_start` | `['copyright']` | Left column |
| `footer_center` | `[]` | Center column |
| `footer_end` | `['theme-version']` | Right column |

Every slot value is a list of partial names (without the `.html` extension or path prefix) — set it to `[]` to render nothing, or list your own site-level partials to replace/extend the default.
