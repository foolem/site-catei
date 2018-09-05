class Registration < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures
  enum turn: { not_student: 0, day: 1, night: 2 }

  def check_in(type, object)
    self.total_minutes = 0 if self.total_minutes.blank?
    if type == "lecture"
      self.total_minutes += 60 if !self.lectures.include?(object) # cada palestra só pode ser assistida uma vez por turno
      self.lectures << object if !self.lectures.include?(object) && self.save
    else
      self.total_minutes += 60 if (self.courses.map { |course| course.id }.count(object.id) < 4) # 4 porque temos um minicurso com 4 aulas
      self.courses << object if (self.courses.map { |course| course.id }.count(object.id) < 4) && self.save
    end
  end
end
