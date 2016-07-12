defmodule AsynchronousLogin.User do
  use AsynchronousLogin.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :pass_confirm, :string, virtual: true
    field :encrypted_password, :string

    timestamps
  end

  @required_fields ~w(username email encrypted_password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  # Model changeset
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 3)
    |> validate_length(:password, min: 8)
    |> validate_similar(:password, :pass_confirm)
  end

  # Check if similar
  defp validate_similar(changeset, a, b) do
    if (a != b) do
      add_error(changeset, :password, "Password isn't similar")
    else
      changeset
    end
  end

end

# Registration module

defmodule AsynchronousLogin.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  # Create new entry
  def create(changeset, repo) do
    password = changeset.params["password"]
    changeset
    |> put_change(:crypted_password, encrypt_password(password))
    |> repo.insert()
  end

  # Encrypt password
  def encrypt_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

end
