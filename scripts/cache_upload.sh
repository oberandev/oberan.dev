#!/bin/bash

set -euo pipefail

echo "--- Upload artifacts to cache"

echo ":nix: tarballs"
if [ -d ".nix-mix" ]; then
  buildkite-agent artifact download cache__nix_mix.tar.gz .
  tar -xzf cache__nix_mix.tar.gz .nix-mix
fi

echo ":elixir: tarballs"
if [ -f "mix.lock" ]; then
  buildkite-agent artifact download cache__deps.tar.gz .
  tar -xzf cache__deps.tar.gz deps
fi
if [ -d "_build" ]; then
  buildkite-agent artifact download cache__build.tar.gz .
  tar -xzf cache__build.tar.gz _build
fi

echo ":javascript: tarballs"
cd assets
if [ -f "yarn.lock" ] || [ -f "package-lock.json" ] || [ -f "pnpm-lock.yaml" ]; then
  buildkite-agent artifact download cache__node_modules.tar.gz .
  tar -xzf cache__node_modules.tar.gz node_modules
fi
cd ..
