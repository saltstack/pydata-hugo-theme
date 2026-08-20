---
title: Light / dark mode
---

```toml
[params]
  default_mode = 'auto'  # 'light' | 'dark' | 'auto'
```

`auto` follows the visitor's OS/browser color-scheme preference. The mode is read/written to `localStorage` client-side, so a visitor's explicit choice persists across pages and future visits.

## The theme switcher

`theme-switcher.html` renders a dropdown (light/dark/system) — it's in `navbar_end` by default. Remove it from your navbar slots to hide the control entirely (visitors then always get whatever `default_mode` resolves to):

```toml
[params]
  navbar_end = ['navbar-icon-links']  # theme-switcher removed
```

## Theme-conditional images

Use the `only-light`/`only-dark` CSS classes (from the vendored theme CSS) on any image to show/hide it based on the active mode — the same mechanism the logo partial uses for `image_light`/`image_dark`.
