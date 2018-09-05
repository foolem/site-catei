class RegistrationMailer < ApplicationMailer

  def send_qrcode(user)
    @greeting = "Sua inscrição na SATADS foi efetuada com sucesso!"
    @user = user
    qr = RQRCode::QRCode.new( @user.id.to_s, :size => 4, :level => :h )
    png = qr.to_img
    png.resize(500, 500).save("app/assets/images/qr.png")

    attachments['qr.png'] = File.read("#{Rails.root}/app/assets/images/qr.png")
    attachments['logo.png'] = File.read("#{Rails.root}/app/assets/images/satads_logo_escrito.png")

    mail to: @user.email, subject: "Confirmação de inscrição SATADS"
  end

  def send_course_details(user, course)
    attachments['logo.png'] = File.read("#{Rails.root}/app/assets/images/satads_logo_escrito.png")

    @user = user
    @course = course

    mail to: @user.email, subject: "Confirmação de inscrição em minicurso - SATADS"
  end
end
