class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.integer :duration_in_minutes
      t.string :speaker

      t.timestamps
    end
  end
end
