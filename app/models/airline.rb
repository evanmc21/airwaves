class Airline < ApplicationRecord
  has_many :flights
  has_many :users, through: :flights

  validates_presence_of :name, :rewards_number


  def self.filter_by_airline(name)
    @airlines = where(name: name)
  end





end
