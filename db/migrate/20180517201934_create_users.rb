class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :origin_city
      t.string :destination_city
      t.string :airline
      t.integer :budget

      t.timestamps
    end
  end
end
