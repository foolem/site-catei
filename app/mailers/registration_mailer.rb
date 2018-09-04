class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.send_qrcode.subject
  #
  def send_qrcode(user)
    @user = user
    mg_client = Mailgun::Client.new '0b74133fd1e319a1fccffa5deb346890-f45b080f-0ea6e8ea'
    message_params = {:from    => 'emaildocatei@gmail.com',
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message 'sandbox63f7e98983984d95a7c8469e674d02f1.mailgun.org', message_params
  end

end
