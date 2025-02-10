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
  def speak(data)
    message = Message.create!(content: data["message"])
    ActionCable.server.broadcast(
      # "room_channel", { message: data["message"] }
      "room_channel", { message: render_message(message) }
    )
  end

  private
  def render_message(message)
    ApplicationController.render(
    partial: "messages/message",
    locals: { message: message }
    )
  end

end
