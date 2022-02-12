defmodule EcoSubWeb.EntityControllerTest do
  use EcoSubWeb.ConnCase

  import EcoSub.CoreFixtures

  @create_attrs %{name: "some name", number: 42}
  @update_attrs %{name: "some updated name", number: 43}
  @invalid_attrs %{name: nil, number: nil}

  describe "index" do
    test "lists all entities", %{conn: conn} do
      conn = get(conn, Routes.entity_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Entities"
    end
  end

  describe "new entity" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.entity_path(conn, :new))
      assert html_response(conn, 200) =~ "New Entity"
    end
  end

  describe "create entity" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.entity_path(conn, :create), entity: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.entity_path(conn, :show, id)

      conn = get(conn, Routes.entity_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Entity"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.entity_path(conn, :create), entity: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Entity"
    end
  end

  describe "edit entity" do
    setup [:create_entity]

    test "renders form for editing chosen entity", %{conn: conn, entity: entity} do
      conn = get(conn, Routes.entity_path(conn, :edit, entity))
      assert html_response(conn, 200) =~ "Edit Entity"
    end
  end

  describe "update entity" do
    setup [:create_entity]

    test "redirects when data is valid", %{conn: conn, entity: entity} do
      conn = put(conn, Routes.entity_path(conn, :update, entity), entity: @update_attrs)
      assert redirected_to(conn) == Routes.entity_path(conn, :show, entity)

      conn = get(conn, Routes.entity_path(conn, :show, entity))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, entity: entity} do
      conn = put(conn, Routes.entity_path(conn, :update, entity), entity: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Entity"
    end
  end

  describe "delete entity" do
    setup [:create_entity]

    test "deletes chosen entity", %{conn: conn, entity: entity} do
      conn = delete(conn, Routes.entity_path(conn, :delete, entity))
      assert redirected_to(conn) == Routes.entity_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.entity_path(conn, :show, entity))
      end
    end
  end

  defp create_entity(_) do
    entity = entity_fixture()
    %{entity: entity}
  end
end
