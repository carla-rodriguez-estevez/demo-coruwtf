defmodule Democoruwtf.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:card) do
      add :content, :string
      add :state, :string

      timestamps()
    end
  end
end
