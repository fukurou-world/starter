class ApplicationMailer < ActionMailer::Base
  # プロパティ：to, cc, bcc, from, subject, date, reply_to
  default from: 'from@example.com'
  layout 'mailer'
end
