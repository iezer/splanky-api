defmodule Cats.Event do
  use Cats.Web, :model

  schema "events" do
    field :title, :string
    field :url, :string
    field :artist_ids, :string
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime

    has_many :artists_events, Cats.ArtistEvent
    has_many :artists, through: [:artists_events, :artist]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :artist_ids, :start_time, :end_time])
    |> validate_required([:title, :url, :artist_ids, :start_time, :end_time])
  end

  # unique url
end
