class AirlinesController < ApplicationController
  before_action :find_airline, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required
  before_action :current_user

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
    @airline = Airline.find(params[:id])
  end


  def create
    @airline = Airline.new(airline_params)
    if @airline.save
      redirect_to airlines_path
    else
      render :new
    end
  end

  def edit
    if current_user
      render :edit
    else
      flash[:message] = "oops. you can only edit your airlines."
      redirect_to user_path(current_user)
    end
  end

  def update
    if @airline.update(airline_params)
      redirect_to airlines_path
    else
      render :edit
    end
  end

  def destroy
    @airline = Airline.find(params[:id])
    @airline.destroy
    redirect_to airlines_path

  end

    private

  def airline_params
      params.require(:airline).permit(:name, :rewards_number)
  end

  def find_airline
    @airline = Airline.find_by(id: params[:id])
  end

  # def airline_user?
  #   current_user == @airline.flight.user
  # end

  def airline_name
    if params[:airline]
      @airlines = Airline.filter_by_airline(params[:airline][:name])
    else
      @airlines = Airline.all
    end
  end
end
