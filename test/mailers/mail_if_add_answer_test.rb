require 'test_helper'

class MailIfAddAnswerTest < ActionMailer::TestCase
  test "mail_if_q_accepted" do
    mail = MailIfAddAnswer.mail_if_q_accepted
    assert_equal "Mail if q accepted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
