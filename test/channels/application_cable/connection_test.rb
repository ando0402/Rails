require "test_helper"

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    # test "subscribes" do
    #   subscribe
    #   assert subscription.confirmed?
    #   assert_has_stream "room_channel"
    # end

    test 'connection accepts' do
      user = User.first
      cookies.signed[:user_id] = User.first.id
      connect
      assert_equal connection.current_user.id, user.id
    end

    test 'connection rejects' do
      cookies.signed[:user_id] = nil
      assert_reject_connection { connect }
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
