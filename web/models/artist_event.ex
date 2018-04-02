defmodule Cats.ArtistEvent do
  use Cats.Web, :model

  schema "artists_events" do
    belongs_to :artist, Cats.Artist
    belongs_to :event, Cats.Event
  end
end
