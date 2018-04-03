defmodule Cats.ArtistController do
  use Cats.Web, :controller

  alias Cats.Artist
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    include = _params["include"] || ""
    artists = Repo.all(Artist) |> Repo.preload(:events)
    render(conn, "index.json-api", data: artists, opts: [include: include])
  end

  def create(conn, %{"data" => data = %{"type" => "artist", "attributes" => _artist_params}}) do
    changeset = Artist.changeset(%Artist{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, artist} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", artist_path(conn, :show, artist))
        |> render("show.json-api", data: artist)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def show(conn, params) do
    id = params["id"]

    # Load all events, event artists,and events of those other artists
    artist = Repo.get!(Artist, id)
    |> Repo.preload([events: [ artists: [ events: [:artists]] ] ])
    include = params["include"] || ""
    render(conn, "show.json-api", data: artist, opts: [include: include])
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "artist", "attributes" => _artist_params}}) do
    artist = Repo.get!(Artist, id)
    changeset = Artist.changeset(artist, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, artist} ->
        render(conn, "show.json-api", data: artist)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artist)

    send_resp(conn, :no_content, "")
  end

end
