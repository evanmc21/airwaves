class RemoveFlightIdFromAirlines2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :airlines, :flight_id, :integer
  end
end
