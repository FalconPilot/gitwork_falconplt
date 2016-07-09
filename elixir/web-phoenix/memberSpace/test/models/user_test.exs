defmodule MemberSpace.UserTest do
  use MemberSpace.ModelCase

  alias MemberSpace.User

  @valid_attrs %{crypted_password: "some content", email: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
