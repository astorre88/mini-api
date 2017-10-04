defmodule Mini.Message do
  use Mini.Web, :model

  alias Mini.{DateTime, User, AnonymousUser}

  @derive {Poison.Encoder, only: ~w(id body timestamp room user_id anonymous_user_id)a}

  schema "messages" do
    field :body, :string
    field :room, :string
    field :timestamp, DateTime

    belongs_to :user, User
    belongs_to :anonymous_user, AnonymousUser, type: :binary_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :room, :timestamp, :user_id, :anonymous_user_id])
    |> validate_required([:body, :room, :timestamp])
  end

  @doc """
  An `Ecto.Query` that returns the last 10 message records for a given room.
  """
  def latest_room_messages(room, number \\ 10) do
    from m in __MODULE__,
      where: m.room == ^room,
      order_by: [desc: :timestamp],
      limit: ^number
  end
end
