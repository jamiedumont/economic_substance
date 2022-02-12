defmodule EcoSub.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :contact_code, :string, null: false
      add :primary, :boolean, default: false, null: false
      add :user_id, references(:user, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:profiles, [:user_id])
    create unique_index(:profiles, [:user_id, :contact_code])
  end
end
