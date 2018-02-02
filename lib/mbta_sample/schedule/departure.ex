defmodule MbtaSample.Schedule.Departure do
  use Ecto.Schema
  import Ecto.Changeset
  alias MbtaSample.Schedule.Departure


  schema "departures" do
    field :Destination, :string
    field :Lateness, :integer
    field :Origin, :string
    field :ScheduledTime, :integer
    field :Status, :string
    field :TimeStamp, :integer
    field :Track, :string, default: "TBD"
    field :Trip, :string

    timestamps()
  end

  @doc false
  def changeset(%Departure{} = departure, attrs) do
    departure
    |> cast(attrs, [:TimeStamp, :Origin, :Trip, :Destination, :ScheduledTime, :Lateness, :Track, :Status])
    |> validate_required([:TimeStamp, :Origin, :Trip, :Destination, :ScheduledTime, :Lateness, :Track, :Status])
  end
end
