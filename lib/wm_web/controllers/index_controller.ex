defmodule WmWeb.IndexController do
  use WmWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{hello: "hello"})
  end
end
