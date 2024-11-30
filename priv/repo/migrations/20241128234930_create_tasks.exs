defmodule ExKanban.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :execution_date, :utc_datetime
      add :address, :string
      add :priority, :integer
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
