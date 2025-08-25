#!/usr/bin/env bash
set -e

# Ensure PATH includes code-server
export PATH="$HOME/.local/bin:$PATH"

PASSWORD=${PASSWORD:-mysecret}

exec code-server \
  --bind-addr 0.0.0.0:${PORT:-10000} \
  --auth password \
  --disable-telemetry \
  --disable-update-check \
  /workspace
