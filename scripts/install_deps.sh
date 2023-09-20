#!/bin/bash

set -euo pipefail

echo "--- Install project dependencies"

nix-shell --run "mix local.hex --force"

echo ":elixir: Elixir deps"
nix-shell --run "make deps-ex"

echo ":yarn: Javascript deps"
nix-shell --run "make deps-js"
