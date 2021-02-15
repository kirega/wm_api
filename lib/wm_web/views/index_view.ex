defmodule WmWeb.IndexView do
  use WmWeb, :view
  alias WmWeb.IndexView
  # def render("index.json", %{hello: hello}) do
  #   %{data: render_one(hello, IndexView, "index.json")}
  # end

  def render("index.json", data) do
    %{
      hello: data.hello
    }
  end
end
