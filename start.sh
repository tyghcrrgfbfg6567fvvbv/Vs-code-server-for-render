#!/usr/bin/env bash
set -e

# Download prebuilt binary
mkdir -p ~/.local/bin
curl -fsSL https://github.com/coder/code-server/releases/download/v4.103.1/code-server-4.103.1-linux-amd64.tar.gz -o code-server.tar.gz
tar -xzf code-server.tar.gz
mv code-server-4.103.1-linux-amd64 ~/.local/code-server

# Add to PATH
export PATH=$HOME/.local/code-server/bin:$PATH

# Run code-server with correct flags for Render
exec code-server \
  --bind-addr 0.0.0.0:10000 \   # Render expects port 10000
  --auth none \                 # Disable login (Render already has auth layer)
  --disable-telemetry \
  --disable-update-check \
  --disable-getting-started-override \
  .
