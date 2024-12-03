defmodule ExKanbanWeb.Router do
  use ExKanbanWeb, :router

  @moduledoc """
  Web router entrypoint. Forwards /api/ requests to GraphQL Router.
  """

  scope "/", ExKanbanWeb do
    forward "/api", GraphQl.Router
  end
end
