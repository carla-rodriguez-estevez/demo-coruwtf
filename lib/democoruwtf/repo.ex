defmodule Democoruwtf.Repo do
  use Ecto.Repo,
    otp_app: :democoruwtf,
    adapter: Ecto.Adapters.Postgres
end
