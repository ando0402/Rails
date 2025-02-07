require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "welcome" do
    # メールが送信キューに追加されるかどうかをテスト
    email = UserMailer.with(to: "igarashi@example", name: "igarashi").welcome

    # 送信されたメールを確認するテスト
    assert_emails(1) { email.deliver_now }

    assert_equal ["perfect_rails@example.com"], email.from
    assert_equal ["igarashi@example"], email.to
    assert "登録完了", email.subject

    assert_includes email.text_part.decoded, "igaiga"
    assert_includes email.html_part.decoded, "igaiga"
    end
end

