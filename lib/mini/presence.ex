defmodule Mini.Presence do
  use Phoenix.Presence, otp_app: :mini,
                        pubsub_server: Mini.PubSub
end
