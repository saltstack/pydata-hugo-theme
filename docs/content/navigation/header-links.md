---
title: Header links
---

## External link behavior

Every content-authored Markdown link and most theme-rendered links pass through `link-target-attrs.html`, which decides whether a link opens in a new tab based on `external_links`:

```toml
[params.external_links]
  new_tab    = true
  exceptions = ['https://docs.example.com/']
```

A URL is treated as internal (no new tab) if it's not `http(s)`, points back at `site.BaseURL`, or matches a prefix in `exceptions`. This is applied automatically to every Markdown-authored link via a [render hook](/hugo-only/render-hooks/) — you don't need to add `target="_blank"` by hand anywhere in your content.

## Social / icon links

```toml
[params]
  github_url  = 'https://github.com/you/repo'
  gitlab_url  = ''
  twitter_url = ''

[[params.icon_links]]
  name = 'Discord'
  url  = 'https://discord.gg/...'
  icon = 'fa-brands fa-discord'
```

`github_url`/`gitlab_url`/`twitter_url` are shortcuts for the three most common icons; `icon_links` is a generic list of `{name, url, icon}` for anything else (any FontAwesome class works for `icon`). Both render in `navbar-icon-links.html`, wherever you place it in `navbar_start`/`navbar_end`/etc.

## Overflow into a "More" dropdown

`site.Menus.main` renders as top-nav links; once there are more than `header_links_before_dropdown` (default `5`) entries, the rest collapse into a dropdown labeled `header_dropdown_text` (default `'More'`):

```toml
[params]
  header_links_before_dropdown = 5
  header_dropdown_text         = 'More'
```

## Cross-project links

`cross_doc_links` renders a small nav linking to sibling sites for the same project (e.g. a docs site linking back to the main site, or vice versa). Opt in by adding `"header-links"` to `navbar_center` (or any other navbar slot):

```toml
[params]
  navbar_center = ["header-links"]

[[params.cross_doc_links]]
  name   = "Home"
  url    = "/"
  active = true
[[params.cross_doc_links]]
  name = "Docs"
  url  = "https://docs.example.com/"
```
