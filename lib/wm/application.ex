defmodule Wm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # Wm.Repo,
      # Start the Telemetry supervisor
      WmWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wm.PubSub},
      # Start the Endpoint (http/https)
      WmWeb.Endpoint,
      {Task.Supervisor, name: Wm.TaskSupervisor},
      {Task, fn -> KVServer.accept(4040) end}
      # Start a worker by calling: Wm.Worker.start_link(arg)
      # {Wm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WmWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
