defmodule CalcWeb.PageController do
  use CalcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
