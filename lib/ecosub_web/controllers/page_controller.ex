defmodule EcoSubWeb.PageController do
  use EcoSubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
