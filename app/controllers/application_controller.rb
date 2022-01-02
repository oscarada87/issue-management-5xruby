class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_user_admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def current_user_admin?
    current_user&.role&.name == 'admin'
  end

  def authorized
    redirect_to root_url unless logged_in?
  end

  # 404 page
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
