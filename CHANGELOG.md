# Changelog

All notable changes to this project will be documented in this file. See [conventionalcommits.org](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## [v0.4.0](https://github.com/saltstack/pydata-hugo-theme/compare/23de276262a025eb01221c24f3e8fa020fab825f..v0.4.0) - 2026-08-21
#### Features
- allow show_prev_next to be overridden per-page in frontmatter - ([23de276](https://github.com/saltstack/pydata-hugo-theme/commit/23de276262a025eb01221c24f3e8fa020fab825f))

- - -

## [v0.3.0](https://github.com/saltstack/pydata-hugo-theme/compare/e748eab0a1646c12705dd8f3790b441ddb1e0297..v0.3.0) - 2026-08-21
#### Features
- rebrand default footer credit line, make its text overridable - ([a563d49](https://github.com/saltstack/pydata-hugo-theme/commit/a563d49c124949c2ceacee594bed61c4c1c60ba8))
#### Documentation
- document the cold-cache vendoring gotcha for npm-mounted deps - ([e748eab](https://github.com/saltstack/pydata-hugo-theme/commit/e748eab0a1646c12705dd8f3790b441ddb1e0297))

- - -

## [v0.2.0](https://github.com/saltstack/pydata-hugo-theme/compare/cac64bb507d971d5ba2119222db4eeb33541a6b2..v0.2.0) - 2026-08-21
#### Features
- (**justfile**) add container shell + optional container execution - ([65659b5](https://github.com/saltstack/pydata-hugo-theme/commit/65659b5ac9a79ef7619d8e2c32d99cf050196b1e))
- add GitHub issue and pull request templates - ([19e9889](https://github.com/saltstack/pydata-hugo-theme/commit/19e9889b41376eeaf18a20e2d51607fb9afcfdab))
- add devcontainer for theme development - ([49ebd88](https://github.com/saltstack/pydata-hugo-theme/commit/49ebd88cf684d18ed7fbdd203704a12634046092))
- add justfile for common dev tasks - ([d2b516a](https://github.com/saltstack/pydata-hugo-theme/commit/d2b516abb75460c58e4ab55f2d70d859dbe66981))
- adopt Cocogitto for conventional-commit versioning and changelogs - ([e9721ce](https://github.com/saltstack/pydata-hugo-theme/commit/e9721cea459947061eb24fc2eb2f0497dc9740e1))
- add copy-to-clipboard button on code blocks - ([7376435](https://github.com/saltstack/pydata-hugo-theme/commit/7376435d0f013fb88af5b162c21cd9cbbf99f135))
- add documentation site, show_title param, and docs deploy CI - ([cac64bb](https://github.com/saltstack/pydata-hugo-theme/commit/cac64bb507d971d5ba2119222db4eeb33541a6b2))
#### Bug Fixes
- (**changelog**) restore the '- - -' separator cog needs to bump - ([57ec36a](https://github.com/saltstack/pydata-hugo-theme/commit/57ec36a293f46e2695c7ffe9b19b69b73859fbaa))
- (**changelog**) stop committing an Unreleased section between releases - ([a17c870](https://github.com/saltstack/pydata-hugo-theme/commit/a17c87043b0e1c20555988137a5665ee8bda282b))
- (**changelog**) remove author attribution entirely - ([7dac7d7](https://github.com/saltstack/pydata-hugo-theme/commit/7dac7d70ff93b5e2ed00f939c04b13be19b640f7))
- (**changelog**) attribute commits by GitHub username, not name - ([dafe4ac](https://github.com/saltstack/pydata-hugo-theme/commit/dafe4ac88b499da62516ee18457707eca1d383f6))
- (**ci**) use just recipes in GHA workflows, fix cog install permission bug - ([799e6d6](https://github.com/saltstack/pydata-hugo-theme/commit/799e6d67c7ee299d41dcf63a045515e2227f10e8))
- (**devcontainer**) set build context to repo root - ([2b812fd](https://github.com/saltstack/pydata-hugo-theme/commit/2b812fd00f0ec3873682610c0d001afe519554e9))
- (**devcontainer**) put cog on PATH via ENV, not a .bashrc append - ([6b10e82](https://github.com/saltstack/pydata-hugo-theme/commit/6b10e82967dedba04fbc37ce971c4868f6043f75))
- (**devcontainer**) pin Node.js version via a root .node-version file - ([49411f2](https://github.com/saltstack/pydata-hugo-theme/commit/49411f276818cc8e80a00fc78000e91d7aa4589a))
- (**justfile**) drop podman --userns=keep-id, it breaks root access - ([b24e48e](https://github.com/saltstack/pydata-hugo-theme/commit/b24e48e89b8fbec035480cc4c9a41bec27fb17c4))
- (**justfile**) drop container engine alias, support only docker/podman - ([ff5ea4e](https://github.com/saltstack/pydata-hugo-theme/commit/ff5ea4e3e82bb9c8e970e5a35e65cf5b28296e2e))
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


