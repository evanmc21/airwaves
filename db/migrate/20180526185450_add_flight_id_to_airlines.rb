class AddFlightIdToAirlines < ActiveRecord::Migration[5.2]
  def change
    add_column :airlines, :flight_id, :integer
  end
end
