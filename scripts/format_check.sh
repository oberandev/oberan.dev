#!/bin/bash

set -euo pipefail

echo "--- Formatter checks"

echo ":elixir:"
nix-shell --run "make format-ex-check"

echo ":prettier:"
nix-shell --run "make format-js-check"
