defmodule ExKanban.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add :url, :string
      add :task_id, references(:tasks, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:attachments, [:task_id])
  end
end
