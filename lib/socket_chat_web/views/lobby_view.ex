defmodule SocketChatWeb.LobbyView do
  use SocketChatWeb, :view
  alias SocketChatWeb.LobbyView

  def render("index.json", %{lobbies: lobbies}) do
    %{data: render_many(lobbies, LobbyView, "lobby.json")}
  end

  def render("show.json", %{lobby: lobby}) do
    %{data: render_one(lobby, LobbyView, "lobby.json")}
  end

  def render("lobby.json", %{lobby: lobby}) do
    %{id: lobby.id, name: lobby.name, max_players: lobby.max_players, public: lobby.public}
  end
end
