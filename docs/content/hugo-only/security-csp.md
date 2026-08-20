---
title: Content-Security-Policy
---

`head.html` emits a `<meta http-equiv="Content-Security-Policy">` tag on every page, with `script-src` already covering the CDNs the theme's own search feature needs (cdnjs for FontAwesome, jsdelivr for Fuse.js). If your site embeds a third-party iframe (a calendar widget, a video embed, etc.), extend `frame-src` via:

```toml
[params]
  csp_frame_src = ['https://calendar.google.com']
```

`'self'` is always included automatically — you only need to list additional origins. Upstream Sphinx docs don't ship a CSP meta tag at all; this is engineering specific to this port.
