defmodule GoldBook.Message do
  use GoldBook.Web, :model

  schema "messages" do
    field :user, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(user content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:user, min: 3)
    |> validate_length(:content, min: 3)
  end
end
