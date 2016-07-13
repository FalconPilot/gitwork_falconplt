defmodule AsynchronousLogin.SessionChannel do
  use Phoenix.Channel

  def join("user:connect", _message, socket) do
    {:ok, socket}
  end

  def handle_in("login", params, socket) do
    IO.inspect params
    AsynchronousLogin.SessionController.log(params)
    {:noreply, socket}
  end

end
