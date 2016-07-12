defmodule MemberSpace.PageView do
  use MemberSpace.Web, :view

  def logged_in?(conn) do
    !!Plug.Conn.get_session(conn, :current_user)
  end

  def get_username(conn) do
    Plug.Conn.get_session(conn, :current_user).username
  end

  def user_path(user) do
    "/mlist/#{Integer.to_string(user.id)}"
  end

  def profile_owned(conn, user) do
    session = Plug.Conn.get_session(conn, :current_user)
    if (session) do
      user.id == session.id
    else
      false
    end
  end

  def edit_path(user) do
    "/mlist/#{Integer.to_string(user.id)}/edit"
  end

end
