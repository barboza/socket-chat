defmodule SocketChat.Repo do
  use Ecto.Repo,
    otp_app: :socket_chat,
    adapter: Ecto.Adapters.Postgres
end
