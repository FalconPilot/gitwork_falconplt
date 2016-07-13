defmodule AsynchronousLogin.PageView do
  use AsynchronousLogin.Web, :view

  def logged_in?(conn) do
    !!get_user(conn)
  end

  def get_username(conn) do
    get_user(conn).username
  end

  def get_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end

end
