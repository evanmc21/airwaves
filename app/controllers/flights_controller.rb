class FlightsController < ApplicationController


  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def Show
    @flight = Flight.find(params[:id])
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def create
    flight = Flight.new(flight_params)
    if flight.save
      redirect_to flight_path(flight)
    else
      render :new
    end
  end

  def update
    @flight = Flight.find(params[:id])
    @flight.update(flight_params)
  end

  private

  def flight_params
    params.require(:flight).permit(:name, :airline, :origin_city, :destination_city, :cost, :direct, :return, :departure)
  end
end
