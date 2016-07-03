defmodule TodoList.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :content, :string
      add :status, :boolean, default: false

      timestamps
    end

  end
end
