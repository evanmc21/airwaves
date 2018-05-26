class RemoveAirlineIdFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :airline_id, :integer
  end
end
