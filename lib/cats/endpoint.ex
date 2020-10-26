defmodule Cats.Endpoint do
  use Phoenix.Endpoint, otp_app: :cats

  socket "/socket", Cats.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :cats, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_cats_key",
    signing_salt: "T85lMcUc"

  plug Corsica, [
    origins: [
      "http://localhost:4200",
      "http://localhost:3000",
      "http://iezer.github.io",
      "https://iezer.github.io",
      "http://splanky.net",
      "http://www.splanky.net",
      "http://jazz.splanky.net",
      "http://api.splanky.net",
      "http://splanky.herokuapp.com"
    ]
  ]

  plug Cats.Router
end
