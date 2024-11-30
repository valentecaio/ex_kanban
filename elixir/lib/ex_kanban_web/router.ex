defmodule ExKanbanWeb.Router do
  use ExKanbanWeb, :router

  scope "/", ExKanbanWeb do
    forward "/api", GraphQl.Router
  end
end
