class AddRewardsNumberToAirlines < ActiveRecord::Migration[5.2]
  def change
    add_column :airlines, :rewards_number, :integer
  end
end
