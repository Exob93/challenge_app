# Preview all emails at http://localhost:3000/rails/mailers/mail_user
class MailUserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_user/mail_if_add_answer
  def mail_if_add_answer
    MailUser.mail_if_add_answer
  end

  # Preview this email at http://localhost:3000/rails/mailers/mail_user/mail_if_q_accepted
  def mail_if_q_accepted
    MailUser.mail_if_q_accepted
  end

end
