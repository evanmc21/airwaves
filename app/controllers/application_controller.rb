class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
     current_user != nil
  end

  def authorization_required
    if !(current_user == User.find(params[:user_id]))
      flash[:message] = "You are not authorized to view other user's accounts."
      redirect_to user_path(current_user)
    end
  end

  def redirect_if_not_current_user
		if !(current_user == User.find(params[:id]))
			flash[:message] = "You may not view another User's account."
			redirect_to user_path(current_user)
		end
	end


  def authentication_required
    if !logged_in?
      flash[:message] = "You must be logged in to view that page."
      redirect_to root_path
    end
  end

end
