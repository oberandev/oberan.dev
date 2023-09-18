# Build configuration
# -------------------

APP_NAME = `grep -Eo 'app: :\w*' mix.exs | cut -d ':' -f 3`
GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
GIT_REVISION = `git rev-parse HEAD`

# Introspection targets
# ---------------------

.PHONY: help
help: header targets

.PHONY: header
header:
	@printf "\n\033[34mEnvironment\033[0m\n"
	@printf "\033[34m---------------------------------------------------------------\033[0m\n"
	@printf "\033[33m%-23s\033[0m" "APP_NAME"
	@printf "\033[35m%s\033[0m" $(APP_NAME)
	@echo ""
	@printf "\033[33m%-23s\033[0m" "GIT_BRANCH"
	@printf "\033[35m%s\033[0m" $(GIT_BRANCH)
	@echo ""
	@printf "\033[33m%-23s\033[0m" "GIT_REVISION"
	@printf "\033[35m%s\033[0m" $(GIT_REVISION)
	@echo ""

.PHONY: targets
targets:
	@printf "\n\033[34mTargets\033[0m\n"
	@printf "\033[34m---------------------------------------------------------------\033[0m\n"
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

# Build targets
# -------------

.PHONY: build
build: ## Make a production build
	MIX_ENV=prod mix release

# Development targets
# -------------------

.PHONY: clean
clean: ## Remove build artifacts
	rm -rf _build

.PHONY: deps-ex
deps-ex: ## Install Elixir dependencies
	mix deps.get --force

.PHONY: deps-js
deps-js: ## Install Javascript dependencies
	cd assets && yarn

.PHONY: certs
certs: ## Create SSL certs for development
	mix phx.gen.cert

.PHONY: run
run: ## Run the web server
	iex -S mix phx.server

.PHONY: test-ex
test-ex: ## Test Elixir code
	mix test

# Check, lint and format targets
# ------------------------------

.PHONY: format-ex
format-ex: ## Format all Elixir files
	mix format

.PHONY: format-js
format-js: ## Format all Javascript files
	cd assets && yarn format

.PHONY: format-ex-check
format-ex-check:
	mix format --check-formatted

.PHONY: format-js-check
format-js-check:
	cd assets && yarn format:check

.PHONY: lint-ex
lint-ex: ## Lint all Elixir files
	mix credo

.PHONY: lint-js
lint-js: ## Lint all Javascript files
	cd assets && yarn lint
