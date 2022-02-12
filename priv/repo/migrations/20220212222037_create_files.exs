defmodule EcoSub.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :location, :string, null: false
      add :type_id, references(:filetypes, on_delete: :restrict)
      add :creator_id, references(:user, on_delete: :nilify_all)

      timestamps()
    end

    create index(:files, [:type_id])
    create index(:files, [:creator_id])
    create unique_index(:files, [:location])
  end
end
