defmodule EventInserter do
  alias Cats.Artist
  alias Cats.Repo

  def find_or_create_artist(params) do
    case Repo.get_by(Artist, url: params.url) do
      nil ->
        Artist.changeset(%Artist{}, params)
        |> Repo.insert |> elem(1)
      artist ->
        artist
    end
  end
end
