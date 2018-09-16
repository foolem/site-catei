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
        if (i == 1)
          text "14:30 - 15:20", size: 10, align: :left
          move_down 10
        end
        if (i == 2)
          text "15:20 - 16:10", size: 10, align: :left
          move_down 10
        end
        if (i == 3)
          text "16:30 - 17:20", size: 10, align: :left
          move_down 10
        end
        if (i == 4)
          text "17:20 - 18:10", size: 10, align: :left
          move_down 10
        end
        if (i == 5)
          text "19:00 - 19:50", size: 10, align: :left
          move_down 10
        end
        if (i == 6)
          text "19:50 - 20:40", size: 10, align: :left
          move_down 10
        end
        if (i == 7)
          text "20:40 - 21:00", size: 10, align: :left
          move_down 10
        end
        if (i == 8)
          text "21:00 - 21:45", size: 10, align: :left
          move_down 10
        end

        l.registrations.uniq.sort_by { |r| r.name }.each do |r|
          text "- #{r.name}", size: 10, align: :left
          move_down 10
        end

        i += 1

      end
      stroke_line [0, cursor], [520, cursor]
      move_down 10
    end
  end

end