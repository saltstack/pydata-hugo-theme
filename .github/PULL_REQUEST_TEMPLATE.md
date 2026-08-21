## Summary

<!-- What does this PR change, and why? -->

## Type of change

- [ ] Bug fix
- [ ] New feature
- [ ] Documentation (`docs/content/`)
- [ ] CI / tooling
- [ ] Other (please describe)

## How was this tested?

- [ ] `just build-docs` and `just build-example` both build cleanly
- [ ] For a rendering/UI/JS change: verified in an actual browser, not just by inspecting generated HTML (several past bugs here were only visible after a real page load — icon rendering, search, the copy-to-clipboard button)
- [ ] For a subpath-related change: verified under a non-root `baseURL`, not just `hugo server` at `localhost`

## Checklist

- [ ] Commits follow [Conventional Commits](https://www.conventionalcommits.org/) (`just check` passes locally)
- [ ] I did **not** touch `CHANGELOG.md` — it's only ever written by `cog bump` at release time
- [ ] If this ports an upstream [PyData Sphinx Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/) feature, I noted which upstream version introduced it
- [ ] If this is a Hugo-only feature (no upstream equivalent), I added/updated docs under `docs/content/hugo-only/`
- [ ] I updated `docs/content/feature-parity.md` if this changes what is/isn't implemented relative to upstream

## Related issues

<!-- Closes #123, relates to #456 -->
