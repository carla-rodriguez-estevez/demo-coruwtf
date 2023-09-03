defmodule DemocoruwtfWeb.PageController do
  use DemocoruwtfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
