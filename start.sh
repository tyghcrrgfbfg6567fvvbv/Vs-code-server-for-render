#!/usr/bin/env bash
set -e

# Ensure local bin exists in PATH
export PATH="$HOME/.local/bin:$PATH"

# Install code-server if not found
if ! command -v code-server &>/dev/null; then
  echo "[INFO] code-server not found, installing..."
  curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=$HOME/.local
fi

# Ensure workspace directory exists
mkdir -p /workspace

# Default password if not set in Render ENV
PASSWORD=${PASSWORD:-mysecret}

echo "[INFO] Starting code-server on port ${PORT:-10000} ..."
exec "$HOME/.local/bin/code-server" \
  --bind-addr 0.0.0.0:${PORT:-10000} \
  --auth password \
  --disable-telemetry \
  --disable-update-check \
  /workspace
