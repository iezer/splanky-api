defmodule Cats.EventView do
  use JaSerializer.PhoenixView

  attributes [:title, :url, :start_time, :end_time, :artist_ids]
  has_many :artists, serializer: Cats.ArtistView
end
