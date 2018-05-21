class RemoveAirlineFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :airline, :string
  end
end
