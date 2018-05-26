class AirlinesController < ApplicationController

  def show
    @airline = Airline.find(params[:id])
  end
  def create
    airline = Airline.new(airline_params)
    if airline.save
      redirect_to user_flight_path(flight.user.id)
    end

    private

  def airline_params
      params.permit(:name, :flight_id)
  end
end
