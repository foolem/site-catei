class Registration < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures
  enum turn: { not_student: 0, day: 1, night: 2 }

  def check_in(type, object)
    self.total_minutes = 0 if self.total_minutes.blank?
    if type == "lecture"
      lectures_counter = self.lectures.map { |lecture| lecture.id }.count(object.id)
      if object.name == "Lightning talks"
        self.total_minutes += 200 if lectures_counter == 0 # conto como 4 palestras o período da sexta
        self.lectures << object
        self.save
        return
      end
      if (lectures_counter < 2)
        self.total_minutes += 50 if lectures_counter == 0 # cada palestra deve ter 2 checkins, entrada e saída
        self.lectures << object
        self.save
      end
    else
      courses_counter = self.courses.map { |course| course.id }.count(object.id)
      #self.total_minutes += 50 if (courses_counter < 4) # 4 porque temos um minicurso com 4 aulas
      self.courses << object if (courses_counter < 4) && self.save
    end
  end
end
