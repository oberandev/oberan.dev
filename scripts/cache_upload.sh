#!/bin/bash

set -euo pipefail

echo "--- Upload artifacts to cache"

echo ":elixir: tarballs"
tar -czf cache__build.tar.gz _build
tar -czf cache__deps_modules.tar.gz deps
buildkite-agent artifact upload cache__build.tar.gz
buildkite-agent artifact upload cache__deps.tar.gz

echo ":javascript: tarballs"
cd assets
tar -czf cache__node_modules.tar.gz node_modules
buildkite-agent artifact upload cache__node_modules.tar.gz
cd ..
