---
name: Bug Report
about: Report a bug or unexpected behavior in the theme
title: "[BUG] "
labels: bug
assignees: ""
---

## Summary

A clear and concise description of the bug.

## Environment

- **pydata-hugo-theme version/commit**: (the `v*` tag, or commit SHA if using a local `replace`)
- **Hugo version**: (run `hugo version` — must be the `extended` build)
- **Deployment**: (site root, or a subpath like GitHub Pages project sites — several past bugs only reproduced under a subpath baseURL)
- **Browser(s)**: (if this is a rendering/UI/JS bug — several past bugs only showed up in one browser, e.g. Chromium vs Firefox)

## Steps to Reproduce

1. Site config (relevant `hugo.toml`/`[params]` snippet)
2. Command run (`hugo`, `hugo server`, `hugo --minify --baseURL ...`)
3. Page/action that triggers the bug

If possible, reproduce against `exampleSite/` in this repo (`cd exampleSite && hugo server`) and note what you changed from its defaults — that's the fastest way for a maintainer to confirm the bug.

## Observed Behavior

What actually happened. Include a screenshot for visual/rendering bugs.

## Expected Behavior

What you expected to happen instead.

## Logs (optional)

```text
# Paste any relevant Hugo build errors/warnings, or browser console errors, here.
```

## Additional Context (optional)

Any other context (e.g., this worked in a previous tag, only happens with certain `[params]` set, only happens under a specific baseURL/subpath).
