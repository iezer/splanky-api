defmodule EventInserter do
  alias Cats.Artist
  alias Cats.Repo

  def find_or_create_artist(params) do
    Artist.changeset(%Artist{}, params)
    |> Repo.insert
  end
end
