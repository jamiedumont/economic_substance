defmodule EcoSub.Repo.Migrations.CreateEconomicActivities do
  use Ecto.Migration

  def change do
    create table(:economic_activities, primary_key: false) do
      add :code, :integer, primary_key: true
      add :title, :string, null: false
      add :description, :text

      timestamps()
    end
  end
end
