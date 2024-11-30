defmodule ExKanbanWeb.GraphQl.Schema do
  use Absinthe.Schema

  # datetime, naive_datetime, decimal
  import_types Absinthe.Type.Custom

  # defines a GraphQL object named "Task"
  @desc "A task card for the kanban board"
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

  @desc "An attachment in a task card"
  object :attachment do
    field :id, non_null(:id)
    field :url, :string

    # TODO: add more fields
  end

  query do
    @desc "List Tasks. The list may be filtered by address, execution_date, and/or priority."
    field :list_tasks, list_of(:task) do
      arg :address, :string
      arg :execution_date, :datetime
      arg :priority, :string
      resolve &list_tasks/2
    end

    @desc "Get a Task by ID."
    field :get_task, :task do
      arg :id, non_null(:id)
      resolve &get_task/2
    end
  end

  defp list_attachments(%ExKanban.Tasks.Task{} = task, args, _resolution) do
    {:ok, ExKanban.Attachments.list_attachments(task, args)}
  end

  defp list_tasks(args, _resolution) do
    {:ok, ExKanban.Tasks.list_tasks(args)}
  end

  defp get_task(%{id: id}, _resolution) do
    case ExKanban.Tasks.get_task!(id) do
      %ExKanban.Tasks.Task{} = task -> {:ok, task}
      _ -> {:error, :not_found}
    end
  end
end
