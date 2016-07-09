ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MemberSpace.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MemberSpace.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MemberSpace.Repo)

