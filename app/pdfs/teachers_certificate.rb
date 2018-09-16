class TeachersCertificate < Prawn::Document

  def initialize(lectures, courses)
    super(:page_size => "A4", :page_layout => :portrait)
    generate(lectures, courses)
  end

  def generate(lectures, courses)
    days = [10, 11, 12, 13, 14]
    days.each do |d|
      text "Dia #{d}", size: 20, align: :left
      i = 1
      lectures.where(day: d).each do |l|
        if l.day != 14
          if (i == 1)
            move_down 10
            text "14:30 - 15:20", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 2)
            move_down 10
            text "15:20 - 16:10", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 3)
            move_down 10
            text "16:30 - 17:20", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 4)
            move_down 10
            text "17:20 - 18:10", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 5)
            move_down 10
            text "19:00 - 19:50", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 6)
            move_down 10
            text "19:50 - 20:40", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 7)
            move_down 10
            text "20:40 - 21:00", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 8)
            move_down 10
            text "21:00 - 21:45", size: 10, align: :left, style: :bold
            move_down 10
          end
        else
          i = 1
          if (i == 1)
            move_down 10
            text "14:30 - 18:10", size: 10, align: :left, style: :bold
            move_down 10
          end
          if (i == 2)
            move_down 10
            text "19:00 - 22:30", size: 10, align: :left, style: :bold
            move_down 10
          end
        end

        l.registrations.uniq.sort_by { |r| r.name }.each_with_index do |r, j|
          c = cursor if j == 0
          text_box "- #{r.name.downcase.titleize}", size: 10, at: [10, cursor] if j < l.registrations.uniq.count/2
          if j >= l.registrations.uniq.count/2
            text_box "- #{r.name.downcase.titleize}", size: 10, at: [300, c]
          end
        end

        i += 1

      end
      stroke_line [0, cursor], [520, cursor]
      move_down 10
    end
  end

end
