class AddNameToAirlines < ActiveRecord::Migration[5.2]
  def change
    add_column :airlines, :name, :string
  end
end
