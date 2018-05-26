class ChangeReturnToBeDateInFlights < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :return, :date
  end
end
