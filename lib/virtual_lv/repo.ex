defmodule VirtualLv.Repo do
  use Ecto.Repo,
    otp_app: :virtual_lv,
    adapter: Ecto.Adapters.Postgres
end
