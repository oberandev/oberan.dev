#!/bin/bash

set -euo pipefail

echo "--- Download artifacts from cache"

echo ":nix: tarballs"
buildkite-agent artifcat download cache__nix_mix.tar.gz .
tar -xzf cache__nix_mix.tar.gz .nix-mix

echo ":elixir: tarballs"
buildkite-agent artifact download cache__build.tar.gz .
buildkite-agent artifact download cache__deps.tar.gz .
tar -xzf cache__build.tar.gz _build
tar -xzf cache__deps.tar.gz deps

echo ":javascript: tarballs"
cd assets
buildkite-agent artifact download cache__node_modules.tar.gz .
tar -xzf cache__node_modules.tar.gz node_modules
cd ..
