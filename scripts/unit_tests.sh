#!/bin/bash

set -euo pipefail

echo "--- Unit Tests"

nix-shell --run "make test-ex"
