ExUnit.start

Mix.Task.run "ecto.create", ~w(-r GoldBook.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r GoldBook.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(GoldBook.Repo)

