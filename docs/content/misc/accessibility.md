---
title: Accessibility
---

General, framework-agnostic recommendations (adapted from upstream's guidance, which applies just as well here):

- **Color contrast** — if you override `--pst-*` color variables (see [Styling](/theming/styling/)), check contrast ratios against WCAG AA, especially for both light and dark mode.
- **Keyboard navigation** — the search dialog, theme switcher, and sidebar toggle are all keyboard-operable out of the box; if you add custom partials into any slot, keep them keyboard-accessible too.
- **Logo alt text** — always set `logo.alt_text` when using an image logo (see [Branding](/theming/branding/)) rather than relying on the fallback.
- **Sitemaps** — Hugo generates a `sitemap.xml` automatically for every build; no theme configuration or extension (unlike Sphinx's `sphinx_sitemap`) is needed.
