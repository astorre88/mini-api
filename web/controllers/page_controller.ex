defmodule Mini.PageController do
  use Mini.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
