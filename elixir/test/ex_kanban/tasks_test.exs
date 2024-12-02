defmodule ExKanban.TasksTest do
  use ExKanban.DataCase

  alias ExKanban.Tasks

  describe "tasks" do
    alias ExKanban.Tasks.Task

    import ExKanban.TasksFixtures

    @invalid_attrs %{
      description: nil,
      execution_date: nil,
      location: nil,
      name: nil,
      priority: nil,
      status: nil
    }

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{
        description: "some description",
        execution_date: ~U[2024-12-01 21:43:00Z],
        location: "some location",
        name: "some name",
        priority: :low,
        status: :backlog
      }

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.execution_date == ~U[2024-12-01 21:43:00Z]
      assert task.location == "some location"
      assert task.name == "some name"
      assert task.priority == :low
      assert task.status == :backlog
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()

      update_attrs = %{
        description: "some updated description",
        execution_date: ~U[2024-12-02 21:43:00Z],
        location: "some updated location",
        name: "some updated name",
        priority: :medium,
        status: :in_progress
      }

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.execution_date == ~U[2024-12-02 21:43:00Z]
      assert task.location == "some updated location"
      assert task.name == "some updated name"
      assert task.priority == :medium
      assert task.status == :in_progress
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
