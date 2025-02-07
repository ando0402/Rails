class CommentsMailbox < ApplicationMailbox
  before_processing :validate_request

  def process
    board.comments.create!(body: mail.decoded, creator: commenter)
    # board.comments.create!(body: mail.decoded, creator: comments)
  end

  # リクエストのバリデーション
  def validate_request
    return if commenter && board
    bounce_with CommentsMailer.invalid_request(
      inbound_email, commenter: commenter, board: board
    )
  end

  # コメント投稿者となるUserオブジェクトを取得
  def commenter
    return @commenter if defined?(@commenter)
    @commenter = User.find_by(email: mail.from)
  end
end
