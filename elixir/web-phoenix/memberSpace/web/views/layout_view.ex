defmodule MemberSpace.LayoutView do
  use MemberSpace.Web, :view

  def logged_in?(conn) do
    !!Plug.Conn.get_session(conn, :current_user)
  end

  def get_username(conn) do
    Plug.Conn.get_session(conn, :current_user).username
  end

end
