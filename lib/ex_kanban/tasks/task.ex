defmodule ExKanban.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :address, :string
    field :description, :string
    field :execution_date, :utc_datetime
    field :name, :string
    field :priority, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :execution_date, :address, :priority, :description])
    |> validate_required([:name, :execution_date, :address, :priority, :description])
  end
end
