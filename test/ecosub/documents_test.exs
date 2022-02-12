defmodule EcoSub.DocumentsTest do
  use EcoSub.DataCase

  alias EcoSub.Documents

  describe "filetypes" do
    alias EcoSub.Documents.FileType

    import EcoSub.DocumentsFixtures

    @invalid_attrs %{type: nil}

    test "list_filetypes/0 returns all filetypes" do
      file_type = file_type_fixture()
      assert Documents.list_filetypes() == [file_type]
    end

    test "get_file_type!/1 returns the file_type with given id" do
      file_type = file_type_fixture()
      assert Documents.get_file_type!(file_type.id) == file_type
    end

    test "create_file_type/1 with valid data creates a file_type" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %FileType{} = file_type} = Documents.create_file_type(valid_attrs)
      assert file_type.type == "some type"
    end

    test "create_file_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_file_type(@invalid_attrs)
    end

    test "update_file_type/2 with valid data updates the file_type" do
      file_type = file_type_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %FileType{} = file_type} = Documents.update_file_type(file_type, update_attrs)
      assert file_type.type == "some updated type"
    end

    test "update_file_type/2 with invalid data returns error changeset" do
      file_type = file_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_file_type(file_type, @invalid_attrs)
      assert file_type == Documents.get_file_type!(file_type.id)
    end

    test "delete_file_type/1 deletes the file_type" do
      file_type = file_type_fixture()
      assert {:ok, %FileType{}} = Documents.delete_file_type(file_type)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_file_type!(file_type.id) end
    end

    test "change_file_type/1 returns a file_type changeset" do
      file_type = file_type_fixture()
      assert %Ecto.Changeset{} = Documents.change_file_type(file_type)
    end
  end

  describe "files" do
    alias EcoSub.Documents.File

    import EcoSub.DocumentsFixtures

    @invalid_attrs %{location: nil}

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Documents.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Documents.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      valid_attrs = %{location: "some location"}

      assert {:ok, %File{} = file} = Documents.create_file(valid_attrs)
      assert file.location == "some location"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      update_attrs = %{location: "some updated location"}

      assert {:ok, %File{} = file} = Documents.update_file(file, update_attrs)
      assert file.location == "some updated location"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_file(file, @invalid_attrs)
      assert file == Documents.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Documents.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Documents.change_file(file)
    end
  end
end
