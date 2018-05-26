class Flight < ApplicationRecord
  belongs_to :user
  has_many :airlines

  validates_presence_of :departure, :return, :cost, :airline, :origin_city, :destination_city
  validates :number, length: { minimum: 6 }

  def date_format
    self.date.strftime('%m/%d/%Y')
  end

  def self.by_airline(airline_id)
    where(airline: airline_id)
  end
end
