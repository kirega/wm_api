defmodule Wm.Repo do
  use Ecto.Repo,
    otp_app: :wm,
    adapter: Ecto.Adapters.Postgres
end
