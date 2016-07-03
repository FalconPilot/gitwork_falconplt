defmodule TodoList.TaskTest do
  use TodoList.ModelCase

  alias TodoList.Task

  @valid_attrs %{content: "some content", status: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
