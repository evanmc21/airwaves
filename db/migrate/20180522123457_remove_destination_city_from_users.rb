class RemoveDestinationCityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :destination_city, :string
  end
end
