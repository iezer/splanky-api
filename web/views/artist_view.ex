defmodule Cats.ArtistView do
  use JaSerializer.PhoenixView

  attributes [:name, :url, :instrument, :image]
  has_many :events
end
