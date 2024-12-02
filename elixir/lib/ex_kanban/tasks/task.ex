defmodule ExKanban.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :execution_date, :utc_datetime
    field :location, :string
    field :name, :string
    field :priority, Ecto.Enum, values: [low: 1, medium: 2, high: 3]
    has_many :attachments, ExKanban.Attachments.Attachment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :execution_date, :location, :priority, :description])
    |> validate_required([:name, :execution_date, :location, :priority, :description])
  end
end
