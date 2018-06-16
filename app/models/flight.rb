class Flight < ApplicationRecord
  belongs_to :user
  belongs_to :airline

  validates_presence_of :departure, :return, :cost, :origin_city, :destination_city
  validates :number, length: { minimum: 6 }


end
