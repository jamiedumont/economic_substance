defmodule EcoSub.Repo.Migrations.AddTotpToUsers do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :totp, :string
      add :totp_failures, :integer, default: 0, null: false
      add :last_totp_at, :utc_datetime
      add :recovery_code_failures, :integer, default: 0, null: false
    end

    create table(:recovery_codes) do
      add :code, :string, null: false
      add :user_id, references(:user, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
