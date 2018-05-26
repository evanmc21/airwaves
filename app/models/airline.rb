class Airline < ApplicationRecord
  belongs_to :flight
  has_many :users, through: :flights

  validates_presence_of :name
end
