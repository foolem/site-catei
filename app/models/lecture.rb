class Lecture < ApplicationRecord
  has_and_belongs_to_many :registrations
  
end
