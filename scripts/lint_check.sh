#!/bin/bash

set -euo pipefail

echo "--- Linter checks"

echo ":credo:"
nix-shell --run "make lint-ex"

echo ":eslint:"
nix-shell --run "make lint-js"
