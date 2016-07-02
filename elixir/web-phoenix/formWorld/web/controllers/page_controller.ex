defmodule FormWorld.PageController do
  use FormWorld.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn, %{"Elixir.NAME" => %{"name" => name}}) do
    conn
    |> assign(:username, name)
    |> render "hello.html"
  end

  def hello(conn, _params) do
    conn
    |> assign(:username, "World")
    |> render "hello.html"
  end

end
