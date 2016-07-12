ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AsynchronousLogin.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AsynchronousLogin.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(AsynchronousLogin.Repo)

