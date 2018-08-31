class Registration < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures

  def check_in(type, object)
    self.total_minutes = 0 if self.total_minutes.blank?

    self.total_minutes += 50 if !self.lectures.include?(object)

    if type == "lecture"
      self.lectures << object if !self.lectures.include?(object) && self.save
    else
      self.courses << object && self.save
    end

  end
end
