class Flight < ApplicationRecord
  belongs_to :user
  has_many :airlines

  validates_presence_of :departure, :return, :cost, :airline, :origin_city, :destination_city
  validates :number, length: { minimum: 6 }


end
