# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phx_api,
  ecto_repos: [PhxApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :phx_api, PhxApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: PhxApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PhxApi.PubSub,
  live_view: [signing_salt: "4/yyhbBR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phx_api, PhxApiWeb.Auth.Guardian,
    issuer: "phx_api",
    secret_key: "GVi9kjJ5Bd2zPzVpNu/XC2nLVNGGLy/KeTnm7WHdE3qLn42HBazqLMdgSQstibQZ"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :guardian, Guardian.DB,
    repo: PhxApi.Repo,
    schema_name: "guardian_tokens",
    sweep_interval: 60

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
