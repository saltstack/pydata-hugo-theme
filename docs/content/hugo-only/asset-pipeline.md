---
title: Asset pipeline
---

The FontAwesome and Bootstrap JS mounted via `[[module.mounts]]` (see [Hugo Modules](/hugo-only/hugo-modules/)) are loaded through [Hugo Pipes](https://gohugo.io/hugo-pipes/introduction/), not referenced as plain static `<script src>` tags:

```go-html-template
{{- with resources.Get "vendor/fontawesome/all.min.js" }}
  {{- if hugo.IsDevelopment }}
    <script src="{{ .RelPermalink }}" defer></script>
  {{- else }}
    {{- with . | fingerprint }}
      <script src="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous" defer></script>
    {{- end }}
  {{- end }}
{{- end }}
```

In development builds, the file is served as-is for fast rebuilds. In production builds (`hugo --minify`, or whenever `hugo.IsDevelopment` is false), it's fingerprinted — Hugo computes a content hash, appends it to the URL for cache-busting, and adds a Subresource Integrity (`integrity`) attribute the browser verifies before executing the script. Sphinx has no equivalent — static files there are referenced as-is, with no build-time hashing or integrity verification.
