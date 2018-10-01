class GeneralCertificate < Prawn::Document

  def initialize
    super(:page_size => "A4", :page_layout => :landscape, :compress => true)
    generate
  end

  def generate
    registrations = Registration.all
    registrations.reject { |participant| participant.total_minutes.blank? && participant.total_minutes < 1 }.each_with_index do |participant, i|
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
      text "de 10 a 14 de setembro de 2018, com carga horária de #{participant.total_minutes == 50 ? 1 : participant.total_minutes/60} #{participant.total_minutes/60 > 1 ? 'horas' : 'hora'}", size: 20, align: :center
      move_down 50
      image "#{Rails.root}/app/assets/images/catei.png", at: [60, cursor], width: 150, height: 50
      image "#{Rails.root}/app/assets/images/ufpr.png", at: [560, cursor+8], width: 150, height: 60
      move_down 30

      stroke_line [260, cursor], [520, cursor]
      move_down 10
      text "Coordenador do curso", size: 15, align: :center
      start_new_page if registrations[i+1]
    end

    start_new_page

    registrations.each_with_index do |participant, i|
      if participant.courses.length > 0
        participant.courses.each do |course|
          image "#{Rails.root}/app/assets/images/b1.png", at: [-40, 560], width: 850, height: 595

          move_down 40
          text "CERTIFICADO DE PARTICIPAÇÃO", size: 40, align: :center
          move_down 40
          text "Certifico que", size: 20, align: :center
          move_down 10
          text "#{participant.name.downcase.titleize}", size: 25, style: :bold, align: :center
          move_down 50
          text "Participou do curso", size: 20, align: :center
          move_down 20
          if course.id == 5
            text "#{course.name}", size: 24, style: :bold, align: :center
          else
            text "#{course.name}", size: 27, style: :bold, align: :center
          end
          move_down 5
          text "durante a Semana Acadêmica de Tecnologia em Análise e Desenvolvimento de Sistemas", size: 13, align: :center
          move_down 15
          case course.id
          when 1
            text "nos dias 10 e 11 de setembro de 2018, com carga horária de #{course.time_load/60} horas", size: 20, align: :center
          when 2
            text "no dia 12 de setembro de 2018, com carga horária de #{course.time_load/60} hora", size: 20, align: :center
          when 3
            text "no dia 13 de setembro de 2018, com carga horária de #{course.time_load/60} horas", size: 20, align: :center
          when 4
            text "no dia 13 de setembro de 2018, com carga horária de #{course.time_load/60} hora", size: 20, align: :center
          when 5
            text "no dia 11 de setembro de 2018, com carga horária de #{course.time_load/60} horas", size: 20, align: :center
          end
          move_down 50
          image "#{Rails.root}/app/assets/images/catei.png", at: [60, cursor], width: 150, height: 50
          image "#{Rails.root}/app/assets/images/ufpr.png", at: [560, cursor+8], width: 150, height: 60
          move_down 30

          stroke_line [260, cursor], [520, cursor]
          move_down 10
          text "Coordenador do curso", size: 15, align: :center
          start_new_page if registrations[i+1]

        end
      end
    end
  end

end
