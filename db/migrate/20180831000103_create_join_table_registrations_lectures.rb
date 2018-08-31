class CreateJoinTableRegistrationsLectures < ActiveRecord::Migration[5.1]
  def change
    create_join_table :registrations, :lectures do |t|
      # t.index [:registration_id, :lecture_id]
      # t.index [:lecture_id, :registration_id]
    end
  end
end
