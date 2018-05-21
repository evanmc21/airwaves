class AddDepartureToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :departure, :datetime
  end
end
