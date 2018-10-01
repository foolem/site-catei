class GeneralCertificate < Prawn::Document

  def initialize
    super(:page_size => "A4", :page_layout => :landscape, :compress => true)
    generate
  end

  def generate
    Registration.all.each_with_index do |participant, i|
      if participant.total_minutes.present?
        image "#{Rails.root}/app/assets/images/b1.png", at: [-40, 560], width: 850, height: 595

        move_down 40
        text "CERTIFICADO DE PARTICIPAÇÃO", size: 40, align: :center
        move_down 40
        text "Certifico que", size: 20, align: :center
        move_down 10
        text "#{participant.name.downcase.titleize}", size: 25, style: :bold, align: :center
        move_down 10
        text "CPF: #{participant.cpf}", size: 15, style: :bold, align: :center
        move_down 40
        text "Participou do evento", size: 20, align: :center
        move_down 20
        text "#SATADS2018", size: 30, style: :bold, align: :center
        move_down 5
        text "Semana Acadêmica de Tecnologia em Análise e Desenvolvimento de Sistemas", size: 15, align: :center
        move_down 15
        text "de 10 a 14 de setembro de 2018, com carga horária de #{participant.total_minutes/60} horas", size: 20, align: :center
        move_down 50
        image "#{Rails.root}/app/assets/images/catei.png", at: [60, cursor], width: 150, height: 50
        image "#{Rails.root}/app/assets/images/ufpr.png", at: [560, cursor+8], width: 150, height: 60
        move_down 30

        stroke_line [260, cursor], [520, cursor]
        move_down 10
        text "Coordenador do curso", size: 15, align: :center
        start_new_page if Registration.all[i+1]
      end
    end
  end

end
