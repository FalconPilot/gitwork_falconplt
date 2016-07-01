ExUnit.start

Mix.Task.run "ecto.create", ~w(-r UrlWorld.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r UrlWorld.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(UrlWorld.Repo)

