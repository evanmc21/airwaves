class ChangeDepartureToBeDateInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :departure, :date
  end
end
