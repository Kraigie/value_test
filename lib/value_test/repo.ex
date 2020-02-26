defmodule ValueTest.Repo do
  use Ecto.Repo,
    otp_app: :value_test,
    adapter: Ecto.Adapters.Postgres
end
