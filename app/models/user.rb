class User < ApplicationRecord
  has_many :airlines
  has_many :flights through: :airlines
end
