defmodule ExKanbanWeb.GraphQl.Schema do
  use Absinthe.Schema

  # datetime, naive_datetime, decimal
  import_types Absinthe.Type.Custom

  # defines a GraphQL object named "Task"
  @desc "a task card for the kanban board"
  object :task do
    field :id, non_null(:id)
    field :name, :string
    field :description, :string
    field :address, :string
    field :execution_date, :datetime
    field :priority, :string

    # field :attachments, list_of(:attachment), resolve: &list_attachments/3
    field :attachments, list_of(:attachment) do
      resolve &list_attachments/3
    end
  end

  @desc "an attachment in a task card"
  object :attachment do
    field :id, non_null(:id)
    field :url, :string

    # TODO: add more fields
  end

  query do
    field :get_task, :task do
      arg :id, non_null(:id)
      resolve &get_task/2
    end
  end

  defp list_attachments(%ExKanban.Tasks.Task{} = task, args, _resolution) do
    {:ok, ExKanban.Attachments.list_attachments(task, args)}
  end

  defp get_task(%{id: id}, _resolution) do
    case ExKanban.Tasks.get_task!(id) do
      %ExKanban.Tasks.Task{} = task -> {:ok, task}
      _ -> {:error, :not_found}
    end
  end
end
