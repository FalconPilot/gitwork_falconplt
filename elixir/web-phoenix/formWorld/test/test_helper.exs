ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FormWorld.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FormWorld.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FormWorld.Repo)

