class ApplicationMailer < ActionMailer::Base
  # デフォルトのメールアドレスを編集する
  default from: "perfect_rails@example.com"
  layout "mailer"
end
