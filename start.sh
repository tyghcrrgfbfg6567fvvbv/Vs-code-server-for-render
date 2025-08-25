#!/usr/bin/env bash
set -e

PASSWORD=${PASSWORD:-mysecret}

# Run code-server
exec code-server \
  --bind-addr 0.0.0.0:${PORT:-10000} \
  --auth password \
  --disable-telemetry \
  --disable-update-check \
  /workspace
