defmodule ExKanban.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExKanban.Tasks` context.
  """
  alias ExKanban.Repo

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, attachment} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> ExKanban.Attachments.create_attachment()

    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        execution_date: ~U[2024-12-01 21:43:00Z],
        location: "some location",
        name: "some name",
        priority: :low,
        status: :done,
        attachments: [attachment]
      })
      |> ExKanban.Tasks.create_task()

    task |> Repo.preload(:attachments)
  end
end
