# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :oberan,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :oberan, OberanWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: OberanWeb.ErrorHTML, json: OberanWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Oberan.PubSub,
  live_view: [signing_salt: "s8mYEpHW"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :oberan, Oberan.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.19.9",
  default: [
    args:
      ~w(js/app.ts --bundle --target=esnext --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Sentry for error reporting
config :sentry,
  client: Sentry.FinchClient,
  dsn:
    "https://47470a77eacae7189d741ec70d78533f@o4505920220692480.ingest.sentry.io/4505920230326272",
  enable_source_code_context: true,
  environment_name: Mix.env(),
  included_environments: [:prod],
  root_source_code_paths: [File.cwd!()],
  tags: %{
    env: "production"
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
