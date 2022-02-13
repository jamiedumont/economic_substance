defmodule EcoSub.Repo.Migrations.UserInfo do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :active, :boolean, default: false, null: false
      add :password_failures, :integer, default: 0, null: false
      add :lockout_ends, :utc_datetime, default: nil, null: true
      add :invite_sent, :utc_datetime, default: nil, null: true
      add :is_admin, :boolean, default: false, null: false
      add :terms_agreed_at, :utc_datetime, default: nil
    end

    create constraint(:user, "password_failures_not_exceed_three", check: "password_failures < 3")
  end
end
