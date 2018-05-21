class RemoveUserIdFromAirlines < ActiveRecord::Migration[5.2]
  def change
    remove_column :airlines, :user_id, :integer
  end
end
