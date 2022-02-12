defmodule EcoSub.Documents do
  @moduledoc """
  The Documents context.
  """

  import Ecto.Query, warn: false
  alias EcoSub.Repo

  alias EcoSub.Documents.FileType

  @doc """
  Returns the list of filetypes.

  ## Examples

      iex> list_filetypes()
      [%FileType{}, ...]

  """
  def list_filetypes do
    Repo.all(FileType)
  end

  @doc """
  Gets a single file_type.

  Raises `Ecto.NoResultsError` if the File type does not exist.

  ## Examples

      iex> get_file_type!(123)
      %FileType{}

      iex> get_file_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_file_type!(id), do: Repo.get!(FileType, id)

  @doc """
  Creates a file_type.

  ## Examples

      iex> create_file_type(%{field: value})
      {:ok, %FileType{}}

      iex> create_file_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_file_type(attrs \\ %{}) do
    %FileType{}
    |> FileType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a file_type.

  ## Examples

      iex> update_file_type(file_type, %{field: new_value})
      {:ok, %FileType{}}

      iex> update_file_type(file_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_file_type(%FileType{} = file_type, attrs) do
    file_type
    |> FileType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a file_type.

  ## Examples

      iex> delete_file_type(file_type)
      {:ok, %FileType{}}

      iex> delete_file_type(file_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_file_type(%FileType{} = file_type) do
    Repo.delete(file_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking file_type changes.

  ## Examples

      iex> change_file_type(file_type)
      %Ecto.Changeset{data: %FileType{}}

  """
  def change_file_type(%FileType{} = file_type, attrs \\ %{}) do
    FileType.changeset(file_type, attrs)
  end

  alias EcoSub.Documents.File

  @doc """
  Returns the list of files.

  ## Examples

      iex> list_files()
      [%File{}, ...]

  """
  def list_files do
    Repo.all(File)
  end

  @doc """
  Gets a single file.

  Raises `Ecto.NoResultsError` if the File does not exist.

  ## Examples

      iex> get_file!(123)
      %File{}

      iex> get_file!(456)
      ** (Ecto.NoResultsError)

  """
  def get_file!(id), do: Repo.get!(File, id)

  @doc """
  Creates a file.

  ## Examples

      iex> create_file(%{field: value})
      {:ok, %File{}}

      iex> create_file(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_file(attrs \\ %{}) do
    %File{}
    |> File.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a file.

  ## Examples

      iex> update_file(file, %{field: new_value})
      {:ok, %File{}}

      iex> update_file(file, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_file(%File{} = file, attrs) do
    file
    |> File.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a file.

  ## Examples

      iex> delete_file(file)
      {:ok, %File{}}

      iex> delete_file(file)
      {:error, %Ecto.Changeset{}}

  """
  def delete_file(%File{} = file) do
    Repo.delete(file)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking file changes.

  ## Examples

      iex> change_file(file)
      %Ecto.Changeset{data: %File{}}

  """
  def change_file(%File{} = file, attrs \\ %{}) do
    File.changeset(file, attrs)
  end
end
