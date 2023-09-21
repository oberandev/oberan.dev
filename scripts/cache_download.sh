#!/bin/bash

set -euo pipefail

echo "--- Download artifacts from cache"

echo ":elixir: tarballs"
buildkite-agent artifact download pkg/cache__build.tar.gz
buildkite-agent artifact download pkg/cache__deps.tar.gz
tar -xzvf cache__build.tar.gz _build
tar -xzvf cache__deps_modules.tar.gz deps

echo ":javascript: tarballs"
cd assets
buildkite-agent artifact download pkg/cache__node_modules.tar.gz
tar -xzvf cache__node_modules.tar.gz node_modules
