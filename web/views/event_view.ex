defmodule Cats.EventView do
  use JaSerializer.PhoenixView

  attributes [:name, :url, :start_time, :end_time]
  has_many :artists

end
