# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :value_test,
  ecto_repos: [ValueTest.Repo]

# Configures the endpoint
config :value_test, ValueTestWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [
    signing_salt: "SECRET_SALT"
  ],
  secret_key_base: "+4pnQMCA3tG7tg9FjKJkxOXvqoF7DyXXnVm0ToT9szwf+ODGboLKsgjZtRPlx3MA",
  render_errors: [view: ValueTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ValueTest.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "j26uEvtf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
