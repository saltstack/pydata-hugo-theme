---
title: Styling
---

## CSS custom properties

The vendored `static/styles/pydata-sphinx-theme.css` exposes the same `--pst-*` CSS custom properties as the upstream theme (colors, fonts, spacing, sidebar widths, etc.). Override them in your own stylesheet:

```css
:root {
  --pst-color-primary: #123456;
}
```

## Adding your own stylesheet

```toml
[params]
  extra_css = ['/css/custom.css']
```

`extra_css` is this theme's equivalent of Sphinx's `html_css_files` — a list of stylesheet paths or full URLs, injected after the theme's own CSS (so your rules can override theme defaults without `!important`).

## Syntax highlighting

Unlike upstream's `pygments_light_style`/`pygments_dark_style` options, this port has no dedicated syntax-highlighting param. Hugo renders code blocks with its own built-in [Chroma](https://gohugo.io/getting-started/configuration-markup/#highlight) highlighter, configured at the **site** level (in your `hugo.toml`'s `[markup.highlight]`), not through a theme param — that configuration is a Hugo concern independent of this theme.
