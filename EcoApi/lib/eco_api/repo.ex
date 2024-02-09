defmodule EcoApi.Repo do
  use Ecto.Repo,
    otp_app: :eco_api,
    adapter: Ecto.Adapters.Postgres
end
