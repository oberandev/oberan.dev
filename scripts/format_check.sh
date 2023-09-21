#!/bin/bash

set -euo pipefail

echo "--- Formatter checks"

echo ":elixir:"
nix-shell --run "MIX_ENV=test mix format --check-formatted"

echo ":prettier:"
nix-shell --run "make format-js-check"
