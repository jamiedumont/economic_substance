defmodule EcoSub.Accounts.RecoveryCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias EcoSub.Accounts.User

  schema "recovery_codes" do
    field :code, :string, null: false
    belongs_to :user, User
  end

end
