require "test_helper"

class RoomChannelTest < ActionCable::Channel::TestCase

  test "subscribes" do
    subscribe
    text = "Hello"
    broadcast_text = ApplicationController.render(
      partial: "messages/message",
      locals: { message: Message.new(content:  text) }
    )

    assert_broadcast_on("room_channel", message: broadcast_text) do
      perform :speak, message: text
    end

  end

  # test "subscribes" do
  #   subscribe
  #   assert subscription.confirmed?
  # end
end
