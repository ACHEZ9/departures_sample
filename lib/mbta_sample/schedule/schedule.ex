defmodule MbtaSample.Schedule do
  @moduledoc """
  The Schedule context.
  """

  import Ecto.Query, warn: false

  alias MbtaSample.Schedule.Departure

  def get_departures do
    update_departures_data()

    CSV.decode!(File.stream!(get_departures_data_file_path()), headers: true)
    |> Enum.to_list
    |> Enum.map(&(create_departure(&1)))
  end

  defp create_departure(attrs \\ %{}) do
    %Departure{}
    |> Departure.changeset(attrs)
    |> Ecto.Changeset.apply_changes
  end

  defp update_departures_data do
    response = HTTPoison.get!("http://developer.mbta.com/lib/gtrtfs/Departures.csv")
    File.write!(get_departures_data_file_path(), response.body)
  end

  defp get_departures_data_file_path do
    Path.join(:code.priv_dir(:mbta_sample), "/departures.csv")
  end

end
