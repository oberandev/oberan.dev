#!/bin/bash

set -euo pipefail

nix-shell --run "make test-ex"
