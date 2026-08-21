set shell := ["bash", "-c"]

version := `git describe --tags --abbrev=7 2>/dev/null | sed 's/^v//' || echo "0.0.0-dev"`

# Default task lists all available tasks
default:
    @just --list

@_ensure-cog:
    #!/usr/bin/env bash
    if ! command -v cog &> /dev/null; then
        echo "'cog' is not installed. Please install cocogitto first."
        echo "See: https://github.com/cocogitto/cocogitto#installation"
        exit 1
    fi

# Install the FontAwesome/Bootstrap npm deps mounted via [[module.mounts]]
[group('dev')]
sync:
    @echo "npm ci"
    @npm ci

# Remove local build output
[group('dev')]
clean:
    rm -rf public docs/public exampleSite/public resources docs/resources exampleSite/resources

# Build this module's own docs/ site (dogfoods the theme via a local `replace => ../`)
[group('build')]
build-docs *args:
    @echo "hugo --minify (docs/)"
    @cd docs && hugo --minify {{ args }}

# Build exampleSite/ (dogfoods the theme via a local `replace => ../`)
[group('build')]
build-example *args:
    @echo "hugo --minify (exampleSite/)"
    @cd exampleSite && hugo --minify {{ args }}

# Build both docs/ and exampleSite/ -- the closest thing this repo has to a test suite
[group('test')]
test: sync build-docs build-example
    @echo "docs/ and exampleSite/ both built successfully"

# Lint shell scripts and Hugo templates for obvious syntax errors
[group('test')]
lint:
    @echo 'shellcheck via git ls-files (respects .gitignore)'
    @git ls-files -z -- '*.sh' | xargs -0 -r shellcheck --shell=bash
    @echo 'gofmt -l (this repo has no .go source files, but keep the check as a safety net)'
    @gofmt -l . || true

# Build the local dev container image (.devcontainer/Dockerfile)
[group('build')]
build-devcontainer *args:
    @if [ -z "${USE_CONTAINER_DEV:-}" ]; then \
        echo "USE_CONTAINER_DEV is not set. Set it to podman, docker, or container to build."; \
        exit 1; \
    fi
    ${USE_CONTAINER_DEV} build {{ args }} -t pydata-hugo-theme-dev -f .devcontainer/Dockerfile .

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
    @cog commit

# Verify that all commits from HEAD to the target branch (default: main) are valid
check target="main": _ensure-cog
    @echo "cog check {{ target }}..HEAD"
    @cog check {{ target }}..HEAD

# Check the history of the entire repository
check-all: _ensure-cog
    @echo "cog check"
    @cog check

# Generate an uncommitted preview of the changelog
changelog-preview: _ensure-cog
    @echo "cog changelog .."
    @cog changelog ..

# --- Release Management Workflow ---

# Automatically calculate the next version, update CHANGELOG.md, and create a git tag
bump: _ensure-cog
    @echo "cog bump --auto"
    @cog bump --auto

# Bump a specific semantic version (major, minor, or patch)
bump-manual type: _ensure-cog
    @echo "cog bump --{{ type }}"
    @cog bump --{{ type }}

# Drop the latest tag and undo the bump (useful for fixing release mistakes locally)
undo-bump:
    #!/usr/bin/env bash
    LATEST_TAG=$(git describe --tags --abbrev=0)
    echo "Undoing release $LATEST_TAG..."
    git tag -d "$LATEST_TAG"
    git reset --hard HEAD~1
    echo "SUCCESS: Bump undone."
