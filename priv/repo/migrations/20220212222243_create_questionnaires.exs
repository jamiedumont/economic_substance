defmodule EcoSub.Repo.Migrations.CreateQuestionnaires do
  use Ecto.Migration

  def change do
    create table(:countries, primary_key: false) do
      add :code, :string, primary_key: true, null: false
      add :name, :string
      add :blacklisted, :boolean
    end

    create table(:questionnaires) do
      add :financial_period_start, :utc_datetime
      add :financial_period_end, :utc_datetime
      add :next_financial_period_start, :utc_datetime
      add :next_financial_period_end, :utc_datetime

      add :finalised_at, :utc_datetime

      add :entity_number, references(:entities, column: :number, type: :integer, on_delete: :restrict), null: false
      add :primary_activity_code, references(:economic_activities, column: :code, type: :integer, on_delete: :restrict)
      add :tax_residency_code, references(:countries, column: :code, type: :string, on_delete: :restrict)


      timestamps()
    end

    create table(:questionnaire_relevantactivities, primary_key: false) do
      add :questionnaire_id, references(:questionnaires, on_delete: :delete_all), null: false
      add :relevant_activity_id, references(:relevant_activities, on_delete: :restrict), null: false
    end

    create table(:questionnaire_uploads, primary_key: false) do
      add :questionnaire_id, references(:questionnaires, on_delete: :delete_all), null: false
      add :file_id, references(:files, on_delete: :restrict), null: false
    end

    create table(:questionnaire_documents, primary_key: false) do
      add :questionnaire_id, references(:questionnaires, on_delete: :delete_all), null: false
      add :file_id, references(:files, on_delete: :restrict), null: false
    end

    create index(:questionnaires, [:entity_number, :financial_period_end])
    create unique_index(:questionnaire_relevantactivities, [:questionnaire_id, :relevant_activity_id])
    create unique_index(:questionnaire_uploads, [:questionnaire_id, :file_id])
    create unique_index(:questionnaire_documents, [:questionnaire_id, :file_id])
  end
end
