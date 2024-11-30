defmodule ExKanban.Attachments.Attachment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attachments" do
    field :url, :string
    field :task_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
