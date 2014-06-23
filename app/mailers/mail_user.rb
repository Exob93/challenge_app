class MailUser < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_user.mail_if_add_answer.subject
  #
  def mail_if_add_answer( user )
    @user = user
    mail(to: @user.email, subject: 'Someone respond to your question')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_user.mail_if_answer_accepted.subject
  #
  def mail_if_answer_accepted( user )
    @user = user
    mail(to: @user.email, subject: 'Your answer was accepted')
  end
end
