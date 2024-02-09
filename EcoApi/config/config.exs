# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :eco_api,
  ecto_repos: [EcoApi.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

config :eco_api, EcoApi.Guardian,
  issuer: "eco_api",
  secret_key: "yStGe4AkKCnLc+o0S8S8vidRXHRd/LkXoqUIgnaE0r5O3EkPy/UazHA+IioYPcNz",
  module: EcoApi.Guardian

# Configures the endpoint
config :eco_api, EcoApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: EcoApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: EcoApi.PubSub,
  live_view: [signing_salt: "wnZhEJGk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
