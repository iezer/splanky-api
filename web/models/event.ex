defmodule Cats.Event do
  use Cats.Web, :model
  import Ecto.Query

  schema "events" do
    field :title, :string
    field :url, :string
    field :artist_ids, :string
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime

    many_to_many :artists, Cats.Artist, join_through: "artists_events"
    timestamps()
  end

  def _query_for_month(start_year, start_month) do
    start_time = Ecto.DateTime.from_erl({{start_year, start_month, 1}, {6,0,0}})

    end_year = if start_month == 12, do: start_year + 1, else: start_year
    end_month = if start_month == 12, do: 1, else: start_month + 1

    end_time = Ecto.DateTime.from_erl({{end_year, end_month, 1}, {6,0,0}})
    from e in Cats.Event, where: e.start_time >= ^start_time and e.start_time < ^end_time
  end

  # TODO test basic case and december rolling to next year
  # Also test that date range is actually from 6am-6am to include gigs going until 4am the next day
  def for_month(year, month) do
    _query_for_month(year, month) |> Cats.Repo.all
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

  # TODO needs testing
  def add_artist(event, artist) do
    event = event |> Cats.Repo.preload(:artists)
    artists = event.artists ++ [artist]
    |> Enum.map(&Ecto.Changeset.change/1)

    event
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:artists, artists)
    |> Cats.Repo.update
  end


  # TODO needs testing
  def add_artists(event, artists) do
    event = event |> Cats.Repo.preload(:artists)
    artists = event.artists ++ artists
    |> Enum.map(&Ecto.Changeset.change/1)

    event
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:artists, artists)
    |> Cats.Repo.update
  end
end
