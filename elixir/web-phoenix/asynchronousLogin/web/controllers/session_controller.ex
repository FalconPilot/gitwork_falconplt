defmodule AsynchronousLogin.SessionController do
  use AsynchronousLogin.Web, :controller
  alias AsynchronousLogin.User

  # Login user
  def log(conn, %{"session" => session_params}) do
    case MemberSpace.Session.login(session_params, MemberSpace.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> put_flash(:info, "Welcome back, #{user.username} !")
      :error ->
        conn
        |> put_flash(:info, "Wrong email/password !")
    end
  end

  # Register user
  def register(params) do
    password = params["password"]
  end

end

defmodule AsynchronousLogin.Session do
  alias AsynchronousLogin.User

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
