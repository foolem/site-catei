class Lecture < ApplicationRecord
  has_and_belongs_to_many :registrations
  enum turn: { day: false, night: true }
end
