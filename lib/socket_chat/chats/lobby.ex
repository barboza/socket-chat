defmodule SocketChat.Chats.Lobby do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lobbies" do
    field :max_players, :integer
    field :name, :string
    field :public, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(lobby, attrs) do
    lobby
    |> cast(attrs, [:name, :max_players, :public])
    |> validate_required([:name, :max_players, :public])
  end
end
