defmodule ValueTestWeb.PageController do
  use ValueTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
