defmodule Cats.Artist do
  use Cats.Web, :model

  schema "artists" do
    field :name, :string
    field :url, :string
    field :instrument, :string
    field :image, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :instrument, :image])
    |> validate_required([:name, :url, :instrument, :image])
  end
end
