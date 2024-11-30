defmodule ExKanbanWeb.GraphQl.Schema do
  use Absinthe.Schema
  import Ecto.Query
  import Absinthe.Resolution.Helpers

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
    field :priority, :integer

    # field :attachments, list_of(:attachment), resolve: &list_attachments/3
    field :attachments, list_of(:attachment) do
      arg :task_id, :id
      resolve &list_attachments/3
    end
  end

  @desc "an attachment in a task card"
  object :attachment do
    field :id, non_null(:id)
    field :url, :string

    field :task, :task do
      resolve fn attachment, _args, _resolution ->
        batch(
          {__MODULE__, :list_tasks_by_ids, ExKanban.Tasks.Task},
          attachment.task_id,
          fn batch_results -> {:ok, Map.get(batch_results, attachment.task_id)} end
        )
      end
    end

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

  # used to batch load tasks
  defp list_tasks_by_ids(_model, task_ids) do
    tasks = ExKanban.Repo.all(from t in ExKanban.Tasks.Task, where: t.id in ^task_ids)
    Map.new(tasks, fn task -> {task.id, task} end)
  end
end
