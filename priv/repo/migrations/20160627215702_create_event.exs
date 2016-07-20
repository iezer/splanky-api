defmodule Cats.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :url, :string
      add :start_time, :datetime
      add :end_time, :datetime

      timestamps()
    end

  end
end
