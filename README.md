# Oberan

Marketing website [oberan.dev](https://oberan.dev)

## Setup

1. Ensure you have [Nix](https://nixos.org/download.html) and [direnv](https://direnv.net/#basic-installation) configured
2. Run `cp envrc.example envrc` and configure any necessary env vars
3. Run `direnv allow`

## Development

1. Install Elixir deps with `make deps-ex`
2. Install Javascript deps with `make deps-js`
3. Create SSL certs for local developmnt with `make certs`
4. Run development server with `make run`
