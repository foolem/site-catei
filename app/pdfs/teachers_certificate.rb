class TeachersCertificate < Prawn::Document

  def initialize(lectures, courses)
    super(:page_size => "A4", :page_layout => :portrait)
    @first_seen = false
    generate(lectures, courses)
  end

  def generate(lectures, courses)
    text "Dia 10", size: 20, align: :left

    # Curso de web - Segunda
    move_down 10
    text "19:00 - 21:40", size: 10, align: :left, style: :bold
    move_down 10

    students_at_lectures_ids = []
    [17,18,19].each do |n|
      students_at_lectures_ids.push Lecture.find(n).registrations.pluck(:id)
    end
    students_at_lectures_ids = students_at_lectures_ids.flatten.uniq

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.first.registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual = []
    actual = studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }

    registrations = []
    actual.each do |a|
      registrations.push Registration.find(a)
    end

    registrations.sort_by { |r| r.name }.each do |r|
      text "- #{r.name.titleize} - #{r.grr.upcase}", size: 10, align: :left
    end

    stroke_line [0, cursor], [520, cursor]
    move_down 10
    # -------------------------------------------------------
    text "Dia 11/09", size: 20, align: :left

    # Curso de Flutter - Terça
    move_down 10
    text "19:00 - 21:40", size: 10, align: :left, style: :bold
    move_down 10

    students_at_lectures_ids = []
    [26,27,28].each do |n|
      students_at_lectures_ids.push Lecture.find(n).registrations.pluck(:id)
    end
    students_at_lectures_ids = students_at_lectures_ids.flatten.uniq

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.first.registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual = []
    actual = studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.find(5).registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual.push studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }

    registrations = []
    actual.flatten.uniq.each do |a|
      registrations.push Registration.find(a)
    end

    registrations.sort_by { |r| r.name }.each do |r|
      text "- #{r.name.titleize} - #{r.grr.upcase}", size: 10, align: :left
    end

    stroke_line [0, cursor], [520, cursor]
    move_down 10

    # -------------------------------------------------------
    text "Dia 12/09", size: 20, align: :left

    # Curso de Elixir - Quarta
    move_down 10
    text "19:00 - 19:50", size: 10, align: :left, style: :bold
    move_down 10

    students_at_lectures_ids = []

    students_at_lectures_ids.push Lecture.find(33).registrations.pluck(:id)

    students_at_lectures_ids = students_at_lectures_ids.flatten.uniq

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.find(2).registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual = []
    actual = studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }
    registrations = []

    actual.each do |a|
      registrations.push Registration.find(a)
    end

    registrations.sort_by { |r| r.name }.each do |r|
      text "- #{r.name.titleize} - #{r.grr.upcase}", size: 10, align: :left
    end

    stroke_line [0, cursor], [520, cursor]
    move_down 10

    # -------------------------------------------------------
    text "Dia 13/09", size: 20, align: :left

    # Curso de Coach - Quinta
    move_down 10
    text "16:30 - 18:10", size: 10, align: :left, style: :bold
    move_down 10

    students_at_lectures_ids = []

    [39, 40].each do |n|
      students_at_lectures_ids.push Lecture.find(n).registrations.pluck(:id)
    end
    students_at_lectures_ids = students_at_lectures_ids.flatten.uniq

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.find(4).registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual = []
    actual = studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }
    registrations = []

    actual.each do |a|
      registrations.push Registration.find(a)
    end

    registrations.sort_by { |r| r.name }.each do |r|
      text "- #{r.name.titleize} - #{r.grr.upcase}", size: 10, align: :left
    end

    stroke_line [0, cursor], [520, cursor]
    move_down 10


    # Curso de Coach - Quinta
    move_down 10
    text "19:00 - 21:40", size: 10, align: :left, style: :bold
    move_down 10

    students_at_lectures_ids = []

    [41, 42, 43].each do |n|
      students_at_lectures_ids.push Lecture.find(n).registrations.pluck(:id)
    end
    students_at_lectures_ids = students_at_lectures_ids.flatten.uniq

    studentes_at_courses_ids = []
    studentes_at_courses_ids.push Course.find(3).registrations.pluck(:id)
    studentes_at_courses_ids = studentes_at_courses_ids.flatten.uniq

    actual = []
    actual = studentes_at_courses_ids.reject { |s| students_at_lectures_ids.include?(s) }
    registrations = []

    actual.each do |a|
      registrations.push Registration.find(a)
    end

    registrations.sort_by { |r| r.name }.each do |r|
      text "- #{r.name.titleize} - #{r.grr.upcase}", size: 10, align: :left
    end

    stroke_line [0, cursor], [520, cursor]
    move_down 10

  end

end
