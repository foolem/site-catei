class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :speaker
      t.boolean :turn

      t.timestamps
    end
  end
end
