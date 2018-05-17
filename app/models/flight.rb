class Flight < ApplicationRecord
  has_many :airlines
  has_many :users through: :airlines
  
end
