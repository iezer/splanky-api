defmodule Cats.ArtistTest do
  use Cats.ModelCase

  alias Cats.Artist

  @valid_attrs %{
    instrument: "some content",
    name: "some content",
    url: "some content",
    image: "//d95vll9kevyvb.cloudfront.net/drdW5nx6WK16qHY0Q2nd-sTXKmM=/80x80/smart/https%3A//smallslivestatic.s3.amazonaws.com/artist_images/4KtH-p6kPATU9_R81Kapx4yLflCR7nLWV9_yDJ97qP06TfzPLG7CmNz5O5aQdHymrbZZIpiY0fcldoTsji3WJsXSBlY5bUuwTdO99AMDrFQNwUCtvl4D-bCK87WiexYLs.jpeg"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end

  # TODO unique url if not nil
end
