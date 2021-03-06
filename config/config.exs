# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mini,
  ecto_repos: [Mini.Repo]

# Configures the endpoint
config :mini, Mini.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lZ/TU3ehMi1se/JYx4W4nB8Baoc0/NimI5KVAJTLHfm0PT5MoUyKI9RFX4kf/Cv2",
  render_errors: [view: Mini.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mini.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    identity: {
      Ueberauth.Strategy.Identity,
      [callback_methods: ["POST"]]
    }
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
