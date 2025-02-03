class AskingMailer < ApplicationMailer

  def send_mail_single(user, template_name = 'default')
    @user = user
    mail to: user.email, subject: "お問い合わせありがとうございます"
  end
end
