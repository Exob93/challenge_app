require 'test_helper'

class MailUserTest < ActionMailer::TestCase
  test "mail_if_add_answer" do
    mail = MailUser.mail_if_add_answer
    assert_equal "Mail if add answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mail_if_q_accepted" do
    mail = MailUser.mail_if_q_accepted
    assert_equal "Mail if q accepted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
