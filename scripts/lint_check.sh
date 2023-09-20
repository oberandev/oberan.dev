#!/bin/bash

set -euo pipefail

echo "--- Linter checks"

echo ":credo:"
nix-shell --run "make lint-ex"

echo ":eslint:"
nix-shell --run "make lint-js"

echo "ensure clean"
nix-shell --pure --run "git status --porcelain; test -z '$(git status --porcelain)'"

