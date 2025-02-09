require "test_helper"

class CommentsMailboxTest < ActionMailbox::TestCase
  # test "receive mail" do
  #   receive_inbound_email_from_mail \
  #     to: '"someone" <someone@example.com>',
  #     from: '"else" <else@example.com>',
  #     subject: "Hello world!",
  #     body: "Hello?"
  # end
  test "メールの本文が、対応するBoardのコメントとして正しく追加されること" do
    board = Board.create
    user = User.create!(email: "user@example.com")
    assert_difference -> { board.comments.count } do
        receive_inbound_email_from_mail \
          to: "#{board.id}-comment@example.com",
          from: user.email,
          subject: "メールタイトル",
          body: "こんにちは!"
    end
    comment = board.comments.last
    assert_equal user, comment.creator
    assert_equal "こんにちは!", comment.body
  end
end
