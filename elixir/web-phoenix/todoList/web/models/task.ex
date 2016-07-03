defmodule TodoList.Task do
  use TodoList.Web, :model

  schema "tasks" do
    field :content, :string
    field :status, :boolean, default: false

    timestamps
  end

  @required_fields ~w(content status)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:content, min: 3)
  end
end
