defmodule ExKanban.Repo do
  use Ecto.Repo,
    otp_app: :ex_kanban,
    adapter: Ecto.Adapters.Postgres
end
