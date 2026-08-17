# pydata-hugo-theme

A [Hugo Module](https://gohugo.io/hugo-modules/) port of the [PyData Sphinx Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/) for use with static/documentation sites built with [Hugo](https://gohugo.io/).

## Credit / Attribution

This project is an **unofficial, community-maintained port** of the PyData Sphinx Theme's design, layout, and CSS to Hugo. It is not affiliated with, endorsed by, or maintained by the PyData team.

All credit for the original design, styling, and UX of this theme goes to the PyData Sphinx Theme authors and contributors:

- Website: https://pydata-sphinx-theme.readthedocs.io/en/stable/
- Source: https://github.com/pydata/pydata-sphinx-theme

Please refer to upstream for the canonical Sphinx implementation. This repository only reimplements the theme's templates and behavior for Hugo's templating system; the vendored CSS (`static/styles/pydata-sphinx-theme.css`) is adapted directly from the upstream project.

## Usage

Add this module to your site's `hugo.toml`:

```toml
[module]
  [[module.imports]]
    path = "github.com/saltstack/pydata-hugo-theme"
```

Then run:

```sh
hugo mod get github.com/saltstack/pydata-hugo-theme
npm install   # fetches FontAwesome / Bootstrap JS mounted by the module
```

See `exampleSite/` in this repository for a minimal working site, and the `[params]` defaults in `hugo.toml` for the full set of theme options (navbar/sidebar/footer slots, logo, search, icon links, etc.) that a consuming site can override.

## License

BSD 3-Clause. See [LICENSE](./LICENSE). As with the code itself, the license terms mirror the upstream PyData Sphinx Theme's BSD 3-Clause license.
