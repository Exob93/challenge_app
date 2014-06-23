# Preview all emails at http://localhost:3000/rails/mailers/mail_if_add_answer
class MailIfAddAnswerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_if_add_answer/mail_if_q_accepted
  def mail_if_q_accepted
    MailIfAddAnswer.mail_if_q_accepted
  end

end
