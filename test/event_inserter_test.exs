defmodule EventInserterTest do
  use ExUnit.Case
  use Cats.ConnCase
  doctest EventInserter

  alias Cats.Artist
  alias Cats.Repo

  @valid_attrs %{instrument: "piano", name: "Johnny", url: "/artists/123-johnny"
  }

  test "can create artist" do
    assert Repo.all(Artist) |> length == 0, "sanity check Artist starts empty"
    EventInserter.find_or_create_artist(@valid_attrs)
    assert Repo.get_by!(Artist, @valid_attrs)
  end

  test "can find and return artist" do
    artist = Artist.changeset(%Artist{}, @valid_attrs) |> Repo.insert |> elem(1)
    assert Repo.all(Artist) |> length == 1, "sanity check Artist starts with 1"
    found = EventInserter.find_or_create_artist(@valid_attrs)
    assert artist == found
    assert Repo.all(Artist) |> length == 1, "no duplicate artist"
  end
end
