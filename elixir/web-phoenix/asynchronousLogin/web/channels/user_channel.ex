defmodule AsynchronousLogin.UserChannel do
  use Phoenix.Channel

  def join("user:connect", _message, socket) do
    {:ok, socket}
  end

  def handle_in("login", params, socket) do
    IO.inspect params
    AsynchronousLogin.SessionController.log(params.conn, %{"session" => params})
    {:noreply, socket}
  end

  def handle_in("register", params, socket) do
    IO.inspect params
    AsynchronousLogin.SessionController.register(params.conn, %{"session" => params})
    {:noreply, socket}
  end
end
