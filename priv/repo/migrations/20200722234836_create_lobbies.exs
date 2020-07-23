defmodule SocketChat.Repo.Migrations.CreateLobbies do
  use Ecto.Migration

  def change do
    create table(:lobbies) do
      add :name, :string
      add :max_players, :integer
      add :public, :boolean, default: false, null: false

      timestamps()
    end

  end
end
