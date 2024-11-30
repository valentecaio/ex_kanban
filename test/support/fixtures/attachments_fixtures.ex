defmodule ExKanban.AttachmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExKanban.Attachments` context.
  """

  @doc """
  Generate a attachment.
  """
  def attachment_fixture(attrs \\ %{}) do
    {:ok, attachment} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> ExKanban.Attachments.create_attachment()

    attachment
  end
end
