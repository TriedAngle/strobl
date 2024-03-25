defmodule Strobl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StroblWeb.Telemetry,
      Strobl.Repo,
      {DNSCluster, query: Application.get_env(:strobl, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Strobl.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Strobl.Finch},
      # Start a worker by calling: Strobl.Worker.start_link(arg)
      # {Strobl.Worker, arg},
      # Start to serve requests, typically the last entry
      StroblWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Strobl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StroblWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
