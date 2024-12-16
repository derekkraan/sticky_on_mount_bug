defmodule ShowOnMountBug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ShowOnMountBugWeb.Telemetry,
      ShowOnMountBug.Repo,
      {DNSCluster, query: Application.get_env(:show_on_mount_bug, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ShowOnMountBug.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ShowOnMountBug.Finch},
      # Start a worker by calling: ShowOnMountBug.Worker.start_link(arg)
      # {ShowOnMountBug.Worker, arg},
      # Start to serve requests, typically the last entry
      ShowOnMountBugWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShowOnMountBug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShowOnMountBugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
