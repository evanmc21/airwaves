module ApplicationHelper

  def current_user
    user ||= User.find(session[:id])
  end

  def logged_in?
    current_user.id !=nil
  end
end
