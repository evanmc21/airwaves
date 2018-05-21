class User < ApplicationRecord
  has_many :flights
  has_many :airlines through: :flights
  has_secure_password

  validates_presence_of :email, uniqueness: true
  validates_presence_of :name

  accepts_nested_attributes_for :flights

    def flight_attributes=(flight_attributes)
      self.flights.create(flight_attributes)
      self.save
    end
end
