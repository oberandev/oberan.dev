#!/bin/bash

set -euo pipefail

echo "--- Linter checks"

echo ":credo:"
nix-shell --run "MIX_ENV=test mix credo"

echo ":eslint:"
nix-shell --run "make lint-js"
