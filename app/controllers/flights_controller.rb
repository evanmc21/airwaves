class FlightsController < ApplicationController
  # before_action :find_flight, only: [:show, :edit, :update, :destroy]
  # # before_action :authentication_required
  # # before_action :authorization_required
  before_action :current_user

  def index
    @user = User.find(params[:user_id])
    @flights = @user.flights
  end

  def new
    @flight = Flight.new()
  end

  def show
    @user = User.find(params[:user_id])
    @flight = @user.flights.find(params[:id])
  end

  def create
    @flight = Flight.new(airline_id: params[:airline_id], user_id: params[:user_id])
    if @flight.save
      redirect_to user_path(@flight)
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
      # redirect_to user_flights_path(@user)
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
    params.require(:flight).permit(:user_id, :airline_id)
  end

  def find_flight
    @flight = Flight.find_by(id: params[:id])
  end

  def flight_user
    current_user == @flight.user
  end



end
