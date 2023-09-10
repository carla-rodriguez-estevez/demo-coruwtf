defmodule Democoruwtf.CardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Democoruwtf.Cards` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        content: "some content",
        state: "some state"
      })
      |> Democoruwtf.Cards.create_card()

    card
  end
end
