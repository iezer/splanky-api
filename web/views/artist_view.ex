defmodule Cats.ArtistView do
  use Cats.Web, :view

  def render("index.json", %{artists: artists}) do
    %{data: render_many(artists, Cats.ArtistView, "artist.json")}
  end

  def render("show.json", %{artist: artist}) do
    %{data: render_one(artist, Cats.ArtistView, "artist.json")}
  end

  def render("artist.json", %{artist: artist}) do
    %{
      type: "artist",
      id: artist.id,
      attributes: %{
        name: artist.name,
        url: artist.url,
        instrument: artist.instrument,
        image: artist.image
      }
    }
  end
end
