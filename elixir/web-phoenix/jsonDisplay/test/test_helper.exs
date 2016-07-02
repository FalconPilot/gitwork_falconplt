ExUnit.start

Mix.Task.run "ecto.create", ~w(-r JsonDisplay.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r JsonDisplay.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(JsonDisplay.Repo)

