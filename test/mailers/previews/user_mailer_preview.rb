# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(to: "igarashi@example.com", name: "igaiga").welcome
  end
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end
end
