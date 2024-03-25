defmodule Strobl.Repo do
  use Ecto.Repo,
    otp_app: :strobl,
    adapter: Ecto.Adapters.Postgres
end
