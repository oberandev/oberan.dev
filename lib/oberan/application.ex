defmodule Oberan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    Logger.add_backend(Sentry.LoggerBackend)

    children = [
      OberanWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:oberan, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Oberan.PubSub},
      {Finch, name: Oberan.Finch},
      # Start a worker by calling: Oberan.Worker.start_link(arg)
      # {Oberan.Worker, arg}
      # Start to serve requests, typically the last entry
      OberanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Oberan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OberanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
