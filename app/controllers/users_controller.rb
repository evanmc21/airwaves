class UsersController < ApplicationController

  def new
  end

  def show
  end

  def edit
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :origin_city, :destination_city, :budget)
  end
end
