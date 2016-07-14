defmodule AsynchronousLogin.SessionController do
  use AsynchronousLogin.Web, :controller
  alias AsynchronousLogin.User

  # Login user
  def log(conn, session_params) do
    case AsynchronousLogin.Session.login(session_params, AsynchronousLogin.Repo) do
      {:ok, user} ->
        conn = put_session conn, :current_user, user
        conn
        |> redirect(to: "/")
        text(conn, "0")
      :error ->
        text conn, "1"
    end
  end

  # Logout user
  def drop(conn, _params) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> redirect(to: "/")
        text conn, "Unable to log out !"
      _   ->
        conn
        |> delete_session(:current_user)
        |> redirect(to: "/")
        text conn, "OK !"
    end
  end

  # Register user
  def register(conn, user_params) do
    changeset = User.changeset(%User{}, user_params["user"])
    case AsynchronousLogin.Session.create(changeset, AsynchronousLogin.Repo) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Compte créé !")
        |> redirect(to: "/")
      {:error, changeset} ->
        IO.inspect changeset.errors
        conn
        |> put_flash(:info, "Paramètres invalides !")
        |> redirect(to: "/register")
    end
  end

end

defmodule AsynchronousLogin.Session do
  alias AsynchronousLogin.User

  # Login user
  def login(params, repo) do
    user = repo.get_by(User, username: params["username"])
    case verify(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  # Verify password
  defp verify(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.encrypted_password)
    end
  end

  # Create new entry
  def create(changeset, repo) do
    password = crypt_password(changeset.params["password"])
    IO.inspect password
    changeset
    |> Ecto.Changeset.put_change(:encrypted_password, password)
    |> repo.insert()
  end

  # Crypt password using Bcrypt
  def crypt_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

end
