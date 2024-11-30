defmodule ExKanban.TasksTest do
  use ExKanban.DataCase

  alias ExKanban.Tasks

  describe "tasks" do
    alias ExKanban.Tasks.Task

    import ExKanban.TasksFixtures

    @invalid_attrs %{
      address: nil,
      description: nil,
      execution_date: nil,
      name: nil,
      priority: nil
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
        address: "some address",
        description: "some description",
        execution_date: ~U[2024-11-29 01:13:00Z],
        name: "some name",
        priority: 42
      }

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.address == "some address"
      assert task.description == "some description"
      assert task.execution_date == ~U[2024-11-29 01:13:00Z]
      assert task.name == "some name"
      assert task.priority == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()

      update_attrs = %{
        address: "some updated address",
        description: "some updated description",
        execution_date: ~U[2024-11-30 01:13:00Z],
        name: "some updated name",
        priority: 43
      }

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.address == "some updated address"
      assert task.description == "some updated description"
      assert task.execution_date == ~U[2024-11-30 01:13:00Z]
      assert task.name == "some updated name"
      assert task.priority == 43
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
