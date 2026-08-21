FROM golang:1.27-trixie

# curl: general use
# just: for running this repo's dev tasks
# shellcheck: for scripts/*.sh validation
# ripgrep: improved grep, useful for editor/agent tooling
# vim: for being able to edit files within the container
RUN apt-get update && apt-get install -y curl just shellcheck ripgrep vim \
    && rm -rf /var/lib/apt/lists/*

# Install Hugo (extended), pinned via the root .hugo-version file
COPY .hugo-version /tmp/.hugo-version
RUN HUGO_VERSION="$(cat /tmp/.hugo-version)" \
    && curl -fsSL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb" -o /tmp/hugo.deb \
    && dpkg -i /tmp/hugo.deb \
    && rm /tmp/hugo.deb /tmp/.hugo-version

# Install Node.js via nvm, needed to `npm ci` the FontAwesome/Bootstrap
# build-time deps mounted into the theme via [[module.mounts]] in
# hugo.toml. Version pinned via the root .node-version file, same
# single-source-of-truth pattern as .hugo-version -- CI's actions/setup-node
# reads the same file, so the devcontainer and GitHub Actions never drift
# apart.
ENV NVM_DIR=/root/.nvm
COPY .devcontainer/nvm-version /tmp/nvm-version
RUN NVM_VERSION="$(cat /tmp/nvm-version)" \
    && curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash \
    && rm /tmp/nvm-version
COPY .node-version /tmp/.node-version
RUN . "$NVM_DIR/nvm.sh" \
    && NODE_VERSION="$(cat /tmp/.node-version)" \
    && nvm install "$NODE_VERSION" \
    && nvm alias default "$NODE_VERSION" \
    && ln -sf "$(nvm which "$NODE_VERSION")" /usr/local/bin/node \
    && ln -sf "$(dirname "$(nvm which "$NODE_VERSION")")/npm" /usr/local/bin/npm \
    && ln -sf "$(dirname "$(nvm which "$NODE_VERSION")")/npx" /usr/local/bin/npx \
    && rm /tmp/.node-version
# nvm's own install.sh already appended the sourcing lines needed for
# interactive shells to /root/.bashrc; the /usr/local/bin symlinks above
# cover non-interactive shells (postCreateCommand, RUN steps, etc).

# Install Cocogitto (conventional commit tooling)
COPY .devcontainer/cog-version /tmp/cog-version
RUN COG_VERSION=$(cat /tmp/cog-version) && \
    curl -fSsL "https://github.com/cocogitto/cocogitto/releases/download/${COG_VERSION}/cocogitto-${COG_VERSION}-x86_64-unknown-linux-musl.tar.gz" -o /tmp/cog.tar.gz && \
    mkdir -p /root/.local/bin && \
    tar -xvf /tmp/cog.tar.gz -C /root/.local/bin/ --strip-components=1 x86_64-unknown-linux-musl/cog && \
    rm /tmp/cog-version /tmp/cog.tar.gz

# Install GitHub CLI
RUN (type -p wget >/dev/null || (apt update && apt install wget -y)) \
	&& mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y \
	&& rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH="/root/.local/bin:$PATH"' >> /root/.bashrc

WORKDIR /workspace
