defmodule MbtaSampleWeb.DeparturesView do
  use MbtaSampleWeb, :view

  def format_timestamp_local(timestamp) do
    DateTime.from_unix!(timestamp)
    |> Timex.local()
    |> Timex.format!("{kitchen}")
  end

  def display_last_updated(departures) do
    departure = Enum.at(departures, 0)
    departure."TimeStamp"
    |> format_timestamp_local
  end
end
