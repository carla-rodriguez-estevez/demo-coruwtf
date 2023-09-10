defmodule Democoruwtf.CardsTest do
  use Democoruwtf.DataCase

  alias Democoruwtf.Cards

  describe "card" do
    alias Democoruwtf.Cards.Card

    import Democoruwtf.CardsFixtures

    @invalid_attrs %{content: nil, state: nil}

    test "list_card/0 returns all card" do
      card = card_fixture()
      assert Cards.list_card() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Cards.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{content: "some content", state: "some state"}

      assert {:ok, %Card{} = card} = Cards.create_card(valid_attrs)
      assert card.content == "some content"
      assert card.state == "some state"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cards.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{content: "some updated content", state: "some updated state"}

      assert {:ok, %Card{} = card} = Cards.update_card(card, update_attrs)
      assert card.content == "some updated content"
      assert card.state == "some updated state"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Cards.update_card(card, @invalid_attrs)
      assert card == Cards.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Cards.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Cards.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Cards.change_card(card)
    end
  end
end
