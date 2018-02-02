defmodule MbtaSampleWeb.DeparturesController do
  use MbtaSampleWeb, :controller

  alias MbtaSample.Schedule

  def index(conn, _params) do
    departures = Schedule.get_departures
    render conn, "index.html", departures: departures
  end

end
