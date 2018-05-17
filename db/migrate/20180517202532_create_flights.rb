class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :airline
      t.string :origin_city
      t.string :destination_city
      t.integer :cost
      t.boolean :direct

      t.timestamps
    end
  end
end
