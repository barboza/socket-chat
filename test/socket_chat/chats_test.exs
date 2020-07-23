defmodule SocketChat.ChatsTest do
  use SocketChat.DataCase

  alias SocketChat.Chats

  describe "lobbies" do
    alias SocketChat.Chats.Lobby

    @valid_attrs %{max_players: 42, name: "some name", public: true}
    @update_attrs %{max_players: 43, name: "some updated name", public: false}
    @invalid_attrs %{max_players: nil, name: nil, public: nil}

    def lobby_fixture(attrs \\ %{}) do
      {:ok, lobby} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chats.create_lobby()

      lobby
    end

    test "list_lobbies/0 returns all lobbies" do
      lobby = lobby_fixture()
      assert Chats.list_lobbies() == [lobby]
    end

    test "get_lobby!/1 returns the lobby with given id" do
      lobby = lobby_fixture()
      assert Chats.get_lobby!(lobby.id) == lobby
    end

    test "create_lobby/1 with valid data creates a lobby" do
      assert {:ok, %Lobby{} = lobby} = Chats.create_lobby(@valid_attrs)
      assert lobby.max_players == 42
      assert lobby.name == "some name"
      assert lobby.public == true
    end

    test "create_lobby/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_lobby(@invalid_attrs)
    end

    test "update_lobby/2 with valid data updates the lobby" do
      lobby = lobby_fixture()
      assert {:ok, %Lobby{} = lobby} = Chats.update_lobby(lobby, @update_attrs)
      assert lobby.max_players == 43
      assert lobby.name == "some updated name"
      assert lobby.public == false
    end

    test "update_lobby/2 with invalid data returns error changeset" do
      lobby = lobby_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_lobby(lobby, @invalid_attrs)
      assert lobby == Chats.get_lobby!(lobby.id)
    end

    test "delete_lobby/1 deletes the lobby" do
      lobby = lobby_fixture()
      assert {:ok, %Lobby{}} = Chats.delete_lobby(lobby)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_lobby!(lobby.id) end
    end

    test "change_lobby/1 returns a lobby changeset" do
      lobby = lobby_fixture()
      assert %Ecto.Changeset{} = Chats.change_lobby(lobby)
    end
  end
end
