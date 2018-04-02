defmodule Cats.Event do
  use Cats.Web, :model
  import Ecto.Query

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

  def _query_for_month(start_year, start_month) do
    start_time = Ecto.DateTime.from_erl({{start_year, start_month, 1}, {6,0,0}})
    end_year = start_year
    end_month = start_month + 1

    if end_month > 12 do
      end_year = end_year + 1
      end_month = 1
    end

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
end
