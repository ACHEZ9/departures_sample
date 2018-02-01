defmodule MbtaSampleWeb.PageController do
  use MbtaSampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
