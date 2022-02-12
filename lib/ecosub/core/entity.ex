defmodule EcoSub.Core.Entity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:number, :integer, []}
  @derive {Phoenix.Param, key: :number}
  schema "entities" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [:number, :name])
    |> validate_required([:number, :name])
  end
end
