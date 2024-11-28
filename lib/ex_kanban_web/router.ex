defmodule ExKanbanWeb.Router do
  use ExKanbanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExKanbanWeb do
    pipe_through :api
  end
end
