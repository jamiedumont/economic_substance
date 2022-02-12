defmodule EcoSub.Documents.FileType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "filetypes" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(file_type, attrs) do
    file_type
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
