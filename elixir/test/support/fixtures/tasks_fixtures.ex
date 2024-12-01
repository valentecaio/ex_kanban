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
        execution_date: ~U[2024-11-29 01:13:00Z],
        location: "some location",
        name: "some name",
        priority: 42
      })
      |> ExKanban.Tasks.create_task()

    task
  end
end
