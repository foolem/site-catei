# Preview all emails at http://localhost:3000/rails/mailers/registration_mailer
class RegistrationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration_mailer/send_qrcode
  def send_qrcode
    RegistrationMailer.send_qrcode
  end

end
