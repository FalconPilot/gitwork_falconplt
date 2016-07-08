defmodule ServiceBook.PageController do
  use ServiceBook.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
