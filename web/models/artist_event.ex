defmodule Cats.ArtistEvent do
  use Cats.Web, :model

  @primary_key false
  schema "artists_events" do
    belongs_to :artist, Cats.Artist
    belongs_to :event, Cats.Event
  end
end
