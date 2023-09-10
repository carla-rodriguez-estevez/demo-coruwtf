defmodule Democoruwtf.Cards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "card" do
    field :content, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:content, :state])
    |> validate_required([:content, :state],  message: "campos obligatorios")
    |> validate_inclusion(:state, ["todo", "in progress", "done"], message: "estado inválido")
  end
end
