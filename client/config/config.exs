# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :client,
  ecto_repos: [Client.Repo]

# Configures the endpoint
config :client, ClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gnPCroKxI/iU1+VfXLwMA3oby4j+BR6GlGJMRA3dyH2ndpU/mT17zxzxdyyvdgjJ",
  render_errors: [view: ClientWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Client.PubSub,
  live_view: [signing_salt: "ZeVpFiiM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
