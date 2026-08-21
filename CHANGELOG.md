# Changelog

All notable changes to this project will be documented in this file. See [conventionalcommits.org](https://www.conventionalcommits.org/) for commit guidelines.

## Unreleased ([6f3e675..dafe4ac](https://github.com/saltstack/pydata-hugo-theme/compare/6f3e675..dafe4ac))
#### Features
- add devcontainer for theme development - ([49ebd88](https://github.com/saltstack/pydata-hugo-theme/commit/49ebd88cf684d18ed7fbdd203704a12634046092))
- add justfile for common dev tasks - ([d2b516a](https://github.com/saltstack/pydata-hugo-theme/commit/d2b516abb75460c58e4ab55f2d70d859dbe66981))
- adopt Cocogitto for conventional-commit versioning and changelogs - ([e9721ce](https://github.com/saltstack/pydata-hugo-theme/commit/e9721cea459947061eb24fc2eb2f0497dc9740e1))
- add copy-to-clipboard button on code blocks - ([7376435](https://github.com/saltstack/pydata-hugo-theme/commit/7376435d0f013fb88af5b162c21cd9cbbf99f135))
- add documentation site, show_title param, and docs deploy CI - ([cac64bb](https://github.com/saltstack/pydata-hugo-theme/commit/cac64bb507d971d5ba2119222db4eeb33541a6b2))
#### Bug Fixes
- (**changelog**) attribute commits by GitHub username, not name - ([dafe4ac](https://github.com/saltstack/pydata-hugo-theme/commit/dafe4ac88b499da62516ee18457707eca1d383f6))
- (**devcontainer**) pin Node.js version via a root .node-version file - ([49411f2](https://github.com/saltstack/pydata-hugo-theme/commit/49411f276818cc8e80a00fc78000e91d7aa4589a))
- make search work when the docs site is deployed under a subpath - ([a104902](https://github.com/saltstack/pydata-hugo-theme/commit/a1049028aa3c256cb6ffcfbc90d533af4cb8689b))
- remove duplicate GitHub icon/nav entry from docs config - ([920a6ee](https://github.com/saltstack/pydata-hugo-theme/commit/920a6ee212b36cb63f5d4bbf6c4eb785070ffef8))
- render breadcrumb separator and external-link icons as real elements - ([94cee81](https://github.com/saltstack/pydata-hugo-theme/commit/94cee81c0c81ac850975ddb32460ad675aa6484b))
- resolve navbar/sidebar/breadcrumb home links under a baseURL subpath - ([0c0c8d1](https://github.com/saltstack/pydata-hugo-theme/commit/0c0c8d1a97ec54a2c61bcc2a50afc0e255d6f182))
#### Documentation
- add CONTRIBUTING.md and record the upstream reference version - ([15e1559](https://github.com/saltstack/pydata-hugo-theme/commit/15e1559e80d1d5cace975c1044858a23b5ca9ee2))
- correct feature-parity table and document search/icon_links gotchas - ([b828ccf](https://github.com/saltstack/pydata-hugo-theme/commit/b828ccffa99722af74fc0c043c663cb12e762ef6))
#### Continuous Integration
- publish a GitHub Release when a version tag is pushed - ([f87b7d3](https://github.com/saltstack/pydata-hugo-theme/commit/f87b7d36b9eaec5aedf70977ec5da381bef573bb))
- validate conventional commits and Hugo builds on every PR - ([3a4cbda](https://github.com/saltstack/pydata-hugo-theme/commit/3a4cbda48d9156abd08db6b7bf55024d6c5f7558))
#### Refactoring
- (**devcontainer**) install Node.js via nvm instead of NodeSource - ([eefa08e](https://github.com/saltstack/pydata-hugo-theme/commit/eefa08e2683dc7d5382ffd7f060723d17e1df81c))

- - -

## [v0.1.0](https://github.com/saltstack/pydata-hugo-theme/compare/4e4772790f484c0990106e6e8ceef25dd063cc94..v0.1.0) - 2026-08-17
#### Features
- initial extraction of pydata Hugo theme as a standalone Hugo module - ([4e47727](https://github.com/saltstack/pydata-hugo-theme/commit/4e4772790f484c0990106e6e8ceef25dd063cc94))
#### Bug Fixes
- remove stale themes/pydata path reference from LICENSE - ([6f3e675](https://github.com/saltstack/pydata-hugo-theme/commit/6f3e675676043bbb9228ccabf89914972461b989))
#### Documentation
- document optional vendoring workflow in README - ([ee9ca17](https://github.com/saltstack/pydata-hugo-theme/commit/ee9ca178713a67accd4165f9b2bec47a8c0047e0))


