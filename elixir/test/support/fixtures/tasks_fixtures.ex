defmodule ExKanban.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExKanban.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        execution_date: ~U[2024-12-01 21:43:00Z],
        location: "some location",
        name: "some name",
        priority: 42,
        status: 42
      })
      |> ExKanban.Tasks.create_task()

    task
  end
end
