class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :speaker
      t.integer :vacancies
      t.integer :time_load
      t.string :schedule

      t.timestamps
    end
  end
end
