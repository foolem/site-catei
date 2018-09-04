class RegistrationMailer < ApplicationMailer

  def send_qrcode(user)
    qr = RQRCode::QRCode.new( '1', :size => 4, :level => :h )
    png = qr.to_img
    png.resize(500, 500).save("app/assets/images/qr.png")

    attachments['qr.png'] = File.read("#{Rails.root}/app/assets/images/qr.png")
    attachments['logo.png'] = File.read("#{Rails.root}/app/assets/images/satads_logo_escrito.png")

    @greeting = "Sua inscrição na SATADS foi efetuada com sucesso!"
    @user = user
    mail to: @user.email, subject: "Confirmação de inscrição SATADS"
  end
end
