defmodule ExKanbanWeb.GraphQl.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/graphql",
    to: Absinthe.Plug,
    init_opts: [
      schema: ExKanbanWeb.GraphQl.Schema,
      analyze_complexity: true,
      max_complexity: 300
    ]

  # interactive graphql playground
  if Application.compile_env(:ex_kanban, :dev_routes) do
    forward "/graphiql",
      to: Absinthe.Plug.GraphiQL,
      init_opts: [
        schema: ExKanbanWeb.GraphQl.Schema,
        interface: :playground
      ]
  end
end
