class Flight < ApplicationRecord
  belongs_to :user
  has_many :airlines

  validates_presence_of :number, :departure, :return, :cost, :airline, :origin_city, :destination_city


  def date_format
    self.date.strftime(%m/%d/%Y)
  end

end
