class CreateAirlines < ActiveRecord::Migration[5.2]
  def change
    create_table :airlines do |t|
      t.integer :user_id
      t.integer :flight_id

      t.timestamps
    end
  end
end
