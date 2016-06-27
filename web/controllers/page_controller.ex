defmodule Cats.PageController do
  use Cats.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
