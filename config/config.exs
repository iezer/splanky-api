# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cats,
  ecto_repos: [Cats.Repo]

# Configures the endpoint
config :cats, Cats.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5oDXR+hJmbTVOZbp5qdmffjIM2ldSNCwstID56eSgF07MDPWembGAFnrguq2Buww",
  render_errors: [view: Cats.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cats.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
