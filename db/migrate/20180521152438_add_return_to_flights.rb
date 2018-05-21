class AddReturnToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :return, :datetime
  end
end
