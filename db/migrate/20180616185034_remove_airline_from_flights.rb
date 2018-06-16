class RemoveAirlineFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :airline, :string
  end
end
