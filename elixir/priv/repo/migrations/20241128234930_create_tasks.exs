defmodule ExKanban.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :execution_date, :utc_datetime
      add :location, :string
      add :description, :string
      add :priority, :integer
      add :status, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
