defmodule AsynchronousLogin.PageController do
  use AsynchronousLogin.Web, :controller
  alias AsynchronousLogin.User

  # Index rendering
  def index(conn, _params) do
    changeset = User.changeset(%User{})
    conn
    |> assign(:changeset, changeset)
    |> render("index.html")
  end
end
