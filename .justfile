set shell := ["bash", "-c"]

version := `git describe --tags --abbrev=7 2>/dev/null | sed 's/^v//' || echo "0.0.0-dev"`
image := "localhost/pydata-hugo-theme-dev"
ENGINE := env_var_or_default("USE_CONTAINER_DEV", "")

# When USE_CONTAINER_DEV is set to podman/docker, wraps a command to run
# inside the devcontainer image instead of on the host (build it first with
# `just build-devcontainer`). Mounts the repo at /workspace. --userns=keep-id
# (podman only) maps container root to the host UID/GID, so files written
# into the bind-mounted repo aren't left root-owned.
wrapper := `
    if [ -n "${USE_CONTAINER_DEV:-}" ]; then
        case "${USE_CONTAINER_DEV}" in
            podman)
                echo "podman run --rm -it --userns=keep-id -v ${PWD}:/workspace -w /workspace localhost/pydata-hugo-theme-dev:latest bash -c '"
                ;;
            docker)
                echo "docker run --rm -it -v ${PWD}:/workspace -w /workspace localhost/pydata-hugo-theme-dev:latest bash -c '"
                ;;
            *)
                echo ""
                ;;
        esac
    else
        echo ""
    fi
`

# Suffix to close the bash quote if running in a container wrapper
suffix := `case "${USE_CONTAINER_DEV:-}" in podman|docker) echo "'" ;; *) echo "" ;; esac`

# Default task lists all available tasks
default:
    @just --list

@_ensure-cog:
    #!/usr/bin/env bash
    if [ -n "${USE_CONTAINER_DEV:-}" ]; then
        exit 0
    fi
    if ! command -v cog &> /dev/null; then
        echo "'cog' is not installed. Please install cocogitto first."
        echo "See: https://github.com/cocogitto/cocogitto#installation"
        exit 1
    fi

# Install the FontAwesome/Bootstrap npm deps mounted via [[module.mounts]]
[group('dev')]
sync:
    @echo "npm ci"
    @{{ wrapper }}npm ci{{ suffix }}

# Remove local build output
[group('dev')]
clean:
    rm -rf public docs/public exampleSite/public resources docs/resources exampleSite/resources

# Build this module's own docs/ site (dogfoods the theme via a local `replace => ../`)
[group('build')]
build-docs *args:
    @echo "hugo --minify (docs/)"
    @{{ wrapper }}cd docs && hugo --minify {{ args }}{{ suffix }}

# Build exampleSite/ (dogfoods the theme via a local `replace => ../`)
[group('build')]
build-example *args:
    @echo "hugo --minify (exampleSite/)"
    @{{ wrapper }}cd exampleSite && hugo --minify {{ args }}{{ suffix }}

# Build both docs/ and exampleSite/ -- the closest thing this repo has to a test suite
[group('test')]
test: sync build-docs build-example
    @echo "docs/ and exampleSite/ both built successfully"

# Lint shell scripts and Hugo templates for obvious syntax errors
[group('test')]
lint:
    @echo 'shellcheck via git ls-files (respects .gitignore)'
    @{{ wrapper }}git ls-files -z -- '*.sh' | xargs -0 -r shellcheck --shell=bash{{ suffix }}
    @echo 'gofmt -l (this repo has no .go source files, but keep the check as a safety net)'
    @{{ wrapper }}gofmt -l . || true{{ suffix }}

# Build the local dev container image (.devcontainer/Dockerfile)
[group('build')]
build-devcontainer *args:
    @if [ -z "{{ ENGINE }}" ]; then \
        echo "USE_CONTAINER_DEV is not set. Set it to podman or docker to build."; \
        exit 1; \
    fi
    {{ ENGINE }} build {{ args }} -t {{ image }} -f .devcontainer/Dockerfile .

# Drop into an interactive shell inside the devcontainer image (build it first with `just build-devcontainer`)
[group('dev')]
shell:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ -z "${USE_CONTAINER_DEV:-}" ]; then
        echo "USE_CONTAINER_DEV is not set. Set it to podman or docker to use this."
        exit 1
    fi
    EXTRA_ARGS=()
    if [ "${USE_CONTAINER_DEV}" = "podman" ]; then
        EXTRA_ARGS+=(--userns=keep-id)
    fi
    exec "${USE_CONTAINER_DEV}" run --rm -it "${EXTRA_ARGS[@]}" -v "${PWD}:/workspace" -w /workspace {{ image }} bash

# Set and enable pre-commit-style hooks in repo (conventional commit message validation)
[group('pre-commit')]
@enable-pre-commit:
    mkdir -p .git/hooks
    echo "Enabling conventional commit message validation with Cocogitto..."
    echo '#!/usr/bin/env bash' > .git/hooks/commit-msg
    echo '# Validate the commit message using Cocogitto' >> .git/hooks/commit-msg
    echo 'if ! command -v cog &> /dev/null; then' >> .git/hooks/commit-msg
    echo '  echo "WARNING: `cog` not found. Skipping commit validation."' >> .git/hooks/commit-msg
    echo '  exit 0' >> .git/hooks/commit-msg
    echo 'fi' >> .git/hooks/commit-msg
    echo 'cog verify --file "$1"' >> .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg
    echo "Commit-msg hook installed successfully!"

# Disable the commit-msg hook
[group('pre-commit')]
@disable-pre-commit:
    chmod u-x .git/hooks/commit-msg
    @echo "Commit-msg hook disabled."

# --- Cocogitto Local Developer Workflow ---

# Start the interactive commit wizard to create a conventional commit
commit: _ensure-cog
    @echo "cog commit"
    @{{ wrapper }}cog commit{{ suffix }}

# Verify that all commits from HEAD to the target branch (default: main) are valid
check target="main": _ensure-cog
    @echo "cog check {{ target }}..HEAD"
    @{{ wrapper }}cog check {{ target }}..HEAD{{ suffix }}

# Check the history of the entire repository
check-all: _ensure-cog
    @echo "cog check"
    @{{ wrapper }}cog check{{ suffix }}

# Generate an uncommitted preview of the changelog
changelog-preview: _ensure-cog
    @echo "cog changelog .."
    @{{ wrapper }}cog changelog ..{{ suffix }}

# Generate the changelog section for a specific tag (used by the release workflow)
changelog-at tag: _ensure-cog
    @echo "cog changelog --at {{ tag }}" >&2
    @{{ wrapper }}cog changelog --at {{ tag }}{{ suffix }}

# --- Release Management Workflow ---

# Automatically calculate the next version, update CHANGELOG.md, and create a git tag
bump: _ensure-cog
    @echo "cog bump --auto"
    @{{ wrapper }}cog bump --auto{{ suffix }}

# Bump a specific semantic version (major, minor, or patch)
bump-manual type: _ensure-cog
    @echo "cog bump --{{ type }}"
    @{{ wrapper }}cog bump --{{ type }}{{ suffix }}

# Drop the latest tag and undo the bump (useful for fixing release mistakes locally)
undo-bump:
    #!/usr/bin/env bash
    LATEST_TAG=$(git describe --tags --abbrev=0)
    echo "Undoing release $LATEST_TAG..."
    git tag -d "$LATEST_TAG"
    git reset --hard HEAD~1
    echo "SUCCESS: Bump undone."
