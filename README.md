# Oberan

Marketing website [oberan.dev](https://oberan.dev)

[![codecov](https://codecov.io/gh/oberandev/oberan.dev/graph/badge.svg?token=89GBM65AMA)](https://codecov.io/gh/oberandev/oberan.dev)
[![Build Status](https://badge.buildkite.com/6d75d58cae5f0b5b15e71d5a9060153525e5edef9dda3665ff.svg?branch=main)](https://buildkite.com/oberan/ffx)

## Setup

1. Ensure you have [Nix](https://nixos.org/download.html) and [direnv](https://direnv.net/#basic-installation) configured
2. Run `cp .envrc.example .envrc` and configure any necessary env vars
3. Run `direnv allow`

## Development

1. Install deps with `make deps`
2. Create SSL certs for local developmnt with `make certs`
3. Run development server with `make run`
