defmodule Cats.Router do
  use Cats.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/", Cats do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Cats do
    pipe_through :api

    resources "/artists", ArtistController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
  end
end
