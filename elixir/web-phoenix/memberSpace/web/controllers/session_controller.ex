defmodule MemberSpace.SessionControl do
  use MemberSpace.Web, :controller

  def log(conn, %{"session" => session_params}) do
    case MemberSpace.Session.login(session_params, MemberSpace.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> put_flash(:info, "Welcome back, #{user.username} !")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong email/password !")
        |> redirect(to: "/login")
    end
  end

  def drop(conn, _params) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> redirect(to: "/")
      _   ->
        conn
        |> delete_session(:current_user)
        |> put_flash(:info, "See you next time !")
        |> redirect(to: "/")
    end
  end

end

defmodule MemberSpace.Session do
  alias MemberSpace.User

  def login(params, repo) do
    umail = String.downcase(params["email"])
    user = repo.get_by(User, email: umail)
    case verify(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp verify(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end

end
