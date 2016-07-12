defmodule MemberSpace.User do
  use MemberSpace.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :crypted_password, :string

    timestamps
  end

  @required_fields ~w(username email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> validate_length(:username, min: 3)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
  end

end

# Member registration module
defmodule MemberSpace.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  # Create new entry
  def create(changeset, repo) do
    password = changeset.params["password"]
    changeset
    |> put_change(:crypted_password, crypt_password(password))
    |> repo.insert()
  end

  # Crypt password using Bcrypt
  def crypt_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

end
