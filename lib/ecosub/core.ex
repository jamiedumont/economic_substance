defmodule EcoSub.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias EcoSub.Repo

  alias EcoSub.Core.Entity

  @doc """
  Returns the list of entities.

  ## Examples

      iex> list_entities()
      [%Entity{}, ...]

  """
  def list_entities do
    Repo.all(Entity)
  end

  @doc """
  Gets a single entity.

  Raises `Ecto.NoResultsError` if the Entity does not exist.

  ## Examples

      iex> get_entity!(123)
      %Entity{}

      iex> get_entity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_entity!(id), do: Repo.get!(Entity, id)

  @doc """
  Creates a entity.

  ## Examples

      iex> create_entity(%{field: value})
      {:ok, %Entity{}}

      iex> create_entity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_entity(attrs \\ %{}) do
    %Entity{}
    |> Entity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a entity.

  ## Examples

      iex> update_entity(entity, %{field: new_value})
      {:ok, %Entity{}}

      iex> update_entity(entity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_entity(%Entity{} = entity, attrs) do
    entity
    |> Entity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a entity.

  ## Examples

      iex> delete_entity(entity)
      {:ok, %Entity{}}

      iex> delete_entity(entity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_entity(%Entity{} = entity) do
    Repo.delete(entity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entity changes.

  ## Examples

      iex> change_entity(entity)
      %Ecto.Changeset{data: %Entity{}}

  """
  def change_entity(%Entity{} = entity, attrs \\ %{}) do
    Entity.changeset(entity, attrs)
  end

  alias EcoSub.Core.Questionnaire

  @doc """
  Returns the list of questionnaires.

  ## Examples

      iex> list_questionnaires()
      [%Questionnaire{}, ...]

  """
  def list_questionnaires do
    Repo.all(Questionnaire)
  end

  @doc """
  Gets a single questionnaire.

  Raises `Ecto.NoResultsError` if the Questionnaire does not exist.

  ## Examples

      iex> get_questionnaire!(123)
      %Questionnaire{}

      iex> get_questionnaire!(456)
      ** (Ecto.NoResultsError)

  """
  def get_questionnaire!(id), do: Repo.get!(Questionnaire, id)

  @doc """
  Creates a questionnaire.

  ## Examples

      iex> create_questionnaire(%{field: value})
      {:ok, %Questionnaire{}}

      iex> create_questionnaire(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_questionnaire(attrs \\ %{}) do
    %Questionnaire{}
    |> Questionnaire.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a questionnaire.

  ## Examples

      iex> update_questionnaire(questionnaire, %{field: new_value})
      {:ok, %Questionnaire{}}

      iex> update_questionnaire(questionnaire, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_questionnaire(%Questionnaire{} = questionnaire, attrs) do
    questionnaire
    |> Questionnaire.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a questionnaire.

  ## Examples

      iex> delete_questionnaire(questionnaire)
      {:ok, %Questionnaire{}}

      iex> delete_questionnaire(questionnaire)
      {:error, %Ecto.Changeset{}}

  """
  def delete_questionnaire(%Questionnaire{} = questionnaire) do
    Repo.delete(questionnaire)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking questionnaire changes.

  ## Examples

      iex> change_questionnaire(questionnaire)
      %Ecto.Changeset{data: %Questionnaire{}}

  """
  def change_questionnaire(%Questionnaire{} = questionnaire, attrs \\ %{}) do
    Questionnaire.changeset(questionnaire, attrs)
  end

  alias EcoSub.Core.EconomicActivity

  @doc """
  Returns the list of economic_activities.

  ## Examples

      iex> list_economic_activities()
      [%EconomicActivity{}, ...]

  """
  def list_economic_activities do
    Repo.all(EconomicActivity)
  end

  @doc """
  Gets a single economic_activity.

  Raises `Ecto.NoResultsError` if the Economic activity does not exist.

  ## Examples

      iex> get_economic_activity!(123)
      %EconomicActivity{}

      iex> get_economic_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_economic_activity!(id), do: Repo.get!(EconomicActivity, id)

  @doc """
  Creates a economic_activity.

  ## Examples

      iex> create_economic_activity(%{field: value})
      {:ok, %EconomicActivity{}}

      iex> create_economic_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_economic_activity(attrs \\ %{}) do
    %EconomicActivity{}
    |> EconomicActivity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a economic_activity.

  ## Examples

      iex> update_economic_activity(economic_activity, %{field: new_value})
      {:ok, %EconomicActivity{}}

      iex> update_economic_activity(economic_activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_economic_activity(%EconomicActivity{} = economic_activity, attrs) do
    economic_activity
    |> EconomicActivity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a economic_activity.

  ## Examples

      iex> delete_economic_activity(economic_activity)
      {:ok, %EconomicActivity{}}

      iex> delete_economic_activity(economic_activity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_economic_activity(%EconomicActivity{} = economic_activity) do
    Repo.delete(economic_activity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking economic_activity changes.

  ## Examples

      iex> change_economic_activity(economic_activity)
      %Ecto.Changeset{data: %EconomicActivity{}}

  """
  def change_economic_activity(%EconomicActivity{} = economic_activity, attrs \\ %{}) do
    EconomicActivity.changeset(economic_activity, attrs)
  end

  alias EcoSub.Core.RelevantActivity

  @doc """
  Returns the list of relevant_activities.

  ## Examples

      iex> list_relevant_activities()
      [%RelevantActivity{}, ...]

  """
  def list_relevant_activities do
    Repo.all(RelevantActivity)
  end

  @doc """
  Gets a single relevant_activity.

  Raises `Ecto.NoResultsError` if the Relevant activity does not exist.

  ## Examples

      iex> get_relevant_activity!(123)
      %RelevantActivity{}

      iex> get_relevant_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_relevant_activity!(id), do: Repo.get!(RelevantActivity, id)

  @doc """
  Creates a relevant_activity.

  ## Examples

      iex> create_relevant_activity(%{field: value})
      {:ok, %RelevantActivity{}}

      iex> create_relevant_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_relevant_activity(attrs \\ %{}) do
    %RelevantActivity{}
    |> RelevantActivity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a relevant_activity.

  ## Examples

      iex> update_relevant_activity(relevant_activity, %{field: new_value})
      {:ok, %RelevantActivity{}}

      iex> update_relevant_activity(relevant_activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_relevant_activity(%RelevantActivity{} = relevant_activity, attrs) do
    relevant_activity
    |> RelevantActivity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a relevant_activity.

  ## Examples

      iex> delete_relevant_activity(relevant_activity)
      {:ok, %RelevantActivity{}}

      iex> delete_relevant_activity(relevant_activity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_relevant_activity(%RelevantActivity{} = relevant_activity) do
    Repo.delete(relevant_activity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking relevant_activity changes.

  ## Examples

      iex> change_relevant_activity(relevant_activity)
      %Ecto.Changeset{data: %RelevantActivity{}}

  """
  def change_relevant_activity(%RelevantActivity{} = relevant_activity, attrs \\ %{}) do
    RelevantActivity.changeset(relevant_activity, attrs)
  end
end
