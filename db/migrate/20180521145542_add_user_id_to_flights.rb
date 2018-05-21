class AddUserIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :user_id, :integer
  end
end
