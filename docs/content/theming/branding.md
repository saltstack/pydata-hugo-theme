---
title: Branding
---

## Logo

```toml
[params.logo]
  text        = 'My Site'
  link        = '/'
  # image_light = 'images/logo-light.png'
  # image_dark  = 'images/logo-dark.png'
  alt_text    = 'My Site — Home'
```

- With no `image_light` set, `text` renders as a plain text brand link (falls back to `site.Title` if `text` is unset).
- With `image_light` set, the image is used instead; `image_dark` swaps in for dark mode (falls back to `image_light` if `image_dark` is unset). Text still renders alongside the image if `text` is explicitly set.
- `alt_text` sets the image's `alt` attribute (falls back to `"<site title> - Home"`).

This documentation site intentionally only sets `logo.text` and ships no sample logo image at all — this is an unofficial, unaffiliated port, so it deliberately avoids using (or even hotlinking) the original PyData Sphinx Theme's branding.

## Favicon

```toml
[params]
  favicon = 'images/favicon.png'
```

Path is relative to your site's `static/` directory, same as any other Hugo static asset reference.
