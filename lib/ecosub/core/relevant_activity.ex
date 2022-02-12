defmodule EcoSub.Core.RelevantActivity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "relevant_activities" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(relevant_activity, attrs) do
    relevant_activity
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
