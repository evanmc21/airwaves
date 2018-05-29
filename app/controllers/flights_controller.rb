class FlightsController < ApplicationController
  before_action :find_flight, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required
  before_action :authorization_required


  def index
    @user = User.find(params[:user_id])
    @flights = @user.flights
  end

  def new
    @user = User.find(params[:user_id])
    @flight = @user.flights.build
  end

  def Show
    @user = User.find(params[:user_id])
    @flight = @user.flights.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @flight = @user.flights.build(flight_params)
    if @flight.save
      redirect_to user_flight_path(@user, @flight)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @flight = @user.flights.find(params[:id])
    if @flight
      render :edit
    else
      flash[:message]= "oops. you can only edit flights you created."
      redirect_to user_flights_path(@user)
    end
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to user_flight_path
    else
      render :edit
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
    params.require(:flight).permit(:number, :airline, :origin_city, :destination_city, :cost, :direct, :return, :departure)
  end

  def find_flight
    @flight = Flight.find_by(id: params[:id])
  end

  def flight_user
    current_user == @flight.user
  end



end
