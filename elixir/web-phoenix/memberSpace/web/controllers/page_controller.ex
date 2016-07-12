defmodule MemberSpace.PageController do
  use MemberSpace.Web, :controller
  alias MemberSpace.User

  # Index rendering
  def index(conn, _params) do
    userlist = Repo.all(User)
    conn
    |> assign(:userlist, userlist)
    |> render("index.html")
  end

  # Registeration rendering
  def register(conn, _params) do
    changeset = User.changeset(%User{})
    conn
    |> assign(:changeset, changeset)
    |> render("register.html")
  end

  # New entry
  def new(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case MemberSpace.Registration.create(changeset, MemberSpace.Repo) do
      {:ok, changeset} ->
        conn
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> redirect(to: "/register")
    end
  end

end
