defmodule GoldBook.PageController do
  use GoldBook.Web, :controller
  alias GoldBook.Message

  # Add database entry
  def new(conn, %{"message" => msg_params}) do
    IO.inspect msg_params
    buffer = Message.changeset(%Message{}, msg_params)
    if (buffer.valid?) do
      Repo.insert(buffer)
    end
    conn
    |> redirect to: "/"
  end

  # Destroy database
  def destroy(conn, _params) do
    Repo.delete_all(Message)
    conn
    |> redirect to: "/"
  end

  # Index routing
  def index(conn, %{"notice" => notice}) do
    render_index conn, notice
  end

  def index(conn, _params) do
    render_index conn, nil
  end

  # Index rendering
  def render_index(conn, notice) do
    messages = Repo.all(Message)
    changeset = Message.changeset(%Message{})
    conn
    |> assign(:notice, notice)
    |> assign(:changeset, changeset)
    |> assign(:messages, messages)
    |> render "index.html"
  end
end
