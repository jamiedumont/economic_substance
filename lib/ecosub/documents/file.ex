defmodule EcoSub.Documents.File do
  use Ecto.Schema
  import Ecto.Changeset
  alias EcoSub.Documents.FileType
  alias EcoSub.Accounts.User

  schema "files" do
    field :location, :string

    belongs_to :type, FileType
    belongs_to :creator, User

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:location])
    |> validate_required([:location])
  end
end
