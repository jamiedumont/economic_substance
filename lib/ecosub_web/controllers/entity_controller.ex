defmodule EcoSubWeb.EntityController do
  use EcoSubWeb, :controller

  alias EcoSub.Core
  alias EcoSub.Core.Entity

  def index(conn, _params) do
    entities = Core.list_entities()
    render(conn, "index.html", entities: entities)
  end

  def new(conn, _params) do
    changeset = Core.change_entity(%Entity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"entity" => entity_params}) do
    case Core.create_entity(entity_params) do
      {:ok, entity} ->
        conn
        |> put_flash(:info, "Entity created successfully.")
        |> redirect(to: Routes.entity_path(conn, :show, entity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    entity = Core.get_entity!(id)
    render(conn, "show.html", entity: entity)
  end

  def edit(conn, %{"id" => id}) do
    entity = Core.get_entity!(id)
    changeset = Core.change_entity(entity)
    render(conn, "edit.html", entity: entity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "entity" => entity_params}) do
    entity = Core.get_entity!(id)

    case Core.update_entity(entity, entity_params) do
      {:ok, entity} ->
        conn
        |> put_flash(:info, "Entity updated successfully.")
        |> redirect(to: Routes.entity_path(conn, :show, entity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", entity: entity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    entity = Core.get_entity!(id)
    {:ok, _entity} = Core.delete_entity(entity)

    conn
    |> put_flash(:info, "Entity deleted successfully.")
    |> redirect(to: Routes.entity_path(conn, :index))
  end
end
