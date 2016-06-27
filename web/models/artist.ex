defmodule Cats.Artist do
  use Cats.Web, :model

  schema "artists" do
    field :name, :string
    field :url, :string
    field :instrument, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :instrument])
    |> validate_required([:name, :url, :instrument])
  end
end
