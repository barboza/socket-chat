defmodule SocketChatWeb.LobbyController do
  use SocketChatWeb, :controller

  alias SocketChat.Chats
  alias SocketChat.Chats.Lobby

  action_fallback SocketChatWeb.FallbackController

  def index(conn, _params) do
    lobbies = Chats.list_lobbies()
    render(conn, "index.json", lobbies: lobbies)
  end

  def create(conn, %{"lobby" => lobby_params}) do
    with {:ok, %Lobby{} = lobby} <- Chats.create_lobby(lobby_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.lobby_path(conn, :show, lobby))
      |> render("show.json", lobby: lobby)
    end
  end

  def show(conn, %{"id" => id}) do
    lobby = Chats.get_lobby!(id)
    render(conn, "show.json", lobby: lobby)
  end

  def update(conn, %{"id" => id, "lobby" => lobby_params}) do
    lobby = Chats.get_lobby!(id)

    with {:ok, %Lobby{} = lobby} <- Chats.update_lobby(lobby, lobby_params) do
      render(conn, "show.json", lobby: lobby)
    end
  end

  def delete(conn, %{"id" => id}) do
    lobby = Chats.get_lobby!(id)

    with {:ok, %Lobby{}} <- Chats.delete_lobby(lobby) do
      send_resp(conn, :no_content, "")
    end
  end
end
