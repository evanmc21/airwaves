class ApplicationController < ActionController::Base

  include ApplicationHelper

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def authorization
    if current_user != user.id
      flash[:message] = "You are not authorized to view other user's accounts."
      redirect_to user_path(current_user)
    end
  end

  def 



end
