# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :socket_chat,
  ecto_repos: [SocketChat.Repo]

# Configures the endpoint
config :socket_chat, SocketChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w+RQMIC5emeNp9hBy/Lnxau2UkxjUtaQXXRw+h+gc79nKHHzD6u7CoktaD11VrAu",
  render_errors: [view: SocketChatWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SocketChat.PubSub,
  live_view: [signing_salt: "Bu0G7H7h"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
