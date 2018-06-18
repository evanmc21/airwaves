class FlightSerializer < ActiveModel::Serializer
  attributes :id, :origin_city, :destination_city, :departure, :return, :cost, :direct, :number
