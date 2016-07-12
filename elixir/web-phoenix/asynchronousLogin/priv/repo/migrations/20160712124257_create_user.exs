defmodule AsynchronousLogin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :encrypted_password, :string

      timestamps
    end
    create unique_index(:users, [:email])

  end
end
