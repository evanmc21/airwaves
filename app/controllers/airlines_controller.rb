class AirlinesController < ApplicationController
  before_action :find_airline, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  def index

    if params[:airline]
      @airlines = Airline.filter_by_airline(params[:airline][:name])
    elsif params[:user_id]
      @user= User.find(params[:user_id])
      @airlines = @user.airlines
    else
      @airlines = Airline.all
    end
  end

  def new
    @airline = Airline.new
    @flight = Flight.find(params[:flight_id])
  end


  def create
    @flight = Flight.find(params[:airline][:flight_id])
    @airline = @flight.airlines.build(airline_params)
    if @airline.save
      @airline = Airline.new
      redirect_to user_flight_path(@flight.user.id, @flight)
    else
      render :new
    end
  end

  def edit
    if airline_user?
      render :edit
    else
      flash[:message] = "oops. you can only edit your airlines."
      redirect_to user_path(current_user)
    end
  end

  def update
    if @airline.update(airline_params)
      redirect_to user_flight_path(@airline.flight.user, @airline.flight)
    else
      render :edit
    end
  end

  def destroy
    @flight = @airline.flight
    if airline_user?
      @airline.destroy
      @flight.save
      redirect_to user_flight_path(@flight.user, @flight)
    else
      flash[:message] = "oops. you can only delete your airlines."
      redirect_to user_path(current_user)
    end
  end

    private

  def airline_params
      params.require(:airline).permit(:name, :rewards_number)
  end

  def find_airline
    @airline = Airline.find_by(id: params[:id])
  end

  def airline_user?
    current_user == @airline.flight.user
  end

  def airline_name
    if params[:airline]
      @airlines = Airline.filter_by_airline(params[:airline][:name])
    else
      @airlines = Airline.all
    end
  end
end
