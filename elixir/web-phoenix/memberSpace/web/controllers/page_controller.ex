defmodule MemberSpace.PageController do
  use MemberSpace.Web, :controller
  alias MemberSpace.User

  # Index rendering
  def index(conn, _params) do
    conn
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
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Compte créé :v")
        |> redirect(to: "/")
      {:error, _changeset} ->
        conn
        |> put_flash(:info, "Compte invalide")
        |> redirect(to: "/register")
    end
  end

  # Render login
  def login(conn, _params) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> render("login.html")
      _   ->
        conn
        |> redirect(to: "/")
    end
  end

  # Render memberlist
  def mlist(conn, _params) do
    userlist = Repo.all(User)
    conn
    |> assign(:userlist, userlist)
    |> render("mlist.html")
  end

  # Render memberpage
  def member(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    case user do
      nil ->
        conn
        |> put_flash(:info, "Profil inconnu")
        |> redirect(to: "/")
      _   ->
        conn
        |> assign(:pageuser, user)
        |> render("member.html")
    end
  end

  # Render edit page
  def edit(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    case user do
      nil ->
        conn
        |> put_flash(:info, "Profil inconnu")
        |> redirect(to: "/")
      _   ->
        conn
        |> render("edit.html")
    end
  end

end
