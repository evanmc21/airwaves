class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      login_error
      render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

private
def login_error
  if params[:email].empty? && params[:password].empty?
    flash[:message] = "Please enter a valid email and password."
  elsif params[:password].empty? && params[:email].present?
    flash[:message] = "Please enter a valid password."
  else
    flash[:message] = "Please enter a valid email"
  end
end

  def auth
    request.env['omniauth.auth']
  end
end
