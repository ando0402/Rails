class UserMailer < ApplicationMailer
  # ユーザー登録完了時のメール送信機能実装
  def welcome
    @name = params[:name]
    mail(to: params[:to], subject: "登録完了")
  end
end
