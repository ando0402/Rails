class RoomChannel < ApplicationCable::Channel
  # サーバーサイド

  # 購読後
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  # 購読解除
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 実行
  def speak
    ActionCable.server.broadcast(
      "room_channel", message: data["message"]
    )
  end
end
