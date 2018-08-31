class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :speaker
      t.integer :vacancies
      t.integer :duration_in_minutes

      t.timestamps
    end
  end
end
