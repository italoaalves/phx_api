defmodule PhxApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxApiWeb.Telemetry,
      # Start the Ecto repository
      PhxApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxApi.PubSub},
      # Start the Endpoint (http/https)
      PhxApiWeb.Endpoint
      # Start a worker by calling: PhxApi.Worker.start_link(arg)
      # {PhxApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
