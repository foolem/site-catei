class CreateJoinTableRegistrationsCourses < ActiveRecord::Migration[5.1]
  def change
    create_join_table :registrations, :courses do |t|
      # t.index [:registration_id, :course_id]
      # t.index [:course_id, :registration_id]
    end
  end
end
