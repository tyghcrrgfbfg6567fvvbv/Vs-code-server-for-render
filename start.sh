#!/usr/bin/env bash
set -e

# Download latest code-server release (no sudo needed)
mkdir -p ~/.local/bin
curl -fsSL https://github.com/coder/code-server/releases/download/v4.103.1/code-server-4.103.1-linux-amd64.tar.gz -o code-server.tar.gz
tar -xzf code-server.tar.gz
mv code-server-4.103.1-linux-amd64 ~/.local/code-server

# Add to PATH
export PATH=$HOME/.local/code-server/bin:$PATH

# Start VS Code server
code-server --bind-addr 0.0.0.0:8080 --auth none .
