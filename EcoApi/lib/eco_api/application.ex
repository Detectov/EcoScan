defmodule EcoApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EcoApiWeb.Telemetry,
      EcoApi.Repo,
      {DNSCluster, query: Application.get_env(:eco_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EcoApi.PubSub},
      # Start a worker by calling: EcoApi.Worker.start_link(arg)
      # {EcoApi.Worker, arg},
      # Start to serve requests, typically the last entry
      EcoApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EcoApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EcoApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
