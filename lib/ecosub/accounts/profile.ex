defmodule EcoSub.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias EcoSub.Accounts.User

  schema "profiles" do
    field :contact_code, :string
    field :primary, :boolean, default: false

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:contact_code, :primary])
    |> validate_required([:contact_code, :primary])
  end
end
