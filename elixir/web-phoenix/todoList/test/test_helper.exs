ExUnit.start

Mix.Task.run "ecto.create", ~w(-r TodoList.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r TodoList.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(TodoList.Repo)

