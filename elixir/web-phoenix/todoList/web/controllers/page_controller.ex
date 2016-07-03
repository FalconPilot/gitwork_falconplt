defmodule TodoList.PageController do
  use TodoList.Web, :controller
  alias TodoList.Task

  # Create entry
  def create(conn, %{"task" => task_params}) do
    buffer = Task.changeset(%Task{}, task_params)
    if (buffer.valid?) do
      Repo.insert buffer
    end
    conn
    |> redirect(to: "/")
  end

  # Switch status
  def switch(conn, %{"id" => id}) do
    task = Repo.get!(Task, id)
    task = Ecto.Changeset.change task, status: !task.status
    Repo.update task
    conn
    |> redirect(to: "/")
  end

  # Destroy entry
  def destroy(conn, _params) do
    conn
    |> redirect(to: "/")
  end

  # Sort map
  def list_sort(list) do
    list_sort(list, [], [])
  end

  def list_sort([h|t], acc1, acc2) do
    if (h.status) do
      acc1 = [h|acc1]
    else
      acc2 = [h|acc2]
    end
    list_sort(t, acc1, acc2)
  end

  def list_sort([], acc1, acc2) do
    acc2 ++ acc1
  end

  # Index
  def index(conn, _params) do
    changeset = Task.changeset(%Task{})
    tasklist = list_sort(Repo.all(Task))
    conn
    |> assign(:changeset, changeset)
    |> assign(:tasklist, tasklist)
    |> render("index.html")
  end
end
