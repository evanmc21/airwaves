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
  end

  def show

  end


  def create
    @airline = Airline.new(airline_params)
    if @airline.save
      redirect_to airline_path(@airline)
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
