class SendMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail_mailer.notify.subject
  #
  def notify(pdf)
    attachments['report.pdf'] = pdf
    mail to: ENV['RECEIVER_EMAIL'], from: "kamal@machine-learners.com"
  end
end
