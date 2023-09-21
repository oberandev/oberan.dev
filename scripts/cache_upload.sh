#!/bin/bash

set -euo pipefail

echo "--- Upload artifacts to cache"

echo ":nix: tarballs"
if [ -d ".nix-mix" ]; then
  tar -czf cache__nix_mix.tar.gz .nix-mix
  buildkite-agent artifact upload cache__nix_mix.tar.gz
fi

echo ":elixir: tarballs"
if [ -f "mix.lock" ]; then
  tar -czf cache__deps.tar.gz deps
  buildkite-agent artifact upload cache__deps.tar.gz
fi
if [ -d "_build" ]; then
  tar -czf cache__build.tar.gz _build
  buildkite-agent artifact upload cache__build.tar.gz
fi

echo ":javascript: tarballs"
cd assets
if [ -f "yarn.lock" ] || [ -f "package-lock.json" ] || [ -f "pnpm-lock.yaml" ]; then
  tar -czf cache__node_modules.tar.gz node_modules
  buildkite-agent artifact upload cache__node_modules.tar.gz
fi
cd ..
