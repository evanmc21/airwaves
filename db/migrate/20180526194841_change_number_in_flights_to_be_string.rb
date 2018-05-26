class ChangeNumberInFlightsToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :number, :string
  end
end
