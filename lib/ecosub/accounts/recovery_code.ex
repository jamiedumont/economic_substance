defmodule EcoSub.Accounts.RecoveryCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias EcoSub.Accounts.User

  schema "recovery_codes" do
    field :code, :string, null: false
    field :used_at, :utc_datetime, default: nil
    belongs_to :user, User
  end

end
