defmodule EcoSub.Repo do
  use Ecto.Repo,
    otp_app: :ecosub,
    adapter: Ecto.Adapters.Postgres
end
