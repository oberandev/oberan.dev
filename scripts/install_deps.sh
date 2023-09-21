#!/bin/bash

set -euo pipefail

echo "--- Install project dependencies"

echo ":elixir: Elixir deps"
nix-shell --run "mix deps.get"
nix-shell --run "mix compile"

echo ":yarn: Javascript deps"
nix-shell --run "cd assets && yarn && cd .."
