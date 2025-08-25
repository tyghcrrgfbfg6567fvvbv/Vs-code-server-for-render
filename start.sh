#!/usr/bin/env bash
set -e

# Download and extract code-server if not already present
if [ ! -d "$HOME/.local/code-server" ]; then
  mkdir -p ~/.local/bin
  curl -fsSL https://github.com/coder/code-server/releases/download/v4.103.1/code-server-4.103.1-linux-amd64.tar.gz -o code-server.tar.gz
  tar -xzf code-server.tar.gz
  mv code-server-4.103.1-linux-amd64 ~/.local/code-server
fi

export PATH=$HOME/.local/code-server/bin:$PATH

# Render gives us $PORT automatically (default 10000)
exec code-server \
  --bind-addr 0.0.0.0:${PORT:-10000} \
  --auth PASSWORD \
  --disable-telemetry \
  --disable-update-check \
  .
