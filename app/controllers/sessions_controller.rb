class SessionsController < ApplicationController

  def new
  end

  def create
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
    user = User.find_by(email: params[:user][:email])
    if user = user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

private
  # def login_error
  #   if params[:email].empty?
  #     flash[:message] = "Please enter a valid email."
  #   elsif !@user.authenticate(params[:password])
  #     flash[:message] = "Please enter a valid password."
  #   else
  #     flash[:message] = "Please fill out all fields."
  #   end
  #   if params[:email].empty? || params[:password].empty?
  # 			flash[:message] = "Please enter a valid email and password."
  # 		end
  # end

  def auth
    request.env['omniauth.auth']
  end
end
