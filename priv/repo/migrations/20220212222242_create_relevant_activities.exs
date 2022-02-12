defmodule EcoSub.Repo.Migrations.CreateRelevantActivities do
  use Ecto.Migration

  def change do
    create table(:relevant_activities) do
      add :title, :string, null: false
      add :description, :text

      timestamps()
    end
  end
end
