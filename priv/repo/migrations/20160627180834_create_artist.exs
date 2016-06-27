defmodule Cats.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :url, :string
      add :instrument, :string

      timestamps()
    end

  end
end
