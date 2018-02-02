defmodule MbtaSample.Repo.Migrations.CreateDepartures do
  use Ecto.Migration

  def change do
    create table(:departures) do
      add :TimeStamp, :integer
      add :Origin, :string
      add :Trip, :string
      add :Destination, :string
      add :ScheduledTime, :integer
      add :Lateness, :integer
      add :Track, :string
      add :Status, :string

      timestamps()
    end

  end
end
