defmodule DemocoruwtfWeb.CardLive.Index do
  use DemocoruwtfWeb, :live_view

  alias Democoruwtf.Cards
  alias Democoruwtf.Cards.Card

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :card_collection, list_card())}
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

  defp list_card do
    Cards.list_card()
  end
end
