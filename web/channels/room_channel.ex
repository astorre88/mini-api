defmodule Mini.RoomChannel do
  use Mini.Web, :channel
  require Logger

  alias Mini.{Message, Repo}

  def join("room:" <> room_id, payload, socket) do
    authorize(payload, fn ->
      messages = room_id
        |> Message.latest_room_messages
        |> Repo.all
        |> Enum.reverse
      {:ok, %{messages: messages}, socket}
    end)
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("message", payload, socket) do
    payload = payload
      |> Map.put("user_id", socket.assigns[:user_id])
      |> Map.put("anonymous_user_id", socket.assigns[:uuid])
    changeset = Message.changeset(%Message{}, payload)

    case Repo.insert(changeset) do
      {:ok, message} ->
        broadcast! socket, "message", message
        {:reply, :ok, socket}
      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
