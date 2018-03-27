defmodule Cats.Repo.Migrations.AddArtistsEvents do
  use Ecto.Migration

  def change do
    create table(:artists_events, primary_key: false) do
      add :artist_id, references(:artists, on_delete: :delete_all)
      add :event_id, references(:events, on_delete: :delete_all)
    end
  end
end
