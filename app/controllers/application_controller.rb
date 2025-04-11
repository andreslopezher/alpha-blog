class ApplicationController < ActionController::Base

    # This method makes the current_user and logged_in? methods availables in views as well as controllers
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user # Check if current_user is not nil, returns true or false
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # Redirect to the login page if not logged in
    end
  end

end
