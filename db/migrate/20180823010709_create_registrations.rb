class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :grr
      t.string :cpf

      t.timestamps
    end
  end
end
