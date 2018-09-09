class AddDayToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :day, :integer
  end
end
