class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :grr
      t.string :email
      t.string :cpf
      t.integer :total_minutes
      t.integer :turn
      t.string :hash_id

      t.timestamps
    end
  end
end
