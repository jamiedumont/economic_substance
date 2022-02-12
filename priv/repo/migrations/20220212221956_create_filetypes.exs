defmodule EcoSub.Repo.Migrations.CreateFiletypes do
  use Ecto.Migration

  def change do
    create table(:filetypes) do
      add :type, :string, null: false

      timestamps()
    end
  end
end
