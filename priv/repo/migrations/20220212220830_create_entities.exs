defmodule EcoSub.Repo.Migrations.CreateEntities do
  use Ecto.Migration

  def change do
    create table(:entities, primary_key: false) do
      add :number, :integer, primary_key: true
      add :name, :string

      timestamps()
    end
  end
end
