defmodule EcoSub.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EcoSub.Documents` context.
  """

  @doc """
  Generate a file_type.
  """
  def file_type_fixture(attrs \\ %{}) do
    {:ok, file_type} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> EcoSub.Documents.create_file_type()

    file_type
  end

  @doc """
  Generate a file.
  """
  def file_fixture(attrs \\ %{}) do
    {:ok, file} =
      attrs
      |> Enum.into(%{
        location: "some location"
      })
      |> EcoSub.Documents.create_file()

    file
  end
end
