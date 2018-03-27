defmodule Cats.Event do
  use Cats.Web, :model

  schema "events" do
    field :title, :string
    field :url, :string
    field :artist_ids, :string
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime
    many_to_many :artists, Cats.Artist, join_through: "artists_events"
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
