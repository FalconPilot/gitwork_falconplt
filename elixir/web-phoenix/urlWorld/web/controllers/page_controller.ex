defmodule UrlWorld.PageController do
  use UrlWorld.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn, _params) do
    render conn, "hello.html"
  end
end
