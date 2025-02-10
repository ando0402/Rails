class RoomChannel < ApplicationCable::Channel

  # 購読後
  def subscribed
    # stream_from "some_channel"
  end

  # 購読解除
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 実行
  def speak
  end
end
