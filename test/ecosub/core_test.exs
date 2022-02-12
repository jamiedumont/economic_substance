defmodule EcoSub.CoreTest do
  use EcoSub.DataCase

  alias EcoSub.Core

  describe "entities" do
    alias EcoSub.Core.Entity

    import EcoSub.CoreFixtures

    @invalid_attrs %{name: nil, number: nil}

    test "list_entities/0 returns all entities" do
      entity = entity_fixture()
      assert Core.list_entities() == [entity]
    end

    test "get_entity!/1 returns the entity with given id" do
      entity = entity_fixture()
      assert Core.get_entity!(entity.id) == entity
    end

    test "create_entity/1 with valid data creates a entity" do
      valid_attrs = %{name: "some name", number: 42}

      assert {:ok, %Entity{} = entity} = Core.create_entity(valid_attrs)
      assert entity.name == "some name"
      assert entity.number == 42
    end

    test "create_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_entity(@invalid_attrs)
    end

    test "update_entity/2 with valid data updates the entity" do
      entity = entity_fixture()
      update_attrs = %{name: "some updated name", number: 43}

      assert {:ok, %Entity{} = entity} = Core.update_entity(entity, update_attrs)
      assert entity.name == "some updated name"
      assert entity.number == 43
    end

    test "update_entity/2 with invalid data returns error changeset" do
      entity = entity_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_entity(entity, @invalid_attrs)
      assert entity == Core.get_entity!(entity.id)
    end

    test "delete_entity/1 deletes the entity" do
      entity = entity_fixture()
      assert {:ok, %Entity{}} = Core.delete_entity(entity)
      assert_raise Ecto.NoResultsError, fn -> Core.get_entity!(entity.id) end
    end

    test "change_entity/1 returns a entity changeset" do
      entity = entity_fixture()
      assert %Ecto.Changeset{} = Core.change_entity(entity)
    end
  end

  describe "questionnaires" do
    alias EcoSub.Core.Questionnaire

    import EcoSub.CoreFixtures

    @invalid_attrs %{document_last_generated: nil, filing_document: nil, finalised_at: nil, financial_period_end: nil, financial_period_start: nil, next_financial_period_end: nil, next_financial_period_start: nil, primary_economic_activity: nil, relevant_activities: nil, tax_residency: nil, uploads: nil}

    test "list_questionnaires/0 returns all questionnaires" do
      questionnaire = questionnaire_fixture()
      assert Core.list_questionnaires() == [questionnaire]
    end

    test "get_questionnaire!/1 returns the questionnaire with given id" do
      questionnaire = questionnaire_fixture()
      assert Core.get_questionnaire!(questionnaire.id) == questionnaire
    end

    test "create_questionnaire/1 with valid data creates a questionnaire" do
      valid_attrs = %{document_last_generated: ~U[2022-02-11 22:17:00Z], filing_document: "some filing_document", finalised_at: ~U[2022-02-11 22:17:00Z], financial_period_end: ~U[2022-02-11 22:17:00Z], financial_period_start: ~U[2022-02-11 22:17:00Z], next_financial_period_end: ~U[2022-02-11 22:17:00Z], next_financial_period_start: ~U[2022-02-11 22:17:00Z], primary_economic_activity: "some primary_economic_activity", relevant_activities: "some relevant_activities", tax_residency: "some tax_residency", uploads: "some uploads"}

      assert {:ok, %Questionnaire{} = questionnaire} = Core.create_questionnaire(valid_attrs)
      assert questionnaire.document_last_generated == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.filing_document == "some filing_document"
      assert questionnaire.finalised_at == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.financial_period_end == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.financial_period_start == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.next_financial_period_end == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.next_financial_period_start == ~U[2022-02-11 22:17:00Z]
      assert questionnaire.primary_economic_activity == "some primary_economic_activity"
      assert questionnaire.relevant_activities == "some relevant_activities"
      assert questionnaire.tax_residency == "some tax_residency"
      assert questionnaire.uploads == "some uploads"
    end

    test "create_questionnaire/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_questionnaire(@invalid_attrs)
    end

    test "update_questionnaire/2 with valid data updates the questionnaire" do
      questionnaire = questionnaire_fixture()
      update_attrs = %{document_last_generated: ~U[2022-02-12 22:17:00Z], filing_document: "some updated filing_document", finalised_at: ~U[2022-02-12 22:17:00Z], financial_period_end: ~U[2022-02-12 22:17:00Z], financial_period_start: ~U[2022-02-12 22:17:00Z], next_financial_period_end: ~U[2022-02-12 22:17:00Z], next_financial_period_start: ~U[2022-02-12 22:17:00Z], primary_economic_activity: "some updated primary_economic_activity", relevant_activities: "some updated relevant_activities", tax_residency: "some updated tax_residency", uploads: "some updated uploads"}

      assert {:ok, %Questionnaire{} = questionnaire} = Core.update_questionnaire(questionnaire, update_attrs)
      assert questionnaire.document_last_generated == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.filing_document == "some updated filing_document"
      assert questionnaire.finalised_at == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.financial_period_end == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.financial_period_start == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.next_financial_period_end == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.next_financial_period_start == ~U[2022-02-12 22:17:00Z]
      assert questionnaire.primary_economic_activity == "some updated primary_economic_activity"
      assert questionnaire.relevant_activities == "some updated relevant_activities"
      assert questionnaire.tax_residency == "some updated tax_residency"
      assert questionnaire.uploads == "some updated uploads"
    end

    test "update_questionnaire/2 with invalid data returns error changeset" do
      questionnaire = questionnaire_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_questionnaire(questionnaire, @invalid_attrs)
      assert questionnaire == Core.get_questionnaire!(questionnaire.id)
    end

    test "delete_questionnaire/1 deletes the questionnaire" do
      questionnaire = questionnaire_fixture()
      assert {:ok, %Questionnaire{}} = Core.delete_questionnaire(questionnaire)
      assert_raise Ecto.NoResultsError, fn -> Core.get_questionnaire!(questionnaire.id) end
    end

    test "change_questionnaire/1 returns a questionnaire changeset" do
      questionnaire = questionnaire_fixture()
      assert %Ecto.Changeset{} = Core.change_questionnaire(questionnaire)
    end
  end

  describe "economic_activities" do
    alias EcoSub.Core.EconomicActivity

    import EcoSub.CoreFixtures

    @invalid_attrs %{code: nil, description: nil, title: nil}

    test "list_economic_activities/0 returns all economic_activities" do
      economic_activity = economic_activity_fixture()
      assert Core.list_economic_activities() == [economic_activity]
    end

    test "get_economic_activity!/1 returns the economic_activity with given id" do
      economic_activity = economic_activity_fixture()
      assert Core.get_economic_activity!(economic_activity.id) == economic_activity
    end

    test "create_economic_activity/1 with valid data creates a economic_activity" do
      valid_attrs = %{code: 42, description: "some description", title: "some title"}

      assert {:ok, %EconomicActivity{} = economic_activity} = Core.create_economic_activity(valid_attrs)
      assert economic_activity.code == 42
      assert economic_activity.description == "some description"
      assert economic_activity.title == "some title"
    end

    test "create_economic_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_economic_activity(@invalid_attrs)
    end

    test "update_economic_activity/2 with valid data updates the economic_activity" do
      economic_activity = economic_activity_fixture()
      update_attrs = %{code: 43, description: "some updated description", title: "some updated title"}

      assert {:ok, %EconomicActivity{} = economic_activity} = Core.update_economic_activity(economic_activity, update_attrs)
      assert economic_activity.code == 43
      assert economic_activity.description == "some updated description"
      assert economic_activity.title == "some updated title"
    end

    test "update_economic_activity/2 with invalid data returns error changeset" do
      economic_activity = economic_activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_economic_activity(economic_activity, @invalid_attrs)
      assert economic_activity == Core.get_economic_activity!(economic_activity.id)
    end

    test "delete_economic_activity/1 deletes the economic_activity" do
      economic_activity = economic_activity_fixture()
      assert {:ok, %EconomicActivity{}} = Core.delete_economic_activity(economic_activity)
      assert_raise Ecto.NoResultsError, fn -> Core.get_economic_activity!(economic_activity.id) end
    end

    test "change_economic_activity/1 returns a economic_activity changeset" do
      economic_activity = economic_activity_fixture()
      assert %Ecto.Changeset{} = Core.change_economic_activity(economic_activity)
    end
  end

  describe "relevant_activities" do
    alias EcoSub.Core.RelevantActivity

    import EcoSub.CoreFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_relevant_activities/0 returns all relevant_activities" do
      relevant_activity = relevant_activity_fixture()
      assert Core.list_relevant_activities() == [relevant_activity]
    end

    test "get_relevant_activity!/1 returns the relevant_activity with given id" do
      relevant_activity = relevant_activity_fixture()
      assert Core.get_relevant_activity!(relevant_activity.id) == relevant_activity
    end

    test "create_relevant_activity/1 with valid data creates a relevant_activity" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %RelevantActivity{} = relevant_activity} = Core.create_relevant_activity(valid_attrs)
      assert relevant_activity.description == "some description"
      assert relevant_activity.title == "some title"
    end

    test "create_relevant_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_relevant_activity(@invalid_attrs)
    end

    test "update_relevant_activity/2 with valid data updates the relevant_activity" do
      relevant_activity = relevant_activity_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %RelevantActivity{} = relevant_activity} = Core.update_relevant_activity(relevant_activity, update_attrs)
      assert relevant_activity.description == "some updated description"
      assert relevant_activity.title == "some updated title"
    end

    test "update_relevant_activity/2 with invalid data returns error changeset" do
      relevant_activity = relevant_activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_relevant_activity(relevant_activity, @invalid_attrs)
      assert relevant_activity == Core.get_relevant_activity!(relevant_activity.id)
    end

    test "delete_relevant_activity/1 deletes the relevant_activity" do
      relevant_activity = relevant_activity_fixture()
      assert {:ok, %RelevantActivity{}} = Core.delete_relevant_activity(relevant_activity)
      assert_raise Ecto.NoResultsError, fn -> Core.get_relevant_activity!(relevant_activity.id) end
    end

    test "change_relevant_activity/1 returns a relevant_activity changeset" do
      relevant_activity = relevant_activity_fixture()
      assert %Ecto.Changeset{} = Core.change_relevant_activity(relevant_activity)
    end
  end
end
