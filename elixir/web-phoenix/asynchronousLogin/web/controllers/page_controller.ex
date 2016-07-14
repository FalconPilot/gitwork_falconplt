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

  # Registering Page
  def register(conn, _params) do
    changeset = User.changeset(%User{})
    conn
    |> assign(:changeset, changeset)
    |> render("register.html")
  end

  # userlist
  def userlist(conn, _params) do
    userlist = Repo.all(User)
    changeset = User.changeset(%User{})
    conn
    |> assign(:changeset, changeset)
    |> assign(:userlist, userlist)
    |> render("userlist.html")
  end

  # logged_in
  def logged_in(conn, _params) do
    changeset = User.changeset(%User{})
    conn
    |> assign(:changeset, changeset)
    |> render("logged_in.html")
  end

end
