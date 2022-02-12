defmodule EcoSub.Core.Questionnaire do
  use Ecto.Schema
  import Ecto.Changeset
  alias EcoSub.Core.{EconomicActivity, RelevantActivity}

  schema "questionnaires" do
    field :document_last_generated, :utc_datetime
    field :finalised_at, :utc_datetime
    field :financial_period_end, :utc_datetime
    field :financial_period_start, :utc_datetime
    field :next_financial_period_end, :utc_datetime
    field :next_financial_period_start, :utc_datetime

    belongs_to :primary_economic_activity, EconomicActivity, foreign_key: :code
    many_to_many :relevant_activities, RelevantActivity, join_through: "questionnaire_relevantactivities"

    timestamps()
  end

  @doc false
  def changeset(questionnaire, attrs) do
    questionnaire
    |> cast(attrs, [:financial_period_start, :financial_period_end, :next_financial_period_start, :next_financial_period_end, :primary_economic_activity, :relevant_activities, :tax_residency, :uploads, :filing_document, :document_last_generated, :finalised_at])
    |> validate_required([:financial_period_start, :financial_period_end, :next_financial_period_start, :next_financial_period_end, :primary_economic_activity, :relevant_activities, :tax_residency, :uploads, :filing_document, :document_last_generated, :finalised_at])
  end
end
