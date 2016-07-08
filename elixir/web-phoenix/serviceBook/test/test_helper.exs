ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ServiceBook.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ServiceBook.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ServiceBook.Repo)

