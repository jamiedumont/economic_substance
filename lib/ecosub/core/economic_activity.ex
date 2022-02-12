defmodule EcoSub.Core.EconomicActivity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "economic_activities" do
    field :code, :integer
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(economic_activity, attrs) do
    economic_activity
    |> cast(attrs, [:code, :title, :description])
    |> validate_required([:code, :title, :description])
  end
end
