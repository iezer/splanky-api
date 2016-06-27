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
end
