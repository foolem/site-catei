class AddDayToLectures < ActiveRecord::Migration[5.1]
  def change
    add_column :lectures, :day, :integer
  end
end
