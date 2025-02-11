require "test_helper"

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    test "subscribes" do
      subscribe
      assert subscription.confirmed?
      assert_has_stream "room_channel"
    end
    # test "connects with cookies" do
    #   cookies.signed[:user_id] = 42
    #
    #   connect
    #
    #   assert_equal connection.user_id, "42"
    # end
  end
end
