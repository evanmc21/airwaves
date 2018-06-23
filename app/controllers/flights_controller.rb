class FlightsController < ApplicationController
  # before_action :find_flight, only: [:show, :edit, :update, :destroy]
  # # before_action :authentication_required
  # # before_action :authorization_required
  before_action :set_user

  def index
    @user = User.find(params[:user_id])
    @flights = @user.flights
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @flights, each_serializer: FlightSerializer}
    end
  end

  def show
    @user = User.find(params[:user_id])
    @flight = @user.flights.find(params[:id])
    # respond_to do |format|
    #   format.html {render :show, :layout => false}
    #   format.json {render json: @flights, serializer: FlightSerializer}
    # end

  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to user_flights_path(current_user)
    else
      redirect_to airlines_path(@flight.airline_id)
    end
  end


  def destroy
    @user = current_user
    @flight = @user.flights.find(params[:id])
    if @flight
      @flight.destroy
      redirect_to user_flights_path(@user)
    else
      flash[:message] = "oops. you can only delete your flights"
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:number, :origin_city, :destination_city, :cost, :direct, :return, :departure, :user_id, :airline_id)
  end

  def find_flight
    @flight = Flight.find_by(id: params[:id])
  end

  def set_user
    @user = current_user
  end



end
