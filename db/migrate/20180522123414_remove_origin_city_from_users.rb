class RemoveOriginCityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :origin_city, :string
  end
end
