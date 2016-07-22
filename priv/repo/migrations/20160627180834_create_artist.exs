defmodule Cats.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :url, :string
      add :instrument, :string
      add :image, :text
      timestamps()
    end

  end
end
