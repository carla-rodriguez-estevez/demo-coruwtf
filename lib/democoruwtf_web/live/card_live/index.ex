defmodule DemocoruwtfWeb.CardLive.Index do
  use DemocoruwtfWeb, :live_view

  alias Democoruwtf.Cards
  alias Democoruwtf.Cards.Card

  @impl true
  def mount(_params, _session, socket) do
     if connected?(socket), do: Cards.subscribe()

      assigns = [
      card_collection: list_card()
    ]

    {:ok, assign(socket, assigns)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Card")
    |> assign(:card, Cards.get_card!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Card")
    |> assign(:card, %Card{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Card")
    |> assign(:card, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    card = Cards.get_card!(id)
    {:ok, _} = Cards.delete_card(card)

    {:noreply, assign(socket, :card_collection, list_card())}
  end

    @impl true
  def handle_info({:card_created, card}, socket) do
    {:noreply,
     update(socket, :card_collection, fn card_collection ->
       [card | card_collection]
     end)}
  end

  @impl true

  def handle_info({:card_updated, card}, socket) do
    list = Enum.filter(socket.assigns.card_collection, fn el -> el.id != card.id end)

    {:noreply,
     update(socket, :card_collection, fn card ->
       [card | list]
     end)}
  end

  def handle_info({:card_deleted, card}, socket) do
    list = Enum.filter(socket.assigns.card_collection, fn el -> el.id != card.id end)

    assigns = [
      card_collection: list
    ]

    {:noreply, assign(socket, assigns)}
  end

  defp list_card do
    Cards.list_card()
  end
end
