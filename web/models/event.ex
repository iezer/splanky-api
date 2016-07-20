defmodule Cats.Event do
  use Cats.Web, :model

  schema "events" do
    field :title, :string
    field :url, :string
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :start_time, :end_time])
    |> validate_required([:title, :url, :start_time, :end_time])
  end

  # unique url
end
