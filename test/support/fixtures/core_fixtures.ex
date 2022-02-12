defmodule EcoSub.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EcoSub.Core` context.
  """

  @doc """
  Generate a entity.
  """
  def entity_fixture(attrs \\ %{}) do
    {:ok, entity} =
      attrs
      |> Enum.into(%{
        name: "some name",
        number: 42
      })
      |> EcoSub.Core.create_entity()

    entity
  end

  @doc """
  Generate a questionnaire.
  """
  def questionnaire_fixture(attrs \\ %{}) do
    {:ok, questionnaire} =
      attrs
      |> Enum.into(%{
        document_last_generated: ~U[2022-02-11 22:17:00Z],
        filing_document: "some filing_document",
        finalised_at: ~U[2022-02-11 22:17:00Z],
        financial_period_end: ~U[2022-02-11 22:17:00Z],
        financial_period_start: ~U[2022-02-11 22:17:00Z],
        next_financial_period_end: ~U[2022-02-11 22:17:00Z],
        next_financial_period_start: ~U[2022-02-11 22:17:00Z],
        primary_economic_activity: "some primary_economic_activity",
        relevant_activities: "some relevant_activities",
        tax_residency: "some tax_residency",
        uploads: "some uploads"
      })
      |> EcoSub.Core.create_questionnaire()

    questionnaire
  end

  @doc """
  Generate a economic_activity.
  """
  def economic_activity_fixture(attrs \\ %{}) do
    {:ok, economic_activity} =
      attrs
      |> Enum.into(%{
        code: 42,
        description: "some description",
        title: "some title"
      })
      |> EcoSub.Core.create_economic_activity()

    economic_activity
  end

  @doc """
  Generate a relevant_activity.
  """
  def relevant_activity_fixture(attrs \\ %{}) do
    {:ok, relevant_activity} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> EcoSub.Core.create_relevant_activity()

    relevant_activity
  end
end
